package team.lazybear.bearbnb.service;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.config.MainConfig;
import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.AccountPhoto;
import team.lazybear.bearbnb.repository.AccountPhotoRepository;

@Service
public class AccountPhotoService {
	@Autowired
	private AccountPhotoRepository accountPhotoRepository;
	
	public AccountPhoto insert() {
		return accountPhotoRepository.save(new AccountPhoto());
	}
	
	public AccountPhoto newAccPhoto(Account account) {
		AccountPhoto accphoto = new AccountPhoto();
		account.setPhoto(accphoto);
		accphoto.setAccount(account);
		accphoto.init();
		save(accphoto);
		return accphoto;
	}
	
	public void save(AccountPhoto accountPhoto) {
		accountPhotoRepository.save(accountPhoto);
		
	}
	
	public static String uploadPhoto(String fileName,Part photo) {
		try {
			InputStream in = photo.getInputStream();
			String photoPath = MainConfig.Directory.USER_PHOTO+fileName+".jpg";
			FileOutputStream out = new FileOutputStream(photoPath);
			byte[] buf = new byte[1024];
			while(in.read(buf)!=-1) {
				out.write(buf);
			}
			in.close();
			out.close();
			return photoPath;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}finally {
		}
	}
	
	public static byte[] getPhotoByUUID(String uuid) {
		
		String photoPath = MainConfig.Directory.USER_PHOTO+uuid+".jpg";
		
		try {
			try (FileInputStream fis = new FileInputStream(photoPath)) {
				byte[] bytes = fis.readAllBytes();
				return bytes;
			}
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	

}
