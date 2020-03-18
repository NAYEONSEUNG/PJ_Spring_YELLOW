package com.yellow.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<BoardDTO> newBoardList(int start, int end) {
		Map<String, Object>map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		/*
		 * List<BoardDTO> list = bDao.newBoardList(map); for (BoardDTO boardDTO : list)
		 * { log.info(boardDTO.toString());
		 * 
		 * }
		 */
		return bDao.newBoardList(map);
	}
	@Override
	public int countArticle() {
		return bDao.countArticle();
	}

}
