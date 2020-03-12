package com.yellow.service.login;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.yellow.domain.MemberDTO;
import com.yellow.persistence.LoginDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service // 꼭 붙혀야한다. 로그인 서비스 구현을 하겠다고 implements loginservice 써주고
public class LoginServiceImpl implements LoginService {

	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;

	private LoginDAO lDao;

	@Autowired
	public void newMemberDAO() {
		lDao = sqlSession.getMapper(LoginDAO.class);
	}

	@Override
	public int login(MemberDTO mDto, HttpSession session) {// 로그인 서비스도 int login으로 해줘야한다.
		// 비즈니스로직 처리
		// 1. DB에가서 회원인지 아닌지 유무체크
		MemberDTO loginDto = lDao.loginUser(mDto);// 1이면 회원이고 1이 아니면 회원이 아니다.
		log.info("♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣♣로그인 결과");

		// 로그인 결과값
		int result = 0;

		// result 결과
		// 0: 등록된 회원이 아닙니다. 회원가입을 진행해 주세요.
		// 2: 이메일인증을 하셔야만 로그인을 할 수 있습니다.
		// 1: 로그인 성공
		// 3: 아이디 또는 비밀번호가 잘못되었습니다. 다시 확인해 주세요.

		// 회원정보가 없는경우
		if (loginDto == null) {
			result = 0;
			return result;// 회원정보가 없으면 여기서 끝내버려야 한다. 리턴보내서
		}
		
		//탈퇴한 회원인 경우
		if(loginDto.getUseyn().equals("d")) {
			result = 3;
			return result;
		}
		
		// 인증 안 했을 경우
		if (!(loginDto.getUseyn().equals("y"))) {// y가 아닌 경우
			result = 2;
			return result;// 인증이 안됐을때고 아래로 가면 안되니까 여기서 끝냄
		}
		// 회원정보가 있고 인증을 한 경우
		if (loginDto != null) {
			// 아이디와 패스워드가 같은지 체크
			if (passwordEncoder.matches(mDto.getPw(), loginDto.getPw())) {
				//로그인 진행
				result = 1;
				//세션에 로그인유저 정보를 저장
				session.removeAttribute("userid");//세션영역에서 유저아이디 이름값을 지우고 새로운 아이디 값을 넣어주겠다는말. 굳이 안써도 되는코드지만 쓰는것을 권장 (removeAttribute)
				session.removeAttribute("name");
				session.setAttribute("userid", loginDto.getId());//세션에 값을 담음
				session.setAttribute("name", loginDto.getName());
				
			} else {
				result = 3;

			}
		}

		// 2. DB결과에 따라 동작
		// -회원인데 인증을 안 한 경우
		// -회원인데 인증한 경우
		// -회원이 아닌경우

		return result;
	}

	@Override
	public void logout(HttpSession session) {
		//비즈니스 로직: 로그아웃
		
		//세션을 초기화
		session.invalidate();
	}

}
