package kr.or.ddit.dao.room;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.RoomVo;

public interface IRoomDao {
	
	/**
	 * 방의 번호를 매개변수로 받아서 해당 방의 정보를 가져와 반환하는 메서드
	 * @param room_no 검색할 방 번호
	 * @return 방 번호에 맞는 자료가 있으면 해당 방 정보를 갖는 RoomVo객체,
	 * 			자료가 없으면 null 반환
	 */
	public RoomVo getRoom(String room_no);
	
	/** 
	 * DB의 room 테이블 전체 레코드를 가져와서 List에 담아서 변환하는 메서드
	 * @return RoomVo객체가 저장된 List 객체
	 */
	public List<RoomVo> getRoomList();
	
	/**
	 * 날짜, 반려견 무게에 따른 예약 가능한 RoomVo 리스트 반환
	 * @return
	 */
	public List<RoomVo> chkRoomReserve(HashMap<String, String> param);
	
	/**
	 * in과 out 사이의 날짜 차이 반환
	 * @param param
	 * @return
	 */
	public String getTimeBetweenInOut(HashMap<String, String> param);
	
	public int deleteRoom(String no);
	public int insertRoom(RoomVo vo);
	public int updateRoom(RoomVo vo);
	
}
