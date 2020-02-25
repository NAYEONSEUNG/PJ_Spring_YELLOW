package com.yellow.controller;

import javax.servlet.http.HttpServletRequest;

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

@SessionAttributes({"memberDTO"})
@Slf4j //로그 쓸려고 쓴다ㅏ.
@RequestMapping("/member") /* 멤버로 시작하는 놈들은 다 여기로 와라 */
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
																				//defaultvlaue 는 constracat페이지 통해서 오면 1이들어가는데 비정상적인 경우로오면 0이들어간다.
		log.info(">>>>>>member/join page get 출력");
		log.info(mDto.toString());
		model.addAttribute("flag", flag);
		
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
	
	@PostMapping("/join") //join에서 서브밋한게 여기로 온다. /회원정보 숨겨야하니까 포스트
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, SessionStatus sessionStatus, HttpServletRequest request) {// 가입하기 누르면 여기 디티오로 간다. id,pw,이름... 8개의 값
		log.info(">>>>>>MEMBER/JOIN POST DB에 회원정보 저장 ");
		log.info(mDto.toString());
		log.info("Password: " +mDto.getPw());//사용자 입력PW값
		//1.사용자 암호 HASH변환
		String encPw= passwordEncoder.encode(mDto.getPw());
		mDto.setPw(encPw);
		log.info("password(+Hash): " + mDto.getPw());
		//2.DB에 회원등록
		int result = mService.memInsert(mDto);		
		//3.회원 등록결과
		if(result > 0) {
			log.info(">>>>>"+ mDto.getId()+ "님 회원가입되셨습니다.");
		}
		
		//회원가입 인증 메일 보내기
		mailService.mailSendUser(mDto.getEmail(),mDto.getId(),request);
		
		//SessionAttributes를 사용할때 insert, update가 완료되고
		//view로 보내기전 반드시 setComplet()를 실행하여
		//session에 담긴 값을 clear 해주어야한다.
		
		sessionStatus.setComplete();
		return "redirect:/";
	}
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
	
	

}
