package kr.or.ddit.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

/**
 * Servlet implementation class MemberListAdmin
 */

// 회원 전체 목록을 보여주는 서블릿
@WebServlet("/memberListAdmin.do")
public class MemberListAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	
		// 멤버 서비스 객체 연결
		IMemberService memberService = MemberServiceImpl.getInstance();
		
		// 조회할 멤버 리스트 불러오기
		List<MemberVO> memList = memberService.selectMemberList();
		
		// request객체에 리스트 저장
		request.setAttribute("memList", memList);
		
		// jsp로 보내기
		request.getRequestDispatcher("/admin/member_List_Admin.jsp").forward(request, response);
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
