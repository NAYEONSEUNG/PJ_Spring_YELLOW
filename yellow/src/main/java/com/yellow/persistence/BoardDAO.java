package com.yellow.persistence;

import java.util.List;

import com.yellow.domain.BoardDTO;


public interface BoardDAO {
	//public int boardinsert(BoardDTO bDto);
	
	public List<BoardDTO> newBoardList();
}
