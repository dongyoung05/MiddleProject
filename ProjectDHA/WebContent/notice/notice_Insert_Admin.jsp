<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

	
td {
	border: 1px solid #dddddd;
	 text-align: left;
	 padding: 8px;
}
	
th {
 	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}
</style>
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/공통스크립트.js"></script>
<link rel="stylesheet" href="../css/MainPage.css">
<script type="text/javascript">
	$(function(){
		$("#cancel").on('click', function(){
			location.href = "<%= request.getContextPath()%>/noticeListAdmin.do";
		})
	
	})
</script>
</head>
<body>
	<%@ include file="../admin/view/AdminView.jsp" %>
<form action="<%= request.getContextPath() %>/noticeInsertAdmin.do" method="post" enctype="multipart/form-data">
	<div id="section">
		<h3>공지사항 등록</h3>
		<div class="hr" style="margin-bottom: 50px;"></div>
		
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" id="notice_title" name="notice_title"></td>
			</tr>
			
			<tr>
				<th>이미지</th>
				<td><input type="file" alt="이미지를 선택해주세요." id="notice_img" name="notice_img"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="40"  id="notice_content" name="notice_content"></textarea></td>
			</tr>
			
			<tr style="display:none;">
				<th>작성자</th>
				<td><input type="text" alt="이미지를 선택해주세요." id="admin_id" name="admin_id" value="admin"></td>
			</tr>
			
			<tr>
				<td style="text-align: center;" colspan="2">
					<button type="submit">등록</button>
					<input type="button" name="취소" value="취소" id="cancel">
				</td>
			</tr>
				
		</table>
	</div>
</form>
</body>
</html>