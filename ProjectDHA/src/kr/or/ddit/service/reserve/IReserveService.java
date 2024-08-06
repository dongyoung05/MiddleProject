package kr.or.ddit.service.reserve;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.ReserveVO;

public interface IReserveService {
	
	/**
	 * 예약 테이블 모든 레코드 반환한다.
	 * @return
	 */
	public List<ReserveVO> getReserveList();
	
	
	/**
	 * 예약 테이블 중 미용서비스가 포함된 예약만 반환한다. (호텔 중 미용 서비스 포함)
	 * @return
	 */
	public List<ReserveVO> getSalonReserveList();
	
	/**
	 * 인자로 들어간 시간에 이용 예약이 되어 있는지 확인
	 * @param date 해당 날짜 + 1시간 단위의 10:00 부터 18:00까지 시간
	 * @return 예약 있으면 양수 없으면 0
	 */
	public int chkSalonReserveList(String date);
	
	/**
	 * 미용 예약하기
	 * @param reserveVo
	 * @return
	 */
	public int insertSalonReserve(ReserveVO reserveVo);
	
	public int insertRoomReserve(ReserveVO reserveVo);
	
	public String getRoomReserveNo(ReserveVO reserveVo);

	public String getSalonReserveNo(ReserveVO reserveVo);

	public int cancelReserve(String no);
	
	
	
	public List<HashMap<String, Object>> getMyReserve(String mem_id, String time, String type);

	
}
