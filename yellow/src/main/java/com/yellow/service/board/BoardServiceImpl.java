package com.yellow.service.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yellow.domain.BoardDTO;
import com.yellow.persistence.BoardDAO;

import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSession sqlSession;
	BoardDAO bDao;
	@Autowired
	public void newBoardDAO() {
		bDao= sqlSession.getMapper(BoardDAO.class);
	}
	@Override
	public List<BoardDTO> newBoardList() {
		
		List<BoardDTO> list = bDao.newBoardList();
		for (BoardDTO boardDTO : list) {
		log.info(boardDTO.toString());	
		}
		return bDao.newBoardList();
	}

	/*
	 * @Override public int boardinsert(BoardDTO bDto) { // TODO Auto-generated
	 * method stub return 0; }
	 */

}
