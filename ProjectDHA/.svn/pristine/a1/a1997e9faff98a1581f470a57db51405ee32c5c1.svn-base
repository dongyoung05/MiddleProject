package kr.or.ddit.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/memberSearchAdmin.do")
public class MemberSearchAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String key = request.getParameter("variable");
		String value = request.getParameter("searchValue");
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("key", key);
		map.put("value", value);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		List<MemberVO> list = service.searchMemberAdmin(map);
		request.setAttribute("memList", list);
		request.getRequestDispatcher("/admin/member_List_Admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
