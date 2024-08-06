<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

int[] cnts = (int[])request.getAttribute("cnts");

for(int cnt : cnts) System.out.print(cnt + "  ");

%>
[
<%
	for(int i=0;i<cnts.length ; i++) {
		if(i>0) out.println(",");
		if(cnts[i] > 0) {
			%>
			"예약"
			<%
		} else{
			%>
			"예약불가능"
			<%
		}
	}
%>
]    