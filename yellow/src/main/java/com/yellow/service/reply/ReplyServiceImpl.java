package com.yellow.service.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yellow.domain.ReplyDTO;
import com.yellow.persistence.ReplyDAO;
import com.yellow.service.board.BoardServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private SqlSession sqlSession;
	
	private ReplyDAO rDao;
	@Autowired
	public void newReplyDAO() {
		rDao= sqlSession.getMapper(ReplyDAO.class);
	}

	@Override
	public List<ReplyDTO> list(int bno) {//결과값을 당연히 List<ReplyDTO> 담아야 한다. 
		
		return rDao.list(bno);
	}

}
