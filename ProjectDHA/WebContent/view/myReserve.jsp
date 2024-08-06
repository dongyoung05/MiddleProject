<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

List<HashMap<String, Object>> newList = 
	(List<HashMap<String, Object>>)request.getAttribute("newList");
List<HashMap<String, Object>> oldList = 
	(List<HashMap<String, Object>>)request.getAttribute("oldList");

%>
{
	"newList": 
		[
	<%
	for(int i=0;i<newList.size();i++){
		HashMap<String, Object> map = newList.get(i);
		String tempName = "";
		if(map.containsKey("ROOM_NO")) tempName = (String)map.get("ROOM_TITLE");
		else tempName = (String)map.get("SALON_NAME");
		if(i>0) out.println(",");
		%>
			{
			"no": "<%= map.get("RESERVE_NO") %>",
			"rin": "<%= map.get("RESERVE_IN") %>",
			"rout": "<%= map.get("RESERVE_OUT") %>",
			"when": "<%= map.get("RESERVE_WHEN") %>",
			"price": "<%= map.get("RESERVE_PRICE") %>",
			"name": "<%= tempName %>",
			"dogName": "<%= map.get("DOG_NAME") %>"
			}
		<%
	}
	%>				
		],
	"oldList":
		[
	<%
	for(int i=0;i<oldList.size();i++){
		HashMap<String, Object> map = oldList.get(i);
		String tempName = "";
		if(map.containsKey("ROOM_NO")) tempName = (String)map.get("ROOM_TITLE");
		else tempName = (String)map.get("SALON_NAME");
		if(i>0) out.println(",");
		%>
			{
			"no": "<%= map.get("RESERVE_NO") %>",
			"rin": "<%= map.get("RESERVE_IN") %>",
			"rout": "<%= map.get("RESERVE_OUT") %>",
			"when": "<%= map.get("RESERVE_WHEN") %>",
			"price": "<%= map.get("RESERVE_PRICE") %>",
			"name": "<%= tempName %>",
			"dogName": "<%= map.get("DOG_NAME") %>"
			}
		<%
	}
	%>				
		]
}










