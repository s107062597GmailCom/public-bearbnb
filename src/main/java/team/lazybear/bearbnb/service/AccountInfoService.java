package team.lazybear.bearbnb.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import javax.security.auth.login.LoginException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.AccountInformation;
import team.lazybear.bearbnb.model.AccountStatus;
import team.lazybear.bearbnb.repository.AccountInfoRepository;

@Service
@Transactional
public class AccountInfoService {

	@Autowired
	AccountInfoRepository accountInfoRepository;
	@Autowired
	AccountService aService;

	public AccountInformation insert(AccountInformation accountInformation) {
		return accountInfoRepository.save(accountInformation);
	}
	
	public AccountInformation saveInfoToBean(AccountInformation accInfo , String first_name, String last_name, Character gender,
			String phone_number, String email, String birthday) {
		accInfo.setFirstName(first_name);
		accInfo.setLastName(last_name);
		accInfo.setGender(gender);
		accInfo.setPhoneNumber(phone_number);
		accInfo.setEmail(email);
		
		try {			
			accInfo.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(birthday));
		} catch (ParseException e) {
			throw new RuntimeException("日期格式錯誤");
		}
		return accInfo;
	}

	public AccountInformation findById(long id) {
		Optional<AccountInformation> accInfo = accountInfoRepository.findById(id);
		if (accInfo.isPresent()) {
			return accInfo.get();
		}
		return null;
	}

	public AccountInformation signUpAccInfo(String username, String first_name, String last_name, Character gender,
			String phone_number, String email, String birthday) {
		AccountInformation accInfo = new AccountInformation();
		AccountInformation accInfoNew = new AccountInformation();
		accInfoNew = saveInfoToBean(accInfo, first_name, last_name, gender, phone_number, email, birthday);
		accInfoNew.setAccount(aService.findByUsername(username));
		return accInfoNew;
	}
	

	public String existByEmail(String email) {
		AccountInformation accountInformation = accountInfoRepository.findByEmail(email);
		if (accountInformation == null) {
			return null;
		}
		return accountInformation.getEmail();
	}

	public String existByPhoneNumber(String phoneNumber) {
		AccountInformation accountInformation = accountInfoRepository.findByPhoneNumber(phoneNumber);
		if (accountInformation == null) {
			return null;
		}
		return accountInformation.getPhoneNumber();
	}

	public boolean existByMailNPhone(String email, String phoneNumber) {
		AccountInformation cEmail = accountInfoRepository.findByEmail(email);
		AccountInformation cPhone = accountInfoRepository.findByPhoneNumber(phoneNumber);
		if (cEmail == null && cPhone == null) {
			return false;
		}
		return true;
	}

}
