package com.yellow.service.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yellow.domain.MemberDTO;
import com.yellow.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
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
	
	
}
