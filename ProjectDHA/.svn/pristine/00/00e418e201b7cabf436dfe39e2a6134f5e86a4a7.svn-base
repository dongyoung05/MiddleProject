<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
//controller에서 저장한 데이터 꺼내기
int res = (Integer)request.getAttribute("cnt");

if(res == 0) {
%>
	{
		"flag" : "이 아이디는 사용가능 합니다."
	}
	
<%	
}else {
%>
	{
		"flag" : "이 아이디는 사용불가능 합니다."
	
	}
<%	
}
%>