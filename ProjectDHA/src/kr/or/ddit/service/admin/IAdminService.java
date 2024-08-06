package kr.or.ddit.service.admin;

import kr.or.ddit.vo.AdminVO;

public interface IAdminService {

	/**
	 * 아이디와 비밀번호를 가지고 관리자로 로그인하는 메서드
	 * @param adminVo 아이디와 비밀번호
	 * @return AdminVO admin에 대한 정보를 가져옴
	 */
	public AdminVO loginAdmin (AdminVO adminVo);


}
