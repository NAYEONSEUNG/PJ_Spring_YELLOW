package com.yellow.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yellow.domain.AttachDTO;
import com.yellow.domain.BoardDTO;


public interface BoardDAO {
	//게시글 갯수 계산
	public int countArticle(@Param("map") Map<String, String> map);
	
	//목록(페이지나누기, 검색 기능 포함)
	public List<BoardDTO> newBoardList(@Param("map")Map<String, Object> map);
		
	public BoardDTO viewBoard(int bno);

	//조회수 +1 증가
	public void increaseViewCnt(@Param("bno") int bno);
	
	//게시글 삭제
	public void delBoard(int bno);
	
	//게시글 등록
	public void write(BoardDTO bDto);

	public void updateBoard(BoardDTO bDto);
	
	//게시글 답글 등록
	public void answer(BoardDTO bDto);

	//re_step 수정
	public void updateStep(BoardDTO bDto);

	//첨부파일 등록 
	public void addAttach(@Param("fullName") String fullName);
	
	//첨부파일 목록
	public List<String> getAttach(@Param("bno") int bno);
	
	//첨부파일 삭제
	public void deleteAttach(@Param("bno") int bno);

	//첨부파일 수정(재등록)
	public void updateAttach(@Param("fullName") String fullName, @Param("bno") int bno);

	//하루전 첨부파일 목록 조회
	public List<AttachDTO> getOldFiles(@Param("ydate") String ydate);
}
