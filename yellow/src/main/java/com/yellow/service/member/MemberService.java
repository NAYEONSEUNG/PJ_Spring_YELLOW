package com.yellow.service.member;

import javax.servlet.http.HttpSession;

import com.yellow.domain.MemberDTO;

//인터페이스는 객체가아니다. 
public interface MemberService {
	
	//회원가입 id중복체크(AJAX)
	 public int idOver(String id);

	//회원가입(DB에 등록)
	 public int memInsert(MemberDTO mDto);

	//회원정보수정 (DB수정)
	public void memUpdate(MemberDTO mDto, HttpSession session);
	 
	 //1명의 회원정보
	 public MemberDTO userView(String id);
	 
	 //비밀번호 수정: 현재비밀번호 체크
	 public int pwCheck(String id, String pw); 
		 
	 //비밀번호 수정: DB에 수정
	 public void pwUpdate(MemberDTO mDto);
	 
	 //회원 탈퇴 = useyn = n
	 public void memDrop(HttpSession session, String id);
	 
}
