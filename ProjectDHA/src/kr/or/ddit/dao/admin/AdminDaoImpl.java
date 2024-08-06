package kr.or.ddit.dao.admin;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.AdminVO;

public class AdminDaoImpl implements IAdminDao {
	private static AdminDaoImpl dao;
	private AdminDaoImpl() {}
	public static AdminDaoImpl getInstance() {
		if(dao == null) dao = new AdminDaoImpl();
		return dao;
	}
	
	@Override
	public AdminVO loginAdmin(AdminVO adminVo) {
		
		SqlSession session = null;
		AdminVO adminVo2 = null;
		try {
			session = MybatisUtil.getSqlSession();
			
			adminVo2 = session.selectOne("admin.loginAdmin", adminVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			if(session != null) session.close();
			
		}
		
		return adminVo2;
	}

}
