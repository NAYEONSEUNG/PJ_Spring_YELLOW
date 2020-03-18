package com.yellow.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yellow.domain.ProductDTO;
import com.yellow.service.index.IndexService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	// @Inject, @Autowired, @Resource중 1개라도 붙어있으면 의존성 주입
	
	//@Inject와 @Autowired는 타입으로 의존성 주입 //타입은 변수타입을 말한다. 
	//인젝트는 자바에서 지원, 오토와이어드는 스프링에서 지원한다. 
	//@Resource는 변수명으로 의존성 주입
	
	@Autowired
	IndexService iService;
	@RequestMapping("/") //프로젝트 /만 입력해도 들어가진다.
	public String indexView(Model model, HttpSession session) {
		log.info(">>> INDEX PAGE 출력");
//		iService.bestPdtList();
		
		//1.view단에 출력할 데이터 베스트상품
//		List<ProductDTO>list = iService.bestPdtList();
		//model: 컨트롤러에서 화면단으로 데이터 보낼때 쓰는것
		model.addAttribute("BestPdt", iService.bestPdtList()); //앞에가 이름표 뒤에가 담을 데이터
		
		//2.view단에 출력할 베스트상품 
		//:신상품 4건을 출력하는 비즈니스 로직을 처리하는 서비스단으로 이동
		model.addAttribute("NewPdt", iService.newPdtList());					
//		iService.newPdtList();
		model.addAttribute("NewPdt2", iService.newPdtList2());
		
		//개발 종료시 삭제하자!!(관리자 자동로그인)
//		session.removeAttribute("userid");//세션영역에서 유저아이디 이름값을 지우고 새로운 아이디 값을 넣어주겠다는말. 굳이 안써도 되는코드지만 쓰는것을 권장 (removeAttribute)
//		session.removeAttribute("name");
//		session.setAttribute("userid", "mrblack");//세션에 값을 담음
//		session.setAttribute("name", "관리자");
		
		//2.출력할 화면을 결정
		return "index";
		
		
	}
	
}
