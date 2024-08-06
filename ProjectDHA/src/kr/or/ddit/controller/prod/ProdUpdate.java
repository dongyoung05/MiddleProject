package kr.or.ddit.controller.prod;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.service.prod.IProdService;
import kr.or.ddit.service.prod.ProdServiceImpl;
import kr.or.ddit.vo.ProdVO;

@WebServlet("/prod/prodUpdate.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 50,
		maxFileSize       = 1024 * 1024 * 50,
		maxRequestSize    = 1024 * 1024 * 100
		)
public class ProdUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		ProdVO prodVo = new ProdVO();
		String prodNo = request.getParameter("prodNo");
		System.out.println("prodNo : " + prodNo);
		Part part = request.getPart("prod_img");
		
		//	서비스 객체 생성
		IProdService service = ProdServiceImpl.getInstance();
		
		//	기존의 파일이 있다면 삭제한다
		ProdVO deleteVo = service.getSelectProd(prodNo);
		String deleteFileName = deleteVo.getProd_img();
		
		
		//	이미지 파일 여부 확인
		if((part.getSize() < 1) && (deleteFileName == null)) {
			prodVo.setProd_img(null);
		} else if((deleteFileName != null) && (part.getSize() < 1)) {
			prodVo.setProd_img(deleteFileName);
		} else {
			String uploadPath = "D:/A_TeachingMaterial/03_HighJava/workspace/ProjectDHA/WebContent/images/prod";
			
			File deleteFile = new File(uploadPath + File.separator + deleteFileName);
			System.out.println("deleteFile" + deleteFile);
			if(deleteFile.exists()) deleteFile.delete();
			
			//	File 객체 생성 및 경로의 폴더가 없을 시 생성
			String updateFileName = extractFileName(part);
			File file = new File(uploadPath);
			if(!file.exists()) file.mkdirs();
			String imgPath = UUID.randomUUID().toString() + "_" + updateFileName;
			
			prodVo.setProd_img(imgPath);
			
			try {
				part.write(uploadPath + File.separator + imgPath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		try {
			BeanUtils.populate(prodVo, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		System.out.println("ProdUpdate->prodVo : " + prodVo);
		
		prodVo.setProd_no(prodNo);
		
		service.modifyProd(prodVo);
		request.setAttribute("prodNo", prodNo);
		request.getRequestDispatcher("/prod/getSelectProd.do").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
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
