package com.univ.interceptor;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.univ.user.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws IOException {
		// Bring the requested uri
		String uri = request.getRequestURI();
		logger.info("[####### preHandle]: uri:{}", uri);

		// check if logged in
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		// if not logged in
		if (user == null && uri.startsWith("/univ")) {
			response.sendRedirect("/univ/user/sign_in");
			return false;
		}

		// 로그인 && /user로 온 경우 => 글 목록 페이지로 리다이렉트 return false

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) {
		logger.info("[######## postHandle]");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		logger.info("[@@@@@@@@ afterCompletion]");
	}
}
