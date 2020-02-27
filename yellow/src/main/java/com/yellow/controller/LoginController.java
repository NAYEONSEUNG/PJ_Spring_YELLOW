package com.yellow.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yellow.domain.MemberDTO;
import com.yellow.service.login.LoginService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/login")
@Slf4j
@Controller
public class LoginController {
	@Autowired
	LoginService lService;

	@ResponseBody
	@PostMapping("/in")
	public Integer logIn(MemberDTO mDto, HttpSession session) {//컨트롤러단 매개변수에 객체를 집어넣으면 스프링이 자동으로 객체생성을 해준다. 
		log.info(">>>>POST: LOGIN/LOGIN ACTION");
		log.info(mDto.toString());
		
	
		//로그인
		int result = lService.login(mDto, session);//세션 객체를 생성해야함. 로그인 비즈니스로직을 처리하는놈
		
		return result;
	}
}
