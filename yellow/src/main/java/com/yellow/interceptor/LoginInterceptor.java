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
		if(session.getAttribute("userid") == null) {
			log.info(">>> noLogin:(");
			
			//
			String uri = request.getRequestURI();
			log.info(">>>>>목적지:" + uri);
			
			String referer = request.getHeader("referer"); //목적지만 안다.
			log.info(">>>이전 url:" + referer);
			
			//request 오면 response를 반드시 해줘야한다. 
			//request(GET, POST) > response(forward, sendRedirect) ,get이냐 post는 신경쓰지 않고 url만 중요시한다. 
			//회원수정페이지: GET:/member/update
			//회원수정DB: POST:/member/update
			
			if(referer == null) {//타 사이트에서 들어왔을때 
				//url로 바로 접근한 경우 (rferer이 없는 경우)인덱스페이지로 간다. 
				referer = "http://localhost:8081/yellow/";
			} else {//내 페이지 내부에서 접근했을때 
				int index = referer.lastIndexOf("/");
				int len = referer.length();
				log.info(">>>>>인덱스: " + index);
				log.info(">>>>>길 이 : " + len);
				String mapWord = referer.substring(index, len);
				log.info("수정된 url: " + mapWord);
				log.info(">>>>>이전 URL: " + referer);
				
				if(mapWord.equals("/write")) {
					response.sendRedirect(request.getContextPath()+"/board/list");
					return false;
				}
				
				
			}


			
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			fMap.put("uri", uri);
			

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
