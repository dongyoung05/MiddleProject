<%@page import="kr.or.ddit.vo.AdminVO"%>
<%@page import="kr.or.ddit.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
</head>
<%
	List<ReplyVO> replyList = (List<ReplyVO>)request.getAttribute("replyList");
%>
<body>
	<div class="containaer">
		<input type="button" value="댓글 등록" id="boardInsert" onClick="location.href='<%=request.getContextPath()%>/reply/replyInsert.jsp'"> 
		<table border="1" class="table table-hover">
	

		<tr>
			<th>댓글내용</th>
			<th>작성일자</th>
		</tr>	
<%
			for(ReplyVO reply : replyList) {
%>
		<tr>
			<td> <a href="<%=request.getContextPath()%>/replyDetail.do?reply_no=<%=reply.getReply_no() %>"> <%= reply.getReply_content()%> </a></td>
			<td> <%= reply.getReply_date()  %> </td>
		</tr>	
<%
		}
%>	
	</table>
  	</div>
</body>
</html>