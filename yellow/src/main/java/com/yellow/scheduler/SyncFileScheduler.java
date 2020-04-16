package com.yellow.scheduler;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.annotation.Resources;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.yellow.domain.AttachDTO;
import com.yellow.persistence.BoardDAO;
import com.yellow.utill.MediaUtils;


import lombok.extern.slf4j.Slf4j;

// 게시글 첨부파일 사용시
// 로컬에 저장된 첨부파일과
// DB에 저장된 첨부파일 이름이
// 매칭이 안되는 경우 아무도 사용하지 않는 파일
// 고로 로컬에서 삭제!!
// 하루에 한번식 새벽시간에 전날 로컬첨부파일 폴더를 대상으로 

@Slf4j
@Component
public class SyncFileScheduler {

	
	@Autowired
	private SqlSession sqlSession;
	BoardDAO bDao;
	@Autowired
	public void newBoardDAO() {
		bDao= sqlSession.getMapper(BoardDAO.class);
	}
	
	//@Resource(name = "uploadPath")
	String uploadPath = "C:/developer/upload";
	
	//하루 전날 파일 목록 가져오기
	private String getFolderYesterday() {
		//format형식 생성
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd"); // formating 할려고 yyyy-mm-dd // 포멧팅 만들어 놓은것
		//오늘 날짜 가져오기 ex) 2020-04-16
		Calendar cal = Calendar.getInstance();//전역변수로 호출
		// 오늘 날짜에서 -1해서 어제로 설정
		cal.add(Calendar.DATE, -1);
		//어제날짜 yyyy-MM-dd 로 설정 ex)2020-04-15,  -1했으니까 15가 된다.
		String str = sf.format(cal.getTime());
		//File.separator은 /또는 \ 로 파일경로를 분리
		//2020-04-15 2020\04\15으로 변경
		return str.replace("-", File.separator);
	}
	
	//매일 새벽 2시에 첨부파일 목록과 db를 비교해서
	//db에 없는 첨부파일을 로컬 디렉토리에서 삭제
	
	@Scheduled(cron = "0 0 2 * * *")//새벽 2시로 맞추어놓음
	public void checkFiles()throws Exception {
		log.warn("File Check Task run ...........................");
		log.warn("" + new Date());
		
		//DB에 등록되어 있는 첨부파일 목록 불러오기
		//cal.add(Calendar.DATE, -1); // 주석해제하면 하루전날것을 가져온다.
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd"); // 현재날짜: 20200416 // yyyymmdd와 보드매퍼의 yyyymmdd와 타입을 완전히 같게해줘야 파일이 들어온다. 
		
		//오늘 날짜 가져오기 ex) 2020-04-16
		Calendar cal = Calendar.getInstance();//전역변수로 호출
		cal.add(Calendar.DATE, -1); 
		log.info("어제날짜: "+ sf.format(cal.getTime()));
		List<AttachDTO> fileList = bDao.getOldFiles(sf.format(cal.getTime()));
		
		//log.info("filelist" + fileList.toString());
		
//		for(AttachDTO one: fileList) {
//			log.info(one.toString()); //AttachDTO(fullname=/2020/04/16/s_c346ef10-c6fe-40d3-8865-176cd3600275_뿔충이.png, bno=9, regdate=Thu Apr 16 11:30:26 KST 2020) 
//		}
		//fileList에 담긴이름
		//fullname=/2020/04/16/s_c346ef10-c6fe-40d3-8865-176cd3600275_뿔충이.png, bno=9, regdate=Thu Apr 16 11:30:26 KST 2020
		

						//paths에 C:/developer/upload/
		List<Path> fileListPaths = fileList.stream()//스트림은 배열에 있는 값들을 하나씩 꺼내온다. , 맵은 스트림이없으면 못쓴다. 스트림이 있어야 꺼내올수가 있다. 
					.map(dto -> Paths.get(uploadPath+dto.getFullname()))// 람다식은 자바8버전부터 들어온다. 람다식은 만능이 아니다. 람다식은 단순반복작업 할때 좋다.
												//화살표 우측은 매개변수(일반변수 X) , 우측에있는게 실행하는 코드 , 함수
					.collect(Collectors.toList());// 전처리까지 다 된작업을 다시 내가 어딘가에 저장하고 싶은것, 스트림으로 꺼내고 맵으로 정제하고 다시 집어넣기 

		//이미지 파일이면 DB에 썸네일 이미지파일이 등록돼있기 때문에 파일 목록에 원본이미지 파일도 등록
		//파일목록에 원본이미지 파일도 등록
		for(AttachDTO avo : fileList) {
			String fileName = avo.getFullname();
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				//File.separatorChar: 유직스/ 윈도우즈\
				fileListPaths.add(Paths.get(uploadPath+(front+end).replace('/', File.separatorChar)));// 여기에서 원본이미지 등록이 딱 나온다. 
			}
		}
		//파일목록 : 파일, 원본이미지, 썸네일 이미지 
		fileListPaths.forEach(p -> log.info("" +p));
		//하루전날 첨부파일 저장 폴더 만들기 
		File targetDir = Paths.get(uploadPath, getFolderYesterday()).toFile(); // targetDir 는 전날폴더의 파일들 목록 , 타겟딜은 로컬꺼다. 
		
		//디렉토리의 파일모록 (디렉토리포함)을 File배열로 반환
		//DB 첨부파일 목록과 하루전 폴더의 첨부파일과 매칭!
		// ->DB에 없는 첨부파일 목록 = 삭제 목록 생성
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);// contains 포함하고 있냐 어쩌냐를 물어보는것
																							//정상이면 false를 반환
		//DB에 등록되지 않은 첨부파일 삭제 시작!
		log.warn("=====================================================");
		for(File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}	
}
