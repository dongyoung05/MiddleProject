<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>





<%
	//	Controller 에서 저장한 데이터 꺼내기
	List<ReplyVO> replyList = (List<ReplyVO>)request.getAttribute("replyList");
	
	Gson gson = new GsonBuilder().setPrettyPrinting().create();

	String list = gson.toJson(replyList);

	out.print(list);
	out.flush();
%>