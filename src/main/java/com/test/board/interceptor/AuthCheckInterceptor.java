package com.test.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//핸들러 인터셉트 인터페이스는
/*preHandle
 * 	컴트롤러 실행 전
 * postHandle() 메서드
 * 	 컨트롤러 실행 후, 뷰를 실행하기 전
 * afterCompletion 
 * 	  뷰를 실행 한 이후 가 있다. 
 * */

// 핸들러 인터셉트는 설정파일에 지정해둔다. 
//spring-controller.xml 안에 


public class AuthCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		//false면 기존 session 불러오기
		//true면 새로 session 생성
		
		if(session !=null ) {
			Object authInfo = session.getAttribute("authInfo");
			Object sessionId = session.getAttribute("sessionId");
			if(authInfo !=null ||sessionId != null) {

				return true;
			}
		}
		
		response.sendRedirect(request.getContextPath()+"/");
		return false;
		
	}
	//비밀번호 변경 폼 요청에 
	// 세션이 없을 경우 컨트롤러 실행 전에 
	// 인터셉터의 동장으로 인해
	// 로그인 페이지로 리다이렉트 시켜버리기
	
}
