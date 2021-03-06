package com.yellow.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yellow.domain.BoardDTO;
import com.yellow.service.board.BoardService;
import com.yellow.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@Controller // 이거붙어있으면 바로 빈즈로 생성해준다.
public class BoardController {
	@Autowired
	BoardService bService;

	@GetMapping("/list") // curpage라고 하는 것을 아직 안보냈으니까 디폴트 값으로 1이 들어와 있다. model은 인스턴스만 만들어져 있다.
	public String list(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "new") String sort_option,
			@RequestParam(defaultValue = "all") String search_option, @RequestParam(defaultValue = "") String keyword,
			Model model) {// 디폴트로 뉴가 들어온다 sort_option에,, 어떤페이지를 띄워더라도 이 requestParam은 항상 물고다닌다.
		log.info(">>> GET: list PAGE 출력");

		// 게시글 갯수 계산
		int count = bService.countArticle(search_option, keyword);

		// *페이지 관련 설정
		// 앞 Pager는 객체참조 타입 pager클래스에게 카운트와 컬페이지를 알려준다.
		Pager pager = new Pager(count, curPage);// 괄호가 붙으면 메서드이다. 메서드명령문 첫글자는 소문자로 해야한다.// 대문자로 시작하는것은 상수랑 객체타입뿐이다.
												// Pager.java에서 만들어진 수들이 다 여기로 들어온다.
		int start = pager.getPageBegin();// 겟페이지비긴은 페이지비긴을 호출한것 가서보면 페이지 비긴은 1이니까 start에 1이 드어간다.
		int end = pager.getPageEnd();// 겟페이지엔드는 페이지엔드를 호출한것 가서보면 페이지 비긴은 1이니까 end에 10이 드어간다.

		List<BoardDTO> list = bService.newBoardList(sort_option, search_option, keyword, start, end);// 게시물 목록,, 게시글 보는
																										// 정렬방식이 바뀔수도
																										// 있으니
																										// sort_option
																										// 넣어준다.

		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);//
		map.put("pager", pager);// 페이지네이션 사용하기위해서 추가한다.
		map.put("sort_option", sort_option);// sort_option을 항상 달고다녀야 페이지를 넘겨도 정렬이 가능하다.
		map.put("search_option", search_option);
		map.put("keyword", keyword);//
		model.addAttribute("map", map);

		return "board/list";

	}

	@GetMapping("/view/{bno}")
	/* public String view(int bno, BoardDTO bDto, Model model) { */
	public String view(@PathVariable(value = "bno") int bno, BoardDTO bDto, Model model, HttpSession session) {
		log.info(">>>GET Board Detail Page");

		// 1.해당 bno의 조회수 +1 증가
		bService.increaseViewCnt(bno, session);
		// bDto = bService.viewBoard(bno);//잘 모르는 부분

		// DB에서 bno정보를 get해서 view단으로 전송
		model.addAttribute("one", bService.viewBoard(bno));
		// model.addAttribute("one",bDto);
		model.addAttribute("key", "dropBoard");// 삭제할수 있게 modal.jsp의 코드를 부른다.
		return "board/view";

	}

	@GetMapping("/delete")
	public String delete(int bno) {
		log.info(">>>>>>>>GET: Board Delete Action");
		bService.delBoard(bno);

		return "redirect:/board/list";// 삭제하고 게시글 목록으로 가게 해준다.
	}

	@GetMapping("/write")
	public String write() {

		return "board/write";

	}

	@PostMapping("/write")
	public String write(BoardDTO bDto) { 
		log.info(">>>>>>POST : BOARD WRITE ACTION");
		log.info(bDto.toString());
		// log.info(">>>>>>>>>Currval: " + bDto.getBno());
		
		if(bDto.getFiles() == null) {//첨부파일 NO
			bDto.setFilecnt(0);
		}else {
			log.info("첨부파일 수:" +bDto.getFiles().length);
			bDto.setFilecnt(bDto.getFiles().length);
		}

		bService.write(bDto);// 게시글 등록한것, 컨트롤러단에서 서비스단 타야하니까 bService를 쓴다.
		return "redirect:/board/view/" + bDto.getBno();
	}

	@GetMapping("/update")
	public String updateBoard(int bno, Model model) {

		log.info(">>>>>GET: Board updat view page");
		log.info("bno: " + bno);

		// 수정을 원하는 게시글의 정보를 (1줄)원함
		model.addAttribute("one", bService.viewBoard(bno));
		model.addAttribute("flag", "update");
		return "/board/write";
	}

	@PostMapping("/update")
	public String updateBoard(BoardDTO bDto) {
		log.info(">>>>>>>>>>> POST: BOARD UPDATE ACTION");
		
		if(bDto.getFiles() == null) {//첨부파일 NO // 배열로 들어온다. 
			bDto.setFilecnt(0);
		}else {
			log.info("첨부파일 수:" +bDto.getFiles().length);
			bDto.setFilecnt(bDto.getFiles().length);
		}
		
		log.info(bDto.toString());
		bService.updateBoard(bDto);
	
		return "redirect:/board/view/" + bDto.getBno();

	}

	// 답글view.jsp
	@GetMapping("/answer")
	public String answerBoard(BoardDTO bDto, Model model) {// 스프링자체에서 객체생성을 해놓아서 빈즈에 등록이 되어있으니까 따로 new해서 객체생성을 안해도 이렇게만 해도 된다.
															
		log.info(">>>>>>>>>>GET: BOARD ANSWER VIEW PAGE");

		bDto = bService.viewBoard(bDto.getBno());

		String newContent = bDto.getView_content()+"<br> ================================================================================</br>";
									
		bDto.setView_content(newContent);
		
		model.addAttribute("one", bDto);
		model.addAttribute("flag", "answer");
		return "/board/write";

	}
	@PostMapping("/answer")
	//이걸 했다는 말은 > write.jsp에서 answer의 플래그를 가지고 스프링 폼태그를 시행 했다는 말!
	//bDto.getBno()를 하면 어떤값이오겠어? 글을 등록한다는 것은
	//seq_board.NEXTVAL() 값을 bno로 갖기떄문에 화면단에서 즈얼대 몰라
	//<selectkey keyProperty="bno", resultType="Integer", order="after">로 등록후 seq_board.nextval의 값을 가져올수있는 함수 seq_board.currval
	//내가 등록시의 bno 를 디티오에 셀렉하는거자나 이제서야 내가 등록한글을 return "redirect:/board/view/"+bDto.getBno(); 로 불러올수 있는거지

	public String answerBoard(BoardDTO bDto) { 
		log.info(">>>>>>>>>>>>>>>POST Board ansewer Action");
		
		//현재상태: 답글(bno(이전 게시글), 타입, 제목, 내용, 작성자)
		log.info(">><>>>>>>메인게시글: " + bDto.toString());
		

		
		//현재상태: 메인(ALL, ref, re_level, re_step)
		BoardDTO prevDto = bService.viewBoard(bDto.getBno());
		log.info(prevDto.toString());
		
		if(bDto.getFiles() == null) {//첨부파일 NO // 배열로 들어온다. 
			bDto.setFilecnt(0);
		}else {
			log.info("첨부파일 수:" +bDto.getFiles().length);
			bDto.setFilecnt(bDto.getFiles().length);
		}
		
		//현재상태: 답글(bno(메인게시글), 타입, 제목, 내용, 작성자
		//				 ref(메인), re_level(메인), re_step(메인))
		bDto.setRef(prevDto.getRef());
		bDto.setRe_level(prevDto.getRe_level());
		bDto.setRe_step(prevDto.getRe_step());
		
		bService.answer(bDto);
		
		log.info(">><>>>>>>메인게시글: " + prevDto.toString());
		//ref, re_setp, re_level
		//ref = 그래도 메인게시글 ref C&P
		//re_level = 메인게시글 re_level+1
		//re_step = 메인게시글 re_step +1 
		
		return "redirect:/board/view/"+bDto.getBno();
	}
	
	@PostMapping("/getAttach")
	@ResponseBody
	public List<String> getAttach(int bno){
		log.info(">>>>>>POST: Board getAttach Action");
		log.info(">>>>>>>>>>>bno: " + bno);
		return bService.getAttach(bno);
		
	}

}// class
