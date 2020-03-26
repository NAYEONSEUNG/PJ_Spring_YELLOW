package com.yellow.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardDTO {
	private int bno;	
	private String type;			//게시판 종류 
	private String title;
	private String content;
	private String writer;			//게시글 작성자
	private int viewcnt;
	private int replycnt;			//댓글수
	private int goodcnt;			//추천수
	private String name;			//작성자 이름
	private Date regdate;
	private Date updatedate;		//수정일자
	private String show;			//화면표시여부
	private int ref;				//답변 그룹번호
	private int re_step;			//답변 출력 순번
	private int re_level;			//답변 단계(계층형)
	
	
	
}
