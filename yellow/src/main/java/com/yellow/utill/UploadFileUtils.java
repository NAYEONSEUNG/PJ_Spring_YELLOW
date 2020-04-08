package com.yellow.utill;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UploadFileUtils {
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData)throws Exception{//파일이 로컬에 들어가는 것을 볼수가 있는 메서드
		//uuid 발급
		UUID uid = UUID.randomUUID(); //중복될수도 있으니 
		String savedName = uid.toString() + "_" + originalName;
		//업로드할 디렉토리 생성
		String savedPath = calcPath(uploadPath);//카렌다 날마다 넣는것을 다르게 해주는것 
		File target = new File(uploadPath + savedPath, savedName);
		//임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);//파일데이타 진짜 올려하는 파일, 타겟은어디에 어떤이름으로 (셋팅값) // 어디에 어떤이름으로 첨부파일을 ㄱㄱ
		//파일의 확장자 검사
		//a.jpg/ aaa.bbb.ccc.jpg
		String formatName = originalName.substring(originalName.lastIndexOf(".") +1);// 포맷네임에 확장자가 들어온다. 
		String uploadedFileName = null;
		//이미지 파일은 썸네일 이용
		if(MediaUtils.getMediaType(formatName) !=null) {
			//썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		}else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
		
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();// 달력값을 가지고와라(오늘달력)
		String yearPath = File.separator + cal.get(Calendar.YEAR);// separator는 구분자 2020이 들어온다. 
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);// /2020/04
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));// /2020/04/08
		makeDir(uploadPath, yearPath, monthPath, datePath);
		log.info(datePath);
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String ...paths) {//String ...은 동일한 타입의 매개변수를 여러개 받을때 쓰는것, 동적으로 매개변수가 바뀔때 
		//디렉토리가 존재하면 skip											
		if(new File(paths[paths.length - 1]).exists()) {//paths에서 마지막 값을 꺼내서  파일(폴더)이(가) 있으면 종료하고 없으면 밑의 포문으로 내려간다. 
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path); // c://developer/upload + /2020 
			if(!dirPath.exists()) {
				dirPath.mkdir();//디렉토리 생성
			}
		}
	}
	
	private static String makeIcon(String uploadPath, String path, String fileName)throws Exception {
		//아이콘의 이름
		String iconName = uploadPath + path + File.separator + fileName;
		//아이콘 이름을 리턴
		//File.separatorChar : 디렉토리 구분자
		//윈도우  \, 유닉스 (리눅스) /
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');//replace 치환하라 \를 /로 다 바꿔준다.
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName)throws Exception {
		//이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));// source 이미지가 원본 이미지
		//100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);//scalr가 썸네일 만들어주는 놈 , 무조건 헤이트는 100이 나온다.
		//썸네일 이름
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		//썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);// 본격적인 제대로된 썸네일을 만든다. 
		//썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar,	'/');
	}
}//class
