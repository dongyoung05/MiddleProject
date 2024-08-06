<%@page import="kr.or.ddit.vo.SalonVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

List<SalonVo> list = (List<SalonVo>)request.getAttribute("list");

%>
[
<%
	for(int i=0;i<list.size();i++){
		SalonVo vo = list.get(i);
		if(i>0) out.print(",");
		%>
		{
			"no":"<%= vo.getSalon_no() %>",
			"name":"<%= vo.getSalon_name()%>",
			"price":"<%= vo.getSalon_price() %>",
			"desc":"<%= vo.getSalon_desc() %>",
			"weight":"<%= vo.getSalon_weight() %>"
		}
		<%
	}
%>
]   