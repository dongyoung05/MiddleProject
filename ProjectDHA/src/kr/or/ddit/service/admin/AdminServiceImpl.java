package kr.or.ddit.service.admin;

import kr.or.ddit.dao.admin.AdminDaoImpl;
import kr.or.ddit.dao.admin.IAdminDao;
import kr.or.ddit.vo.AdminVO;

public class AdminServiceImpl implements IAdminService {
	private static IAdminDao dao;
	
	private static AdminServiceImpl service;
	private AdminServiceImpl() {
		if(dao == null) dao=AdminDaoImpl.getInstance(); 
	}
	public static AdminServiceImpl getInstance() {
		if(service == null) service = new AdminServiceImpl();
		return service;
	}
	
	
	
	@Override
	public AdminVO loginAdmin(AdminVO adminVo) {
		return dao.loginAdmin(adminVo);
	}

}
