package com.yellow.persistence;

import com.yellow.domain.MemberDTO;

public interface LoginDAO {
	//로그인
	public MemberDTO loginUser(MemberDTO mDto);
	
	//이메일 인증 유무 체크
//	public MemberDTO authCheck(MemberDTO mDto);

}
