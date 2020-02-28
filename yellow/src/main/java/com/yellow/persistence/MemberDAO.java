package com.yellow.persistence;

import com.yellow.domain.MemberDTO;
//인터페이스는 실체가 없는 메서드
public interface MemberDAO {
		//회원가입 ID중복 체크 (+ AJAX)
		public int idOverlap(String id);
		
		//회원가입 DB에 회원등록
		public int memInsert(MemberDTO mDto);
		//여기를 실행하라고 하는거는 mapper에서 실행하라는것과 같다.//경로가 같다. 
		
		//회원가입 진행시 난수 생성 및 useyn 컬럼에 난수 입력
		public int getKey(String id, String key);
		
		//회원가입 이메일 인증 후 useyn 컬럼 y로 값 변경
		public int alterKey(String id, String key);
		
		//1명의 회원정보
		public MemberDTO userView(String id);
	}


