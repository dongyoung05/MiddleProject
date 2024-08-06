<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
//controller에서 저장한 값 꺼내기
int res = (int)request.getAttribute("cnt");
String reserveNo = (String)request.getAttribute("reserveNo");

%>

<%
if(res > 0) {	// 각종 쿼리들은 1이면 성공, id중복체크는 반대이니 다른걸 쓰자
%>	
	{
		"flag" : "성공",
		"no" : "<%= reserveNo %>"
	}

<%	
	} else {	// 0이면 실패이다.
%>	
	{
		"flag" : "실패",
		"no" : "<%= reserveNo %>"
	}
<%	
}
%>