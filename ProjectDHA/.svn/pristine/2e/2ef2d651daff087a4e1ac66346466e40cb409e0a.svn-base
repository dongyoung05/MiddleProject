<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
//controller에서 저장한 값 꺼내기
int res1 = (int)request.getAttribute("cnt1");
int res2 = (int)request.getAttribute("cnt2");

%>

<%
if(res1 > 0 && res2 > 0) {
%>	
	{
		"flag1" : "성공",	
		"flag2" : "성공"
	}

<%	
	} else {	// 0이면 실패이다.
%>	
	{
		"flag1" : "실패",	
		"flag2" : "실패"	
	}
<%	
}
%>
