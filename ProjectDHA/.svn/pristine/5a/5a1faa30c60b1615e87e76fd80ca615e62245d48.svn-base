package kr.or.ddit.controller.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.dog.DogServiceImpl;
import kr.or.ddit.service.dog.IDogService;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.MemberServiceImpl;
import kr.or.ddit.vo.DogVO;
import kr.or.ddit.vo.MemberVO;

/**
 * Servlet implementation class SelectMember
 */
@WebServlet("/selectMember.do")
public class SelectMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String mem_id = request.getParameter("mem_id");
		
		MemberVO mvo = new MemberVO();
		List<DogVO> dlist = new ArrayList<DogVO>();
		// 회원정보 조회할 서비스 연결
		IMemberService memberService = MemberServiceImpl.getInstance();
		
		// 도그 정보를 조회할 서비스 연결
		IDogService dogService = DogServiceImpl.getInstance();
		
		mvo = memberService.selectGetMemberId(mem_id);
		
		dlist = dogService.selectAllDog(mem_id);
		
		request.setAttribute("mvo", mvo);
		request.setAttribute("dlist", dlist);
		
		request.getRequestDispatcher("/member/mypageMember2.jsp").forward(request, response);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
