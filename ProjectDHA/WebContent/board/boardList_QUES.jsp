<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="/js/jquery-3.7.1.min.js"></script>
  <script src="/js/jquery.serializejson.min.js"></script>
  <script src="../js/jquery-3.7.1.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/MainPage.css">
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

</style>
</head>

<%
	List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList_QUES");
%>
<%@ include file="../view/commonView.jsp" %>
<body>
	<div class="containaer">
		<input type="button" value="게시글 등록" id="boardInsert" onClick="location.href='<%=request.getContextPath()%>/board/boardInsert.jsp'"> 
		<table border="1" class="table table-hover">
	

		<tr>
			<th>제목</th>
			<th>작성일자</th>
		</tr>	
<%
			for(BoardVO board : boardList) {
%>
		<tr>
			<td> <a href="<%=request.getContextPath()%>/boardDetail.do?board_no=<%= board.getBoard_no()%>"> <%= board.getBoard_title()%> </a></td>
			<td><%= board.getBoard_date() %></td>
		</tr>	
<%
		}
%>	
	</table>
  	</div>
</body>
</html>