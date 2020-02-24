package com.yellow.persistence;

import com.yellow.domain.MemberDTO;

public interface MemberDAO {
		//회원가입 ID중복 체크 (+ AJAX)
		public int idOverlap(String id);
		
		//회원가입 DB에 회원등록
		public int memInsert(MemberDTO mDto);
		
	}


