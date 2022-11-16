package team.lazybear.bearbnb.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.Order;
import team.lazybear.bearbnb.repository.AccountRepository;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.security.auth.login.LoginException;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.AccountInformation;
import team.lazybear.bearbnb.model.AccountPhoto;
import team.lazybear.bearbnb.repository.AccountInfoRepository;
import team.lazybear.bearbnb.repository.AccountRepository;
import team.lazybear.bearbnb.repository.AccountReposity;


@Service
@Transactional
public class AccountService {
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private AccountReposity accRep;
	@Autowired
	private AccountInfoRepository accountInfoRepository;
	@Autowired
	private AccountIdentityService accountIdentityService;
	@Autowired
	private AccountStatusService accountStatusService;
	@Autowired
	private AccountPhotoService accountPhotoService;
	
	
	public Account insert (Account account) {return accountRepository.save(account);}
	public Account findByUsername(String username) {return accountRepository.findByUserame(username);}	
	
	public List<Account> findAll(){return accountRepository.findAll();}
	public List<Account> likeSearchfromAccount(String likeName){return accountRepository.likeSearch(likeName);}
	
	
	
	// 沒事，就想寫來看看
	public Account findById(Long id) {
		Optional<Account> optional = accountRepository.findById(id);
		if(optional.isPresent()) {return optional.get();}
		return null;
	}
	
	public Account specialFindByUsername(String username, String password) throws LoginException {
		/* 
		 * 錯誤碼訊息：
		 * 1.請輸入帳號 / 2.無此帳號，請重新輸入或註冊 / 3.請輸入密碼 / 4.密碼錯誤，請重新輸入 / 5.產生不可預期的錯誤，請重新輸入或註冊
		 */
		if (username == null || username.length() == 0) {throw new LoginException("1");}
		if (password == null || password.length() == 0) {throw new LoginException("3");}
		if (username != null && password != null) {
			Account user = accRep.findByUsername(username);
			// 如果沒有這個帳號
			if (user == null) {throw new LoginException("2");}
			// 如果有帳號但密碼錯了
			else if ( user != null ) {
				String pwd = md5Encrypt( password, user.getSalt());
				if ( !user.getPassword().equals(pwd) ) {throw new LoginException("4");}
			}
			return user;
		}
		throw new LoginException("5");
	}
	
	public Account specialInsert(Account account) {
		String id = existByUsername(account.getUsername());
		if(id != null) {throw new RuntimeException("您申請的用戶已存在");}
		return accRep.save(account);
	}
	public Account signUpAccount(String username, String password) {
		Account acc = new Account();
		/* 資料庫or系統自動產生欄位 */
		// id為自動產生、uuid跟createdAt是由Bean方法填入
		// 鹽值去bean裡面寫方法照uuid的生成方式依樣畫葫蘆
		acc.init();
		/* insert into table account */
		// 使用者填入欄位
		acc.setUsername(username);
		// 灑鹽消化囉
		acc.setPassword(md5Encrypt(password, acc.getSalt()));

		// 寫死在代碼裡面的權限與狀態
		acc.setIdentity(accountIdentityService.findById(1));
		acc.setStatus(accountStatusService.findById(2));
		
		return acc;
	}
	
	
	
	
	public Account updateInsert(Account account, String password) {
		account.setPassword(md5Encrypt(password, account.getSalt()));
		return accRep.save(account);
	}
	
	public String existByUsername(String username) {
		Account account = accRep.findByUsername(username);
		if(account != null) {return account.getUsername();}
		return null;
	}
	public Page<Account> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 10, Sort.Direction.DESC,"createdAt");
		
		Page<Account> page = accountRepository.findAll(pgb);
		
		return page;
	}
	
	public String md5Encrypt(String str, String salt)  {
		String result = str + salt;
		return org.apache.commons.codec.digest.DigestUtils.md5Hex(result);
//		return DigestUtils.md5DigestAsHex(result.getBytes());
	}
	
	public Account createNewAccount(Account account, AccountInformation accountInformation,Part photo) {
		accRep.save(account);
		accountInformation.setAccount(accRep.findByUsername(account.getUsername()));
		accountInfoRepository.save(accountInformation);
		accountPhotoService.newAccPhoto(account);
		String accPhotoUuid = account.getPhoto().getUuid();
		if(accPhotoUuid != null) {
			//照片資料庫裡有這筆uuid表以上所有資料皆新增成功，將uuid作為檔案名綁在photo物件上丟進資料夾
			AccountPhotoService.uploadPhoto(accPhotoUuid, photo);
			Account accountNew = findById(account.getId());
			return accountNew;
		}else {return null;}	
	}
	
	public Account updateAccount(Account account, AccountInformation accountInformation,Part photo) {
		/*照片UUID不換，單純抽換對應資料夾中的檔案*/
		accRep.save(account);
		accountInfoRepository.save(accountInformation);
		String accPhotoUuid = account.getPhoto().getUuid();
		if(accPhotoUuid != null) {
			//照片資料庫裡有這筆uuid表以上所有資料皆新增成功，將uuid作為檔案名綁在photo物件上丟進資料夾，可直接更新
			AccountPhotoService.uploadPhoto(accPhotoUuid, photo);
			Account accountNew = findById(account.getId());
			return accountNew;
		}else {return null;}	
	}
	
	public Account updateAccount(Account account, AccountInformation accountInformation) {
		accRep.save(account);
		accountInfoRepository.save(accountInformation);

		
		Account accountNew = findById(account.getId());
		return accountNew;
	}

	
	
}
