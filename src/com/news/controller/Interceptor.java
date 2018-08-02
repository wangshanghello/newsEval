package com.news.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/**
 * 
 *  @author wangshang
 * 	@date 2018年7月9日/上午8:49:25  
 * 	@类作用: 拦截器
 */
public class Interceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object object) throws Exception {
		
		 //��ȡSession  
        HttpSession session = request.getSession();  
        String username = (String)session.getAttribute("username");  
		System.out.println("username:"+username);
		if(username==null){
			request.getRequestDispatcher("/WEB-INF/jsp/404.jsp").forward(request, response);  
			return false;
			
		}
		return true;
	}

}
