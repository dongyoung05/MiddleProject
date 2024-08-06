package kr.or.ddit.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.admin.AdminServiceImpl;
import kr.or.ddit.service.admin.IAdminService;
import kr.or.ddit.service.dog.DogServiceImpl;
import kr.or.ddit.service.dog.IDogService;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.MemberServiceImpl;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.DogVO;
import kr.or.ddit.vo.MemberVO;

// 로그인을 처리하는 서블릿
@WebServlet("/loginMember.do")
public class LoginMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String memId = request.getParameter("mem_id");
		String memPass = request.getParameter("mem_pass");
		
		// 아이디 기억하기 쿠키 체크박스
		String checkId = request.getParameter("chkId");
		
		MemberVO paramvo = new MemberVO();
		AdminVO paramAdmin = new AdminVO();
		
		paramAdmin.setAdmin_id(memId);
		paramAdmin.setAdmin_pass(memPass);
		
		paramvo.setMem_id(memId);
		paramvo.setMem_pass(memPass);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		MemberVO memberVo = service.loginMember(paramvo);
		
		IAdminService adminService = AdminServiceImpl.getInstance();
		
		AdminVO adminVo = adminService.loginAdmin(paramAdmin);
		
		
		// 로그인 정보를 저장해줄 세션 생성
		HttpSession session = request.getSession();
		
		IDogService service2 = DogServiceImpl.getInstance();
		
		List<DogVO> doglist = service2.selectAllDog(memId);
		
			
		//		받아온 ID 값으로 갖는 Cookie 객체 생성
		Cookie loginCookie = new Cookie("USERID", memId);
			
			//	체크박스의 체크 여부를 확인해서 처리하기
			//		=> 체크박스가 체크된 상태이면 Cookie를 저장하고
			//		=> 체크가 해제된 상태이면 Cookie를 삭제한다
			
		if(checkId==null) {					//	checkbox 가 해제된 상태
			loginCookie.setMaxAge(0);		//	0으로 설정하면 저장되는 순간 삭제된다
		}
		response.addCookie(loginCookie);
			
		MemberVO blackMember = service.blacklistLogin(memId);
		
		// 세션처리
		if(memberVo != null) {
			// 로그인 성공시
			if(blackMember != null) {
				session.setAttribute("black", blackMember);
				session.setAttribute("myDogList", doglist);
				session.setAttribute("loginok", memberVo);
				session.setAttribute("check", "true");
			} else {
				session.setAttribute("myDogList", doglist);
				session.setAttribute("loginok", memberVo);
				session.setAttribute("check", "true");
			}
		} else if (adminVo != null) {
			// 로그인 실패 -
			session.setAttribute("adminok", adminVo);
		} else {
			session.setAttribute("check", "false");
		}
		
		// 뷰페이지로 이동
		request.getRequestDispatcher("/member/LoginMember.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
