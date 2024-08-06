package kr.or.ddit.controller.member;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;


// 회원의 아이디를 찾는 메서드

@WebServlet("/findId.do")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberVO memberVo = new MemberVO();
		try {
			BeanUtils.populate(memberVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			
			e.printStackTrace();
		}
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		
		
		String mem_id = service.findId(memberVo);
		System.out.println("ID : " + mem_id);
		String mem_mail = memberVo.getMem_email(); 
        String userName = "baek1853@gmail.com";		//	발신자 이메일 주소
	    System.out.println("MAIL : " + mem_mail);    
	        try {
	            // SimpleEmail 객체 생성
	        	HtmlEmail email = new HtmlEmail();
	            email.setHostName("smtp.gmail.com");
				email.setSmtpPort(465);
				email.setAuthenticator(new DefaultAuthenticator("baek1853@gmail.com", "fdxl nlry mafd bhpa"));
				email.setSSLOnConnect(true); // SSL을 사용하여 연결 설정

	            // 이메일 발신자, 수신자, 제목, 내용 설정
	            email.setFrom(userName, "DHA");
	            email.addTo(mem_mail); // 수신자 이메일 주소
	            email.setCharset("UTF-8");
	            
	            StringBuffer msg = new StringBuffer();
	            email.setSubject("요청하신 회원님의 ID입니다.");
	            msg.append("<!DOCTYPE html>");
				msg.append("<html><head>");
				msg.append("<meta charset=\"UTF-8\">");
				msg.append("<title>Email Test</title>");
				msg.append("</head>");
				msg.append("<body><div>");
				msg.append("회원님의 ID는 ==> '" + mem_id + "' 입니다.<br>");
				msg.append("이용해 주셔서 감사합니다 ");
				msg.append("</body></html>");
	            
				email.setHtmlMsg(msg.toString());
	            
	          
	            // 이메일 보내기
	            email.send();
	            
	            System.out.println("이메일을 성공적으로 보냈습니다.");
	        } catch (EmailException e) {
	            System.out.println("이메일 보내기 실패: " + e.getMessage());
	        }
		
	        System.out.println("@@@@@@@@@@@@@@@ try끝");
	        int cnt = 0;
		if(mem_id != null) {
			String msg = "이메일로 전송됩니다.";
			cnt = 1;
			request.setAttribute("cnt", cnt);
			System.out.println(msg);
		} else {
			cnt=0;
			request.setAttribute("cnt", cnt);
		}
		
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	
	
	
}

