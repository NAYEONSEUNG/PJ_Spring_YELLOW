package com.yellow.service.reply;

import java.util.HashMap;
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

	@Override
	public void insert(ReplyDTO rDto) {// tbl_board
		//비즈니스 로직
		//해당 게시글에 댓글을 등록하고,
		//해당 게시글의 reply_cnt를 +1함,
		
		//1.댓글 등록
		rDao.insert(rDto);
		
		//2.게시글 댓글 + 1
		HashMap<String,Object>map = new HashMap<>();
		map.put("bno", rDto.getBno());
		map.put("type", "plus");
		//rDao.replyCntPlus(rDto.getBno());// bno는 이미 rDto에 담겨있으니까 거기에 get을 사용해서 거기에있는 bno을 가져오도록 한다.
		rDao.replyCntUpdate(map);
	}

	@Override
	public void delete(int rno, int bno) {
		// TODO Auto-generated method stub
		
		rDao.delete(rno);
		
		HashMap<String,Object>map = new HashMap<>();
		map.put("bno", bno);
		map.put("type", "minus");
		//rDao.replyCntMinus(bno);
		rDao.replyCntUpdate(map);
	}

	
}//class
