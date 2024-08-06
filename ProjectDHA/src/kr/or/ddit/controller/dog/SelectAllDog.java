package kr.or.ddit.controller.dog;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.service.dog.DogServiceImpl;
import kr.or.ddit.service.dog.IDogService;
import kr.or.ddit.vo.DogVO;

/**
 * Servlet implementation class SelectAllDog
 */
@WebServlet("/selectAllDog.do")
public class SelectAllDog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("mem_id");
		
		IDogService service= DogServiceImpl.getInstance();
		
		List<DogVO> dogList = new ArrayList<DogVO>();
		
		dogList = service.selectAllDog(mem_id);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("myDogList", dogList);
			
		request.setAttribute("doglist", dogList);
		
		request.getRequestDispatcher("/dog/mypageDog2.jsp").forward(request, response);
		
		
		
	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
