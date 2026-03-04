package com.controller.board;

import com.controller.Action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/***************************************************************
 * Contact Us 클릭 시: 미로그인 → 로그인 화면, 로그인 → qna/write 화면
**************************************************************/
public class ContactUsController implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("loginMember") == null) {
			return "redirect:/login/login.do";
		}

		request.setAttribute("pageTitle", "문의 작성");
		request.setAttribute("pageCss", "style");
		return "board/qna/list";
		
		
	
	}
}
