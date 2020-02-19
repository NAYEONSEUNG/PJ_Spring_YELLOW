package com.yellow.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yellow.domain.SampleDTO;

import lombok.extern.slf4j.Slf4j;

//lombok, library의 log기능을 사용
@Slf4j
//Spring이 동작시 DispatcherServlet 생성과정에서
//servlet - context.xml의 환경설정을 읽어들이는데
//servlet - context.xml 내의  component - scan이
//설정된 경로를 돌아다니며 @Controller가 붙어있는
//class들을 전부 Spring Context에 Beans로 등록
//시켜주기 위해서 사용
//Spring Context에 Beans로 등록되어있어야
//DispatcherServlet이 Handler Mapping과
//Hanmdler Adapter를 통해 요청처리를 시킬 수 있음

//Spring Context에 Beans로 등록되었다.
// = spring이 객체의 제어권을 개발자로부터 넘겨받음 (IOC)

//Spring Context에 Beans로 등록되어있는 객체들만
//의존성 주입 가능 (DI패턴)
@RequestMapping("/sample") // 이렇게 해 놓으면 @GetMapping("/view")  리퀘스트매핑의 /sample을 가져다가 /view앞에 알아서 붙혀서 레쓰고 한다.
@Controller


public class SampleController {

	@RequestMapping("/")
	public String print() {
		return "sample";
	}
	
//	@RequestMapping(value="sample/view", method=RequestMethod.GET)
	@GetMapping("/view")
	public String view(String user) {
		log.info("GET방식 호출");
		log.info("user:"+user);
		return "result";
	}
	
//	@RequestMapping(value="sample/view", method=RequestMethod.POST)
//	@PostMapping("/view")
//	public String view(String user) {
//		//input 2개의 값을 전달(Name 속성값)
//		log.info("POST방식 호출");
//		return "result";
//	}
	@PostMapping("/view")
	//public String view(@RequestParam String user, @RequestParam String pass) { 
		//public String view(@RequestParam(value="user", defaultValue="뚱선") String user, String pass ) { //@RequestParam 을 생략할 수 있다.
		public String view(SampleDTO sDto) {
		//(과거) view단으로부터 데이터를 받는방법
		//request.getParameter(""); 값을 모두 String타입으로 받음
		//개발자가 받아서 형변환하는 작업이 필수!
		//추가로 값을 view단에서 넘겨주지 않으면 Null값이 들어가
		//하단에 매개변수를 사용하는 부분에서 전부 Error 발생
		//Null체크 해주는 코드 필수!
//		String user = request.getParameter("user");
//		String pass = request.getParameter("pass");  // 과거방식임 
		
		log.info("pst 방식 호출");
		//log.info(user+","+pass);
		log.info(sDto.toString());
		return "result";
	}
	
}
