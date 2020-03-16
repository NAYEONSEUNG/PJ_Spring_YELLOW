package com.yellow.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yellow.domain.MemberDTO;
import com.yellow.service.mail.MailService;
import com.yellow.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

/*SessionAttributes로 설정된 변수(객체)는
 * response를 하기전에 서버의 기억장소 어딘가에 임시로 보관을 해둔다.
 * web browser와 server 간에 한번이라도 연결이 이루어졌으면
 * Session..에 등록된 변수는 서버가 중단될ㄸ깨까지 그 값이 그대로 유지된다ㅏ.
 * web은 클라이언트의 req를 서버가 받아서
 * res를 수행하고 나면 모든 정보가 사라지는 특성이 있다.
 * 이런 특성과는 달리 Spring 기반의 web은 일부 데이터들을 
 * 메모리에 보관했다가 재사용하는 기법이 있다.
 * 그중 SessionAttributes라는 기능이 있다.
 * 
 * sessionAtrributes()에 설정하는 문자열(이름)은
 * 클래스의 표준 객체생성 패턴에 의해 만들어진  이름
 * MemberDTO mDto
 * 
 * 이름을 표준 패턴이 아닌 임의의 이름으로 바꾸고 싶다.
 */

@Slf4j //로그 쓸려고 쓴다ㅏ.
@RequestMapping("/member") /* 멤버로 시작하는 놈들은 다 여기로 와라 */
@SessionAttributes({"memberDTO"})
@Controller // 스프링 빈즈로 등록시키겠다.

public class MemberController {
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	MemberService mService;
	

	
	/*
	 *SeesionAttributes를 사용하기 위해서는
	 *반드시 해당변수를 생성하는 method가 controller에 있어야 하고
	 *해당 메서드에는 @ModelAtgtribute("변수명")가 있어야한다.
	 */
	
	@ModelAttribute("memberDTO")
	public MemberDTO newMember() {
		return new MemberDTO();				
	}
	
	/*
	 * SessionAttributes에서 설정한 변수(객체)에는
	 * @ModelAttribute를 설정해 두어야 한다.
	 * 단, 5.x이하에서는 필수 5.x이상에서는 선택
	 * 
	 * 만약 Attributes의 이름을 표준패텅이 아닌 임의의 이름으로 사용할경우
	 * @ModelAttributes("객체이름")을 필수로 지정해 주어야 한다.
	 */
	@GetMapping("/join")															//controller 공유영역 
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, @RequestParam(value="flag", defaultValue="0") String flag, Model model) {//4개의 약관 동의 한게 mdto에 들어가 있다. 
																				//default value 는 constract페이지 통해서 오면 1이들어가는데 비정상적인 경우로오면 0이들어간다.
		log.info(">>>>>>member/join page get 출력");
		log.info(mDto.toString());
		model.addAttribute("flag", flag);
		
		//비정상적인 접근일 경우 약관 동의페이지로 이동
		if(!flag.contentEquals("1")) {
			return "member/constract";
		}
		
		return "member/join";
	}
	
	@GetMapping("/constract")
	public 	String viewConstract() {
		log.info(">>>>>>MEMBER/CONSTRACT PAGE 출력");
		return "member/constract"; //화면단 결정하는 놈
	}
	/*
	 * @GetMapping("/join") public String viewJoin(MemberDTO mDto) {
	 * log.info("get방식"); log.info(mDto.toString()); return "member/join"; //화면단
	 * 결정하는 놈 }
	 */
	
	/*
	 * join POST가 mDto를 수신할때
	 * 입력 form에서 사용자가 입력한 값들이 있으면
	 * 그 값들을 mDto의 필드변수에 setting을 하고
	 * 
	 * 만약 없으면
	 * 메모리 어딘가에 보관중인 SessionAttributes로 설정된
	 * mDto변수에서 값을 가져와서 비어있는
	 * 필드변수를 채워서 매개변수에 주입한다.
	 * 
	 * 따라서 form에서 보이지 않아도 되는 값들은
	 * 별도의 코딩을 하지 않아도
	 * 자동으로 join POST로 전송되는 효과를 낸다.
	 * 단, 이기능을 효율적으로 사용하려면
	 * jsp \코드에서 Spring - form tag로 input을 코딩해야 한다.
	 */
	//회원가입을 하기위한 메서드들 
	@PostMapping("/join") //join에서 서브밋한게 여기로 온다. /회원정보 숨겨야하니까 포스트
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, SessionStatus sessionStatus, HttpServletRequest request, RedirectAttributes rttr) {// 가입하기 누르면 여기 디티오로 간다. id,pw,이름... 8개의 값
		//view단에서 controller단으로 이동																						ㄴ 한번 새로고침하면 사라짐
		log.info(">>>>>>MEMBER/JOIN page POST 출력");
		//view단에서 전송된 데이터가 잘 전달됐는지 확인
		log.info(mDto.toString());
		log.info("Password: " +mDto.getPw());//사용자 입력PW값
		
		//1.사용자 암호 HASH변환
		String encPw= passwordEncoder.encode(mDto.getPw());//mDto사용자가 입력한 날것의 비밀번호가 들어있다.passwordEncoder불러와서 인코더작업을 하겠다. 
															//날것의값을 해쉬화(암호화)한것을 encPw에 넣음
		mDto.setPw(encPw);	//mDto의 날것의 비밀번호대신에 암호화된 pw를 집어넣어라.,, 암호화한것이 mDto에 들어있음 									
		log.info("password(+Hash): " + mDto.getPw());
		//2.DB에 회원등록
		int result = mService.memInsert(mDto);	//memInsert mDto보내준다. mService쓸려면 객체생성해야하는데 여기서는 의존성주입을 해주어서 객체생성안해도 자동으로 넣어준다.
		//대신 @Autowired  MemberService mService가 있어야 의존성주입을 해준다(이놈은 의존성주입을 타입으로한다.),Autowired안붙히면 null값이 들어간다.
		//@Autowired는 하나당 하나씩 각각 따로쓰기 @Autowired붙어있으면 개발자가 나는 개발만할건데 객체가 필요하다 근데 ㅈㄴ귀찮음 스프링이 대신 해줘
		//의존성주입하려면 di패턴이니까 저 객체에대한 권한을 스프링이 가지고있어야 한다. 객체애대한 권한은 원래 개발자가 가지고있는데 스프링에서는 스프링이 가지고있다.
		//스프링에게 권한을 위임하는게 ioc(제어의역전)이라한다. 그럴려면 서비스에 @Service 표지판이 있어야한다.
		//표지판이 붙어있으면 서블릿컨텍스트에서 회수해간다.
		
		//3.회원 등록결과
		if(result > 0) {
			log.info(">>>>>"+ mDto.getId()+ "님 회원가입되셨습니다.");
		}
		
		//4.회원가입 인증 메일 보내기
		mailService.mailSendUser(mDto.getEmail(), mDto.getId(), request);
		
		//SessionAttributes를 사용할때 insert, update가 완료되고
		//view로 보내기전 반드시 setComplet()를 실행하여
		//session에 담긴 값을 clear 해주어야한다.
		
		sessionStatus.setComplete();// 컨트롤러에서 쓴것 초기화 해주는(제거), 안그러면 계속 남아있다. 
		
		//회원가입 후 메시지 출력을 위한 값 전달
		rttr.addFlashAttribute("id",mDto.getId());
		rttr.addFlashAttribute("email", mDto.getEmail());
		rttr.addFlashAttribute("key", "join");
		
		return "redirect:/";//화면단 경로를 써줌
				// 리다이렉트로 하겠다redirect:
	}
	//회원가입 후 이메일 인증
	@GetMapping("/keyauth")
	public String keyAuth(String id, String key, RedirectAttributes rttr) {
		mailService.keyAuth(id, key);
		
		//인증 후 메시지출력을 위한 값 전달
		rttr.addFlashAttribute("id",id);
		rttr.addFlashAttribute("key", "auth");
		
		return "redirect:/";
			
	}
	
 //회원가입 ID중복체크
	@ResponseBody
	@PostMapping("/idoverlap")
	public String idOverlap(String id) {
		log.info(">>>>>> ID OVERLAP CHECK");
		log.info("아이디:" + id);
		
		int cnt = mService.idOver(id);
		String flag = "1";
		if(cnt == 0) {
			flag = "0";
		}
		
		return flag;
	}
	
	//회원정보 수정
	@GetMapping("/update")
	public String memUpdate(HttpSession session, Model model) {
		log.info(">>>>>>GET: Member Update Update Page");
		
		//현재 로그인 상태를 확인
		String id = (String)session.getAttribute("userid"); //object를 스트링에 담는다고 하니까 못담음 . 세션영역에 넣는순간 최상위인 오브젝트로 가서 그런다. 
		
		//로그인이 안되있으면 비정상적인 접근으로 간주하여
		//인덱스페이지로 이동!!
		/*
		 * if(id == null) {//null은 로그인이 안됐다는 말 return "redirect:/"; }
		 */
		//로그인된 유저의 정보를 GET
		//회원정보수정 페이지로 보내기
		model.addAttribute("user", mService.userView(id)); //model 쓸려면 멤업데이트안에 매개변수 Model model 해줘야함
		
		return "member/join";
	}

	@PostMapping("/update")
	public String memUpdate(MemberDTO mDto, HttpSession session) {
		log.info(">>>>POST: Member Update Action");
		log.info(mDto.toString());
		
		 mService.memUpdate(mDto, session);
		
		return "redirect:/";
	}
	
	@GetMapping("/pwupdate")
	public String pwUpdate() {
		log.info(">>>>>>GET: Password Update Page");
		/*
		 * String id = (String)session.getAttribute("userid"); if(id == null) { return
		 * "redirect:/";
		 * 
		 * }
		 */
		return "member/pwupdate";
	}
	
	@PostMapping("/pwupdate")
	public String pwUpdate(HttpSession session, MemberDTO mDto) {
		log.info(">>>>>POST: PASSWORD UPDATE ACTION");
		log.info("수정비밀번호:" + mDto.getPw());
		String encPw = passwordEncoder.encode(mDto.getPw());
		mDto.setPw(encPw);
		String id = (String)session.getAttribute("userid");
		mDto.setId(id);
		log.info(mDto.toString());
		
		mService.pwUpdate(mDto);
		return "redirect:/";
	}
	@ResponseBody
	@PostMapping("/pwcheck")
	public Integer pwCheck(String pw, HttpSession session) {
		log.info(">>>>POST: PWCheck(AJAX)");
		
		String id = (String)session.getAttribute("userid");// session에서 아이디 값 가져옴
		//int result = mService.pwCheck(id,pw);
		
		//사용자가 입력한 pw
		//DB에 가서 PW가 같은지 체크
		
		return mService.pwCheck(id,pw);
	}
	
	@GetMapping("/drop")
	public String memdrop(Model model){
		log.info(">>>>>>>>get: member drop page");
		model.addAttribute("key","drop");
		return "member/drop";
	}
	@GetMapping("/dropAction")
	public String memDrop(HttpSession session, RedirectAttributes rttr) {
		log.info(">>>>>>GET: MEMBER DROP ACTION");
		String id = (String)session.getAttribute("userid");
		
		rttr.addFlashAttribute("id",id);
		rttr.addFlashAttribute("key","dropResult");
		
		mService.memDrop(session, id);//회원탈퇴를 했다 이말은 로그인이 돼있다는말 세션의 정보를 지우라고 안했으니까 세션도 초기화를 해버려야 한다.
		return "redirect:/";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		
		return "member/mypage";
	}
}//class
