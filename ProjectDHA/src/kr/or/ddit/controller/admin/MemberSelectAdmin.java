package kr.or.ddit.controller.admin;

import java.io.IOException;
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


// 특정 회원을 조회하는 서블릿
@WebServlet("/memberSelectAdmin.do")
public class MemberSelectAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		
		// 조회할 멤버 아이디 가져옴
		String mem_id = request.getParameter("mem_id");
		
		// 서비스 연결
		IMemberService memberService = MemberServiceImpl.getInstance();
		
		// vo에 요청값 받아옴
		MemberVO memberVo = memberService.selectGetMemberId(mem_id);
		
		// vo를 저장해서
		request.setAttribute("memberVo", memberVo);
		
		// 반려견도 출력해주기 위해서 반려견 서비스도 연결
		IDogService dogService = DogServiceImpl.getInstance();
		
		List<DogVO> dogList = dogService.selectAllDog(mem_id);
		
		request.setAttribute("dogList", dogList);
		
		// jsp에 보냄
		request.getRequestDispatcher("/admin/memberSelectAdmin.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
