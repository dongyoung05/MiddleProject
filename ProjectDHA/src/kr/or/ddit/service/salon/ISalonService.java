package kr.or.ddit.service.salon;

import java.util.List;

import kr.or.ddit.vo.SalonVo;

public interface ISalonService {
	
	/**
	 * 미용 서비스 번호를 매개변수로 받아서 해당 미용 정보를 가져와 반환하는 메서드
	 * @param salon_no 검색할 미용 서비스 번호
	 * @return 미용 서비스 번호에 맞는 자료가 있으면 해당 미용 서비스 정보를 갖는 SalonVo객체,
	 * 			자료가 없으면 null 반환
	 */
	public SalonVo getSalon(String salon_no);
	
	/**
	 * DB의 salon 테이블 전체 레코드를 가져와서 List에 담아서 변환하는 메서드
	 * @return SalonVo객체가 저장된 List객체
	 */
	public List<SalonVo> getSalonList();
	
	/**
	 * salon 소중대형 별로 있는 미용 종류 List에 담아 반환
	 * @param salon_weight
	 * @return
	 */
	public List<SalonVo> getSalonWeight(String salon_weight);


	public int insertSalon(SalonVo vo);
	public int deleteSalon(String no);
	public int updateSalon(SalonVo vo);


}
