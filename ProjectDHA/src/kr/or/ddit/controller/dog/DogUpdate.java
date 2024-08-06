package kr.or.ddit.controller.dog;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.service.dog.DogServiceImpl;
import kr.or.ddit.service.dog.IDogService;
import kr.or.ddit.vo.DogVO;

/**
 * Servlet implementation class DogUpdate
 */
@WebServlet("/dogUpdate.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 50,		//	10mb 로 설정하고 싶을 때
		maxFileSize       = 1024 * 1024 * 50,
		maxRequestSize    = 1024 * 1024 * 100
		)
public class DogUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int dog_no = Integer.parseInt(request.getParameter("dog_no"));
		
		DogVO paramvo = new DogVO();
		
		try {
			BeanUtils.populate(paramvo, request.getParameterMap());
		} catch (IllegalAccessException e) {
		
			e.printStackTrace();
		} catch (InvocationTargetException e) {
		
			e.printStackTrace();
		}
		
//		이미지 등록을 위한 추가처리
		Part part = request.getPart("dog_img");
		String fileName = extractFileName(part);
		String uploadPath = "D:/A_TeachingMaterial/03_HighJava/workspace/ProjectDHA/WebContent/images/dog";
	
		
		if(part.getSize() < 1) {
			paramvo.setDog_img(null);
		} else {
//			File 객체 생성 및 경로 없을 시 생성
			File file = new File(uploadPath);
			if(!file.exists()) file.mkdirs();
			
			String imgPath = UUID.randomUUID().toString() + "_" + fileName;
			
			
			paramvo.setDog_img(imgPath);
			
			try {
				part.write(uploadPath + File.separator + imgPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String mem_id = request.getParameter("mem_id");
		IDogService service = DogServiceImpl.getInstance();
		paramvo.setDog_no(dog_no);
		paramvo.setMem_id(mem_id);
		int cnt = service.updateDog(paramvo);
		
		HttpSession session = request.getSession(false);
		
		List<DogVO> doglist = service.selectAllDog(mem_id);
		
		
		session.setAttribute("myDogList", doglist);
		request.setAttribute("dogvo", paramvo);
		request.setAttribute("dog_no", dog_no);
		
		
		if(cnt > 0) {
			request.getRequestDispatcher("/dog/mypageDogSelect.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/dog/dogUpdate.jsp").forward(request, response);
		}
	}

	
	private String extractFileName(Part part) {
		String fileName = "";
		
		//	헤더의 키 값이 'content-disposition' 인 헤더의 Value 값 구하기
		String headerValue = part.getHeader("content-disposition");
		String[] itemArr = headerValue.split(";");
		
		for(String item : itemArr) {
			if(item.trim().startsWith("filename")) {		//	'filename' 찾기 
				fileName = item.substring(item.indexOf("=")+2, item.length()-1);
			}
		}
		return fileName;
	}
}
