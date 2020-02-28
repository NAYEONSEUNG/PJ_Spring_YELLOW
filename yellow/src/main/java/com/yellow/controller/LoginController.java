package com.yellow.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yellow.domain.MemberDTO;
import com.yellow.service.login.LoginService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/login")
@Slf4j
@RestController// 이놈있으면 @ResponseBody 이거없어도 자동으로 붙혀준다.
public class LoginController {
	@Autowired
	LoginService lService;

	
	@PostMapping("/in")
	public Integer logIn(MemberDTO mDto, HttpSession session) {//컨트롤러단 매개변수에 객체를 집어넣으면 스프링이 자동으로 객체생성을 해준다. 
		log.info(">>>>POST: LOGIN/LOGIN ACTION");
		log.info(mDto.toString());
		
	
		//로그인
		int result = lService.login(mDto, session);//세션 객체를 생성해야함. 로그인 비즈니스로직을 처리하는놈
		
		return result;
	}

	@PostMapping("/out")
	public void logOut(HttpSession session) {
		log.info(">>>>>>>>POST: LOGOUT/LOGOUT ACTION");
		
		lService.logout(session);
	}
}
