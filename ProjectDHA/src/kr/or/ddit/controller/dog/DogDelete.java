package kr.or.ddit.controller.dog;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.service.dog.DogServiceImpl;
import kr.or.ddit.service.dog.IDogService;
import kr.or.ddit.vo.DogVO;

/**
 * Servlet implementation class DogDelete
 */
@WebServlet("/dogDelete.do")
public class DogDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int dog_no = Integer.parseInt(request.getParameter("dog_no"));
		String mem_id = request.getParameter("mem_id");
	
		DogVO dogVo = new DogVO();
		
		dogVo.setDog_no(dog_no);
		dogVo.setMem_id(mem_id);
		
		IDogService service = DogServiceImpl.getInstance();
		
		
		int cnt = service.deleteDog(dogVo);
		
		DogVO sess = service.selectDog(dogVo);
		
		HttpSession session = request.getSession(false);
		
		List<DogVO> dlist = service.selectAllDog(mem_id);
		
		if(cnt > 0) {
			session.setAttribute("myDogList", dlist);
			response.sendRedirect(request.getContextPath()+"/member/mypageMember2.jsp");
		} else {
			request.getRequestDispatcher("/selectDog.do").forward(request, response);
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
