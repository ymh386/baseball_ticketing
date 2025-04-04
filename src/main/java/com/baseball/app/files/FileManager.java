package com.baseball.app.files;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;


@Component
public class FileManager {
	
	
	// 파일 삭제
	public void fileDelete(String path, String fileName) throws Exception {
		
		File file = new File(path, fileName);
		
		if(file.exists()) {
			boolean check = file.delete();
		}
		
	}
	
	
	// 파일 저장
	public String fileSave(String path, MultipartFile newFile) throws Exception {
		
		File file = new File(path);
		
		// 경로 생성
		if(!file.exists()) {
			file.mkdirs();
		}
		
		// 새 파일명 생성
		String randomName = UUID.randomUUID().toString();
		String newName = randomName + "_" + newFile.getOriginalFilename();
		
		// HDD에 카피본 저장
		file = new File(file, newName);		
		FileCopyUtils.copy(newFile.getBytes(), file);
		
		
		return newName;
	}
	
	
	
	
	
	
}
