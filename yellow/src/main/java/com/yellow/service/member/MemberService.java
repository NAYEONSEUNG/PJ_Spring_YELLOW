package com.yellow.service.member;

import com.yellow.domain.MemberDTO;

//인터페이스는 객체가아니다. 
public interface MemberService {
	
	//회원가입 id중복체크(AJAX)
	 public int idOver(String id);

	//회원가입(DB에 등록)
	 public int memInsert(MemberDTO mDto);
}
