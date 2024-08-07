package kr.or.ddit.controller.blacklist;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class MemberVlackList
 */

// 블랙리스트 목록을 보는 서블릿
@WebServlet("/memberBlackList.do")
public class MemberBlackList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 정보를 담을 리스트 객체 생성, 우리의 블랙리스트는  memberVo에 넣어놨다.
		List<MemberVO> blackList = new ArrayList<MemberVO>();
		
		// 서비스 객체 연결
		IMemberService service = MemberServiceImpl.getInstance();
		
		// 리시트에 정보 저장
		blackList = service.blackListAll();
		
		// jsp에 보낼 정보 저장
		request.setAttribute("blackList", blackList);
		
		// jsp에 보내기
		request.getRequestDispatcher("/admin/black_List_Admin.jsp").forward(request, response);
	
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
