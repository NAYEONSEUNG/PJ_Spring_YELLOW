package com.yellow.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yellow.service.board.BoardService;
import com.yellow.utill.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired
	BoardService bService;
	
	//업로드 디렉토리 servlet-contex.xml에 설정되어 있는
	@Resource(name = "uploadPath")
	String uploadPath;
	
	//파일첨부 페이지로 이동
	@GetMapping("/upload/uploadAjax")
	public String uploadAjax() {
		
		return "/upload/uploadAjax";
	}
	//Upload File멀티파트파일에 Save
	@ResponseBody
	@PostMapping(value="upload/uploadAjax", produces="text/plain;charset=utf-8")// URL타고 들어오는 애들 받을때 UTF8타입으로 받자
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{// < 꺽새아니고 제네릭, 제네릭은 문지기역할 값들을 체크한다. 타입을 강하게 체크  
		//업로드한 파일정보와 Http상태 코드를 함께 리턴
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);//file.getBytes()바이트 크기를 알려준다.
	}																//Ajax끄나고 뷰단에 uploadpath: d:/developer/, 파일이름, 파일크기(byte) , httpstatus.ok성공
		
}
