<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProdVO> ctgryList = (List<ProdVO>)request.getAttribute("ctgryList");

	JsonObject jsonObj = new JsonObject();
	
	Gson gson = new GsonBuilder().setPrettyPrinting().create();
	String jsonCtgrys = gson.toJson(ctgryList);
	
	out.print(jsonCtgrys);
	out.flush();
%>