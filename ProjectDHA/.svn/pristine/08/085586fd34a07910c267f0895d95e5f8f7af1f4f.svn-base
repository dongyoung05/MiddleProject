package kr.or.ddit.controller.dog;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.dog.DogServiceImpl;
import kr.or.ddit.service.dog.IDogService;
import kr.or.ddit.vo.DogVO;

// 클릭한 반려견의 정보를 조회 하는 서블릿

@WebServlet("/selectDog.do")
public class SelectDog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int dog_no = Integer.parseInt(request.getParameter("dog_no"));
		String mem_id = request.getParameter("mem_id");
		
		String trigger = request.getParameter("trigger");

		DogVO paramVo = new DogVO();
		
		paramVo.setDog_no(dog_no);
		paramVo.setMem_id(mem_id);
		
		IDogService service = DogServiceImpl.getInstance();
		
		DogVO dogVo = service.selectDog(paramVo);
		
		request.setAttribute("dogvo", dogVo);
		
		if(trigger == "Y") {
			System.out.println("왜 이거 안탐 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			request.getRequestDispatcher("/dog/dogUpdate.jsp").forward(request, response);
		} else {
			System.out.println("ddddddddddddddddddddd");
			request.getRequestDispatcher("/dog/mypageDogSelect.jsp").forward(request, response);
		}
		
	}

}
