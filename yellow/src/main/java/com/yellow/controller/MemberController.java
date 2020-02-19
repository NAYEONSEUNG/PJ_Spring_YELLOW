package com.yellow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yellow.domain.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j //로그 쓸려고 쓴다ㅏ.
@RequestMapping("/member") /* 멤버로 시작하는 놈들은 다 여기로 와라 */
@Controller // 스프링 빈즈로 등록시키겠다.

public class MemberController {
	@GetMapping("/constract")
	public 	String viewConstract() {
		log.info(">>>>>>MEMBER/CONSTRACT PAGE 출력");
		return "member/constract"; //화면단 결정하는 놈
	}
	@GetMapping("/join")
	public 	String viewJoin(MemberDTO mDto) {
		log.info("get방식");
		log.info(mDto.toString());
		return "member/join"; //화면단 결정하는 놈
	}
 

}
