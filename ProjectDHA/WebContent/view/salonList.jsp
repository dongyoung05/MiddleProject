<%@page import="kr.or.ddit.vo.SalonVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<SalonVo> salonList = (List<SalonVo>)request.getAttribute("salonList");
%>
[
<%
for(int i =0;i<salonList.size();i++){
	SalonVo salon = salonList.get(i);
	if(i>0) out.println(",");
%>
	{
		"salon_no" : "<%= salon.getSalon_no() %>",
		"salon_name" : "<%= salon.getSalon_name() %>",
		"salon_price" : "<%= salon.getSalon_price() %>",
		"salon_desc" : "<%= salon.getSalon_desc() %>"
	}
<%	
}
%>
]