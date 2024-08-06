package kr.or.ddit.dao.salon;

import java.util.List;


import kr.or.ddit.vo.SalonVo;

public interface ISalonDao {
	
	public SalonVo getSalon(String salon_no);
	
	public List<SalonVo> getSalonList();

	public List<SalonVo> getSalonWeight(String salon_weight);

	public int insertSalon(SalonVo vo);
	public int deleteSalon(String no);
	public int updateSalon(SalonVo vo);







}
