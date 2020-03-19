package com.yellow.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yellow.domain.BoardDTO;
import com.yellow.service.board.BoardService;
import com.yellow.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@Controller
public class BoardController {
	@Autowired
	BoardService bService;
	@GetMapping("/list")		//curpage라고 하는 것을 아직 안보냈으니까 디폴트 값으로 1이 들어와 있다. model은 인스턴스만 만들어져 있다.
	public String list(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="new") String sort_option, @RequestParam(defaultValue="all") String search_option, 
			@RequestParam(defaultValue="") String keyword, Model model) {//디폴트로 뉴가 들어온다 sort_option에,, 어떤페이지를 띄워더라도 이 requestParam은 항상 물고다닌다.
		log.info(">>> GET: list PAGE 출력");		
		
		//게시글 갯수 계산
		int count = bService.countArticle(search_option, keyword);
		
		// *페이지 관련 설정
		// 앞 Pager는 객체참조 타입 				pager클래스에게 카운트와 컬페이지를 알려준다. 
		Pager pager = new Pager(count, curPage);//괄호가 붙으면 메서드이다. 메서드명령문 첫글자는 소문자로 해야한다.// 대문자로 시작하는것은 상수랑 객체타입뿐이다. 
												//Pager.java에서 만들어진 수들이 다 여기로 들어온다. 
		int start = pager.getPageBegin();//겟페이지비긴은 페이지비긴을 호출한것 가서보면 페이지 비긴은 1이니까 start에 1이 드어간다.
		int end = pager.getPageEnd();//겟페이지엔드는 페이지엔드를 호출한것 가서보면 페이지 비긴은 1이니까 end에 10이 드어간다.
		
		List<BoardDTO> list = bService.newBoardList(sort_option, search_option, keyword, start, end);// 게시물 목록,, 게시글 보는 정렬방식이 바뀔수도 있으니 sort_option 넣어준다.
		
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);//페이지네이션 사용하기위해서 추가한다. 
		map.put("sort_option", sort_option);//sort_option을 항상 달고다녀야 페이지를 넘겨도 정렬이 가능하다. 
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		model.addAttribute("map",map);
		
		return "board/list";
		
	}
	
	
}
