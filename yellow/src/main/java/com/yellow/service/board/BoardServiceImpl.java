package com.yellow.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	public List<BoardDTO> newBoardList(String sort_option, String search_option, String keyword, int start, int end) {
		Map<String, Object>map = new HashMap<>();
		map.put("sort_option", sort_option);
		map.put("start", start);
		map.put("end", end);
		map.put("search_option",search_option);
		map.put("keyword", "%"+keyword+"%");
		/*
		 * List<BoardDTO> list = bDao.newBoardList(map); for (BoardDTO boardDTO : list)
		 * { log.info(boardDTO.toString());
		 * 
		 * }
		 */
		return bDao.newBoardList(map);
	}
	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String>map = new HashMap<>();
		map.put("search_option",search_option);
		map.put("keyword", "%"+keyword+"%");
		return bDao.countArticle(map);
	}
	@Override
	public BoardDTO viewBoard(int bno) {
		
		return bDao.viewBoard(bno);
	}


}
