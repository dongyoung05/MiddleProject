<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
  <script type="text/javascript">
  $(function(){
  		$("#cancel").on('click', function(){
		  location.href = "<%= request.getContextPath()%>";
	  })

	 })
  </script>
 
</head>
<body>

<form action="<%= request.getContextPath() %>/replyInsert.do?boar" method="post">
	<table border="1">
		
		
		<tr>
			<td cols="5">댓글내용</td>
			<td><textarea id="reply" name="reply"></textarea></td>
		</tr>
		
		<tr>
			<td style="text-align: center;" colspan="2">
				<button type="submit">등록</button>
				<input type="button" name="취소" value="취소" id="cancel">
			</td>
		</tr>
			
	</table>
</form>
</body>
</html>
			