<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.ProdCartVO"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//	Controller 에서 저장한 데이터 꺼내기
	List<ProdVO> prodList = (List<ProdVO>)request.getAttribute("prodList");
	
	Gson gson = new GsonBuilder().setPrettyPrinting().create();

	String list = gson.toJson(prodList);

	out.print(list);
	out.flush();
%>