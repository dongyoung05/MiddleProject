<%@page import="kr.or.ddit.vo.RoomVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<RoomVo> list = (List<RoomVo>)request.getAttribute("list");

%>
[
<%
	for(int i=0;i<list.size();i++){
		RoomVo vo = list.get(i);
		if(i>0) out.print(",");
		%>
		{
			"no":"<%= vo.getRoom_no() %>",
			"type":"<%= vo.getRoom_type() %>",
			"title":"<%= vo.getRoom_title() %>",
			"desc":"<%= vo.getRoom_desc() %>",
			"all":"<%= vo.getRoom_price_all() %>",
			"day":"<%= vo.getRoom_price_day() %>",
			"night":"<%= vo.getRoom_price_night() %>"
		}
		<%
	}
%>
]

