package com.controller;

import com.service.LoginService;
import com.vo.UserVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginController implements Action  {

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String method = request.getMethod();
        request.setAttribute("pageCss", "style");
        String returnUrl = "login/login";
    
        if (method.equals("POST")) {

            String userId = request.getParameter("user_id");
            String password = request.getParameter("password");

            
            LoginService service = new LoginService(request.getServletContext());

            UserVO login = service.login(userId, password);
            System.out.println("login: "+login);
            String dest = request.getParameter("dest");
            System.out.println("dest: "+dest);

            if (login != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loginMember", login);
                
             // 2. 로그인 성공 시 원래 가려던 곳으로 보냄
                if (dest != null && !dest.isEmpty()) {
                	returnUrl =  "redirect:" + dest; 
                }else {
                	returnUrl =  "redirect:/reservationMain.do";
                }

            } else {
            	// 로그인 실패 시 dest를 유지하기 위해 다시 전달
                request.setAttribute("dest", dest);
                request.setAttribute("errorMsg", "아이디 또는 비밀번호가 틀렸습니다.");
                returnUrl =  "login/login";
            }
        }

        return returnUrl;
    }
}