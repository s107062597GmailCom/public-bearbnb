package team.lazybear.bearbnb.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import team.lazybear.bearbnb.config.MainConfig;

@Controller
@RequestMapping("/photo")
public class PhotoController {

    @GetMapping("/room/{uuid}")
    public ResponseEntity<byte[]> downloadImage(@PathVariable String uuid) {
        File file = new File(MainConfig.Directory.ROOM_PHOTO + "/" +
                uuid + ".jpg");

        byte[] fileBytes = null;
        try (BufferedInputStream bis = new BufferedInputStream(
                new FileInputStream(file))) {
            fileBytes = new byte[bis.available()];
            bis.read(fileBytes);
        } catch (IOException e) {
            e.printStackTrace();
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<byte[]>(fileBytes, headers, HttpStatus.OK);
    }

    @GetMapping("/account/{uuid}")
    public ResponseEntity<byte[]> downloadAccountImage(@PathVariable String uuid) {
        File file = new File(MainConfig.Directory.USER_PHOTO + "/" +
                uuid + ".jpg");

        byte[] fileBytes = null;
        try (BufferedInputStream bis = new BufferedInputStream(
                new FileInputStream(file))) {
            fileBytes = new byte[bis.available()];
            bis.read(fileBytes);
        } catch (IOException e) {
            e.printStackTrace();
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<byte[]>(fileBytes, headers, HttpStatus.OK);
    }

}
