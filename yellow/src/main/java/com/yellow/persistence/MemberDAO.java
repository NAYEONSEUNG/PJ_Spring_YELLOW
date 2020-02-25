package com.yellow.persistence;

import com.yellow.domain.MemberDTO;

public interface MemberDAO {
		//회원가입 ID중복 체크 (+ AJAX)
		public int idOverlap(String id);
		
		//회원가입 DB에 회원등록
		public int memInsert(MemberDTO mDto);
		
		//회원가입 진행시 난수 생성 및 useyn 컬럼에 난수 입력
		public int getKey(String id, String key);
		
		//회원가입 이메일 인증 후 useyn 컬럼 y로 값 변경
		public int alterKey(String id, String key);
	}


