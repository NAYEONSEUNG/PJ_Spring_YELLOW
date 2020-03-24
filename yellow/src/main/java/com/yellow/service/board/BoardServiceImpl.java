package com.yellow.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	@Override
	public void increaseViewCnt(int bno, HttpSession session) {
		//EX) now_time : 현재시간
		// 	  plus_time : 조회수 + 1 시간
		//    now_time - plus_time = 조회수 + 1 증가후 지난시간
		
		long update_time=0; // 조회수 +1증가한 시간
		
		if(session.getAttribute("update_time_"+bno)!= null) {//세션에가서 update_time_ 찾아와라 없으면 널 
			//최근에 조회수를 올린 시간
			update_time = (long)session.getAttribute("update_time_"+bno);
		}
		//현재시간
		long current_time = System.currentTimeMillis(); //시스템의 현재시간을 수치화해서 current_time에 담는다.
		
		//일정시간이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 24*60*60*1000) { 
			//DB에서 조회수 +1 증가
			bDao.increaseViewCnt(bno);
			//조회수 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);
		}
		
		// 조회수 +1 증가
//		bDao.increaseViewCnt(bno);
	}
	@Override
	public void delBoard(int bno) {
		bDao.delBoard(bno);
	}


}
