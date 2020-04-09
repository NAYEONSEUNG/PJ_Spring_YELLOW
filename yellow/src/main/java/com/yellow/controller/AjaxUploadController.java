package com.yellow.controller;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yellow.service.board.BoardService;
import com.yellow.utill.MediaUtils;
import com.yellow.utill.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired
	BoardService bService;
	
	//업로드 디렉토리 servlet-contex.xml에 설정되어 있는
	@Resource(name = "uploadPath")// 업로드패스에다가 의존성 주입을 하고 있다. , 오토와이어드, 인젝트, 리소스 // 오토와이어드 스프링에서만들었고, 인텍트는 자바
	String uploadPath;															//autowired, inject는 타입으로 의존성주입해준다.  인터페이스는 객체가 아니다. just 껍데기
																				//오브스트렉트, 클래스는 객체 
//	//파일첨부 페이지로 이동
//	@GetMapping("/upload/uploadAjax")
//	public String uploadAjax() {
//		
//		return "/upload/uploadAjax";
//	}
	//Upload File멀티파트파일에 Save
	@ResponseBody
	@RequestMapping(value="upload/uploadAjax", produces="text/plain;charset=utf-8")// URL타고 들어오는 애들 받을때 UTF8타입으로 받자, @RequestMapping요고 있으면 겟포스트 둘다 받음
																							//@RequestMapping 생략되면 겟포스트 둘다 받음????
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception{// < 꺽새아니고 제네릭, 제네릭은 문지기역할 값들을 체크한다. 타입을 강하게 체크  
		log.info("POST: uploadAjax");
		//업로드한 파일정보와 Http상태 코드를 함께 리턴								//파일넣었을때 찐이름을 알려줌
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);//file.getBytes()바이트 크기를 알려준다.
	}							//대문자로 시작하면 객체 '.'은 참조연산자 //Ajax끝나고 뷰단에 uploadpath: d:/developer/, 파일이름, 파일크기(byte) , httpstatus.ok성공
								//클래스 이름으로 호출하는 경우는 한가지static(객체생성없이 쓸수있음)
	
	//이미지 표시 기능
	@ResponseBody// view가 아닌 data 리턴
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]>displayFile(String fileName) throws Exception{
		//서버의 파일을 다운로드하기 위한 스트링
		InputStream in = null; // java.io
		ResponseEntity<byte[]>entity = null;
		try {
			//확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			//헤더 구성 객체
			HttpHeaders headers = new HttpHeaders();
			//InputStream 생성
			in = new FileInputStream(uploadPath + fileName);
				if(mType != null) {//이미지 파일이면
					headers.setContentType(mType);
				}else {//이미지가 아니면
				fileName = fileName.substring(fileName.indexOf(".")+1);
				// 다운로드용 컨텐트 타입
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				//큰 따옴표 내부에 "\"
				//바이트배열을 스트링으로
				//ISO - 8859-1 서유럽언어
				//new String(fileName.getBytes("utf-8"),"iso-8859-1")
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
				//headers.add("Content-Disposition"
				//,"attachment; filename='"+fileName+"'");
				}
				//바이트배열,ㅏ 헤더
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			if(in != null)
				in.close();//스트링 닫기
		}
			return entity;	
		
	}
	

}
