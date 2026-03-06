package com.controller.board;

import java.util.List;

import com.controller.Action;
import com.dao.FaqDAO;
import com.dto.FaqDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FaqListController implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String category = request.getParameter("category");

		// ServletContext를 넘겨서 Mapper XML을 로드하도록 변경
		FaqDAO dao = new FaqDAO(request.getServletContext());
		List<FaqDTO> faqList = dao.selectFaqList(category);
		for(FaqDTO f : faqList ) {
			System.out.println("리스트 순서: " + f);
		}
		
		request.setAttribute("pageTitle", "FAQ");
		request.setAttribute("faqList", faqList);
		request.setAttribute("category", category);
		request.setAttribute("pageCss", "board");

		return "board/faq/list";
	}
}