package kr.or.ddit.controller.reserve;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.reserve.IReserveService;
import kr.or.ddit.service.reserve.ReserveServiceImpl;
import kr.or.ddit.vo.ReserveVO;

/**
 * Servlet implementation class SalonReserve
 */
@WebServlet("/reserve/salonReserve.do")
public class SalonReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("memId");
		int dog_no = Integer.parseInt(request.getParameter("dogId"));
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String weight = request.getParameter("weight");
		String salon_no = request.getParameter("salonNo");
		
		String reserve_in = date + " " + time + ":00.00";
		String reserve_out = "";
		int tempHour = Integer.parseInt(time.substring(0, 2));
		if("소형".equals(weight)) {
			reserve_out = date + " " + tempHour + ":59:00.00";
		} else if("중형".equals(weight)) {
			tempHour += 1;
			reserve_out = date + " " + tempHour + ":59:00.00";
		} else if("대형".equals(weight)) {
			tempHour += 3;
			reserve_out = date + " " + tempHour + ":59:00.00";
		}
		
		// mem_id, dog_no, salon_no, reserve_in, reserve_out
		ReserveVO reserveVo = new ReserveVO();
		reserveVo.setMem_id(mem_id);
		reserveVo.setDog_no(dog_no);
		reserveVo.setReserve_in(reserve_in);
		reserveVo.setReserve_out(reserve_out);
		reserveVo.setSalon_no(salon_no);
		
		IReserveService service = ReserveServiceImpl.getInstance();
		
		int cnt = service.insertSalonReserve(reserveVo);
		
		String reserveNo = service.getSalonReserveNo(reserveVo);
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("reserveNo", reserveNo);
		request.getRequestDispatcher("/view/getReserveNo.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
