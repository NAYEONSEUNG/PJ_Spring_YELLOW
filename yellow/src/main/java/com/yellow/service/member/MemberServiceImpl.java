package com.yellow.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.yellow.domain.MemberDTO;
import com.yellow.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	@Override
	public int idOver(String id) {
		return mDao.idOverlap(id);
	}

	@Override
	public int memInsert(MemberDTO mDto) {	
		return mDao.memInsert(mDto);//리턴하면 결과값을 돌려주는건데 호출문이있으면 호출해온 결과값을 그대로 토스하겠다는 말
				//호출문이있으면 호출을 먼저하고 mDao니까 멤버다오클래스가서 멤인서트호출하고 매개변수로dto값 주겠다. 그리고 그 결과값을 토스하겠다. 
	}

	@Override
	public MemberDTO userView(String id) {
		
		return mDao.userView(id);
	}

	@Override
	public void memUpdate(MemberDTO mDto, HttpSession session) {
		int result = mDao.memUpdate(mDto);
		
		if(result > 0) {
			//세션에 로그인유저 정보를 수정된 정보로 변경			
			session.removeAttribute("name");// 세션에 담겨있는 네임값을(로그인 정보는 항상 세션에 넣기로 했다.)
			session.setAttribute("name", mDto.getName());// 이 네임으로 바꿔주라
		}
		
		
		//return mDao.memUpdate(mDto); 수정에 성공했나 볼려고 하는것이니까 지워도 된다.
	}

	@Override
	public int pwCheck(String id, String pw) {		
		String encPw = mDao.pwCheck(id);
		int result = 0;
		if(passwordEncoder.matches(pw, encPw)) {
			result = 1;
		}
		//return mDao.pwCheck(id, pw);
		return result;
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
		mDao.pwUpdate(mDto);
	}
		
}
