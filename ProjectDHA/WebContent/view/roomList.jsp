<%@page import="kr.or.ddit.vo.RoomVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<RoomVo> roomList = (List<RoomVo>)request.getAttribute("roomList");
%>
[
<%
for(int i=0;i<roomList.size();i++){
	RoomVo vo = roomList.get(i);
	if(i>0) out.println(",");
	%>
	{
		"no" : "<%= vo.getRoom_no() %>",
		"title" : "<%= vo.getRoom_title() %>",
		"desc" : "<%= vo.getRoom_desc() %>",
		"price" : "<%= vo.getRoom_price_total() %>"
	}
	<%
}
%>
]


