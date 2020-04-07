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
	// URL 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Session 객체 생성
		HttpSession session = request.getSession();// request가 요청이 들어왔을때 세션에 userid, name이 들어있다. 로그인 여부판단

		// 이전page url
		String referer = request.getHeader("referer"); // 헤더에서 url을 가져온다. html 헤더 ㄴㄴ
		log.info(">>>>>referer: " + referer); // 이전페이지 url이 찍힌다.
		String qString = request.getQueryString();
		log.info(">>>>>queryString" + qString);
		// 이동하려고 했던 page url
		String uri = request.getRequestURI();// 8081/ 이후부터 끝까지가 uri
		String ctx = request.getContextPath();// /yellow 프로젝트 이름
		String nextUrl = uri.substring(ctx.length());// 7글자(/yellow) 뒤부터의 url , nexturl값에는 /board/write,list가 들어온다.
		String prevUrl = ""; // 아래에서 쓸려고 변수선언하고 초기화를 한다.
		String finalUrl = "http://localhost:8081/yellow/"; // 비정상접근시 강제로 인덱스페이지로 이동시키기 위해.

		// 비정상적인 접근을 막는 기능
		if (referer == null) { // 다른곳에서 바로 url로 내 사이트를 들어올려고 했을때
			log.info("WARNNING >> 비정상적인 접근");
			response.sendRedirect(finalUrl);// response는 request의 결과를 보낸다! 라고 생각 / sendRedirect 방식(새로운 창을 띄운다.)으로 finalurl을 보낸다.
			return false;
		} else { // (정상적인 방법으로 이동중

			int indexQuery = referer.indexOf("?");// 리퍼럴에서 물음표를 찾는다./ 찾아서 집어 넣는다.,, indexOf 찾는 위치의 숫자를 찍는다.
			if (indexQuery == -1) {// ?를 못찾은 경우
				prevUrl = referer.substring(finalUrl.length() - 1);// prevUrl에 '/yellow' 이걸 넣는다. 
			} else {// ?를 찾은경우
				prevUrl = referer.substring(finalUrl.length() - 1, indexQuery);// http://localhost:8081/yellow?bno=41  ,앞부분과 ?뒤를 자르는 작업
			}
			log.info("prev url >>>>>>>>>>>>" + prevUrl);
			log.info("next Url>>>>>>>" + nextUrl);

			if (nextUrl.equals("/board/update") || nextUrl.equals("board/delete")) {
				if (request.getParameter("title") == null) {// 타이틀 값이 없는경우
//					log.info("alasdfasdf:" + prevUrl.indexOf("board/view"));
					if (prevUrl.indexOf("board/view") == -1) {
						log.info("WARNING>>>> 비정상적인 접근");
						response.sendRedirect(finalUrl);
						return false;

					}

				}
			}

		}
		// 정상적인 접근인 경우 실행

		if (session.getAttribute("userid") == null) {
			if (prevUrl.equals(nextUrl)) {
				log.info("warning>>>> prevUrl == nuextUrl");
				response.sendRedirect(finalUrl);
				return false;
			}
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);// flashmap 일회용을쓰는 맵, hash맵은 계속 쓰고
			fMap.put("message", "nologin");
			if(qString != null) {
				uri = uri +"?" + qString;
			}
			fMap.put("uri", uri);
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);

			return false;// 이동X

		} else {// login O
			log.info(">>>>>login :)");
			return true; // 원래 가려던곳으로 이동
		}
	}

	// URL후
	/*
	 * @Override public void postHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
	 * throws Exception { // TODO Auto-generated method stub
	 * super.postHandle(request, response, handler, modelAndView); }
	 */

}
