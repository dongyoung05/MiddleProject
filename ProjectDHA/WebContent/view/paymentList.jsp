<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

List<HashMap<String, Object>> list = 
	(List<HashMap<String, Object>>)request.getAttribute("list");
String type = (String)request.getAttribute("type");

if("prod".equals(type)){
	%>
	{
		"list" : [
		<%
			for(int i=0;i<list.size();i++){
				HashMap<String, Object> map = list.get(i);
				if(i>0) out.print(",");
				%>
				{
					"orderNo" : "<%= map.get("ORDER_NO") %>",
					"qty" : "<%= map.get("PROD_QTY") %>",
					"prodName" : "<%= map.get("PROD_NAME") %>",
					"prodPrice" : "<%= map.get("PROD_PRICE") %>",
					"price" : "<%= map.get("PAY_PRICE") %>",
					"date" : "<%= map.get("PAY_DATE") %>"
				}
				<%
			}
		%>
		],
		"type" : "prod"
	}
	<% 
} else {
	%>
	{
		"list" : [
		<%
			for(int i=0;i<list.size();i++){
				HashMap<String, Object> map = list.get(i);
				String temp = "";
				if(((String)map.get("RESERVE_NO")).contains("ro")){
					temp = "호텔";
				} else temp = "미용";
				if(i>0) out.print(",");
				%>
				{
					"orderNo" : "<%= map.get("ORDER_NO") %>",
					"service" : "<%= temp %>",
					"sin" : "<%= map.get("RESERVE_IN") %>",
					"sout" : "<%= map.get("RESERVE_OUT") %>",
					"date" : "<%= map.get("RESERVE_WHEN") %>",
					"dog" : "<%= map.get("DOG_NAME") %>",
					"price" : "<%= map.get("PAY_PRICE") %>"
				}
				<%
			}
		%>
		],
		"type" : "service"
	}
	<% 
}
%>












