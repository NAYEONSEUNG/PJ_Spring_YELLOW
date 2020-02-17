package com.yellow.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	@GetMapping("/index")
	public String indexView(Model model) {
		log.info(">>> INDEX PAGE 출력");
//		iService.bestPdtList();
		
		//1.view단에 출력할 데이터
//		List<ProductDTO>list = iService.bestPdtList();
		model.addAttribute("BestPdt", iService.bestPdtList()); //앞에가 이름표 뒤에가 담을 데이터
		//2.출력할 화면을 결정
		return "index";
	}

}
