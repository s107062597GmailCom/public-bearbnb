package team.lazybear.bearbnb.service;


import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.Part;

import team.lazybear.bearbnb.config.MainConfig;

public  class FileService {
	public static String uploadPhoto(String fileName,Part photo) {
		try {
			InputStream in = photo.getInputStream();
			String photoPath = MainConfig.Directory.ROOM_PHOTO+fileName+".jpg";
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
		
		String photoPath = MainConfig.Directory.ROOM_PHOTO+uuid+".jpg";
		
		try {
			FileInputStream fis = new FileInputStream(photoPath);
			byte[] bytes = fis.readAllBytes();
			return bytes;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	
}
