package com.yellow.service.login;
import javax.servlet.http.HttpSession;

//
import com.yellow.domain.MemberDTO;
//인터페이스에서 구현 할 수 없으니까  impl클래스 하나 더 만들어서 거기서 구현 하도록 한다.
public interface LoginService {
	//로그인
	public int login(MemberDTO mDto, HttpSession session);
	
	//로그아웃
	public void logout(HttpSession session);
}
