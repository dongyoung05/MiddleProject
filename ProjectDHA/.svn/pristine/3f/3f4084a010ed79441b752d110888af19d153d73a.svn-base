package kr.or.ddit.controller.blacklist;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

/**
 * Servlet implementation class BlacklistInsert
 */
@WebServlet("/blacklistInsert.do")
public class BlacklistInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 값을 걍 가져오는거라 어떻게 하는지 몰라서 노가다했음
		String mem_id = request.getParameter("mem_id");
		String mem_name = request.getParameter("mem_name");
		String mem_email = request.getParameter("mem_email");
		String report_id = request.getParameter("report_id");
		String list_reason = request.getParameter("list_reason");
		
		// 담을 paramvo..
		MemberVO paramVo = new MemberVO();
		paramVo.setMem_id(mem_id);
		paramVo.setMem_name(mem_name);
		paramVo.setMem_email(mem_email);
		paramVo.setReport_id(report_id);
		paramVo.setList_reason(list_reason);
		
		// 서비스 연결
		IMemberService service = MemberServiceImpl.getInstance();
		
		int cnt = service.blackMemberInsert(paramVo);
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
