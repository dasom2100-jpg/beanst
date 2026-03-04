package com.handler;

import java.util.HashMap;

import com.controller.Action;
import com.controller.HomeController;
import com.controller.MemberMypageController;
import com.controller.ReservationMainController;
import com.controller.board.FaqListController;
import com.controller.board.QnaDetailController;
import com.controller.board.QnaListController;
import com.controller.admin.AdminDashboardController;
import com.controller.admin.AdminLoginController;

public class HandlerMapper {

	private HashMap<String, Action> map = new HashMap<>();

	public HandlerMapper() {
		map.put("/main.do", new HomeController()); // 메인
		map.put("/member/mypage.do", new MemberMypageController());
		map.put("/reservationMain.do", new ReservationMainController());
		map.put("/admin/login.do", new AdminLoginController());
		map.put("/admin/dashboard.do", new AdminDashboardController());
		
		// faq_list.jsp, qna_list.jsp, qna_detail.jsp 추가
		map.put("/faqList.do", new FaqListController());
		map.put("/qnaList.do", new QnaListController());
		map.put("/qnaDetail.do", new QnaDetailController());
	}

	public Action getController(String path) {
		return map.get(path);
	}
}