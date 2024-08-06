<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BoardVO> reviewList = (List<BoardVO>)request.getAttribute("reviewList");
%>
[
<%
 	for(int i = 0; i<reviewList.size(); i++){
		if(i>0) out.println(",");
%>
		{
			"no" : "<%=reviewList.get(i).getBoard_no() %>",
			"title" : "<%=reviewList.get(i).getBoard_title() %>",
			"content" : "<%=reviewList.get(i).getBoard_content() %>",
			"star" : "<%=reviewList.get(i).getReview_score() %>",
			"date" : "<%=reviewList.get(i).getBoard_date() %>"
			
		}
				
<%		
	}
%>
]

