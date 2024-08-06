package kr.or.ddit.controller.prod;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.prod.IProdService;
import kr.or.ddit.service.prod.ProdServiceImpl;
import kr.or.ddit.vo.ProdVO;

@WebServlet("/prod/getAllProd.do")
public class GetAllProd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//	검색 조건이 있는지 확인하기
		String searchValue = request.getParameter("searchValue");
		
		//	분류 조건이 있는지 확인하기
		String weight = request.getParameter("weight");
		String variable = request.getParameter("variable");
		String ctgryId = request.getParameter("ctgryId");
		
		//	출력 조건을 담을 Map 객체 생성
		Map<String, String> searchParameters = new HashMap<String, String>();
		
		//	키워드 검색 값이 있을 경우
		if(searchValue != null && searchValue != "") {
			searchParameters.put("searchValue", searchValue);
		}
		
		//	상품 분류 값이 있을 경우
		if(ctgryId != null && ctgryId != "") {
			searchParameters.put("ctgryId", ctgryId);
		}
		
		//	체급 분류를 설정했을 경우
		if(weight != null && weight != "") {
			searchParameters.put("wKey", "prod_weight");
			searchParameters.put("wValue", weight);
		}
		
		//	검색 분류를 설정했을 경우
		if(variable != null && variable != "") {
			switch (variable) {
				case "desc":
					searchParameters.put("sKey", "prod_price");
					searchParameters.put("sValue", variable);
					break;
				case "asc":
					searchParameters.put("sKey", "prod_price");
					searchParameters.put("sValue", variable);
					break;
				case "descTime":
					searchParameters.put("sKey", "prod_no");
					searchParameters.put("sValue", "desc");
					break;
			}
		}
		
		//	서비스 객체 생성
		IProdService service = ProdServiceImpl.getInstance();
		List<ProdVO> prodList = service.getAllProd(searchParameters);
		
		request.setAttribute("prodList", prodList);
		
		request.getRequestDispatcher("/prod/prodSale.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
