package com.yellow.service.board;

import java.util.List;

import com.yellow.domain.BoardDTO;

public interface BoardService {
	//게시글 갯수 계산
	public int countArticle();
	
	//목록(페이지 나누기, 검색 긴으 포함)
	 public List<BoardDTO> newBoardList(int start, int end);
	 
}
