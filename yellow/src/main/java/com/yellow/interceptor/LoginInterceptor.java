/*
 * Login이 필요한 기능 수행시
 * Session체크를 하는 Interceptor
 */

package com.yellow.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;
//오버라이딩 상속조건일때, 부모메서드가 있을때 가능
@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	//URL 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//Session 객체 생성
		HttpSession session = request.getSession();
		//login no
		if(session.getAttribute("userid")==null) {
			log.info(">>> noLogin:(");
			String referer = request.getHeader("referer"); //목적지만 안다.
			log.info(">>>이전 url:" + referer);
			
			//request 오면 response를 반드시 해줘야한다. 
			//request(GET, POST) > response(forward, sendRedirect) ,get이냐 post는 신경쓰지 않고 url만 중요시한다. 
			//회원수정페이지: GET:/member/update
			//회원수정DB: POST:/member/update
			
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			
			//URL로 바로 접근한 경우(referer이 없는 경우)
			if(referer == null) {
				referer = "http://localhost:8081/yellow/";
			}
			log.info(">>>null URL:"+ referer);
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			//response.sendRedirect(referer+ "?message=nologin");
			
			return false;//이동X
		}else {//login O
			log.info(">>>>>login :)");
			return true; // 원래 가려던곳으로 이동
		}
	}
	
	//URL후 
	/*
	 * @Override public void postHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
	 * throws Exception { 
	 * // TODO Auto-generated method stub
	 * super.postHandle(request, response, handler, modelAndView); 
	 * }
	 */
	
}
