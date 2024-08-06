<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Integer result = (Integer)request.getAttribute("cnt");
%>
<%	
	if(result == null) {
		result = 0;
	}
%>
<%
	if(result > 0) {
%>
		{
			"flag" : "성공"
		}
<%
	} else {
%>
		{
			"flag" : "실패"
		}
<%
	}
%>
