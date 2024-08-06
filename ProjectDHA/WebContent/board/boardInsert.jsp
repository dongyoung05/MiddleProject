<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>
  <script src="<%= request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/중분류페이지공통스타일.css">
  <style>
  <style>
  body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 15px; /* 셀 안의 여백을 조금 늘렸습니다 */
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #808080;
            color: #fff;
            font-weight: bold;
        }

        td {
            background-color: #f9f9f9;
        }

        img {
            max-width: 100%;
            height: auto;
            display: block; /* 이미지를 가운데 정렬하기 위해 추가했습니다 */
            margin: 0 auto; /* 이미지를 가운데 정렬하기 위해 추가했습니다 */
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        #cancel, #board_insert {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 10px;
        }

        

        .buttons input[type="button"]:last-child {
            margin-right: 0;
        }

        #reply-container {
            margin-top: 20px;
        }

        #reply-container .replyCreate {
            margin-bottom: 20px;
        }
        #board_title {
        	width: 300px;
        }
  </style>
 
</head>
<body>
<%@ include file="../view/commonView.jsp" %>

  <script type="text/javascript">
  $(function(){
  		$("#cancel").on('click', function(){
		  location.href = "<%= request.getContextPath()%>/boardList_QUES.do";
	  })

	 })
  </script>
<form action="<%= request.getContextPath() %>/boardInsert.do" method="post" enctype="multipart/form-data">
	<table border="1" class="container">
		
		
	
		<tr>
			<td><input type="text" id="board_title" name="board_title" placeholder="제목을 입력해주세요. "></td>
		</tr>
		
		 <tr style="display: none">
			<td>
				<select id="board_ctgry_no" name="board_ctgry_no">
					<option value="QUES" selected="selected">문의</option >
					<option value="ALER">신고</option>
				</select>
			</td>
		</tr> 
		
		<tr>
			<td><input type="file" alt="이미지를 선택해주세요." id="board_img" name="board_img"></td>
		</tr>
		
		<tr>
			<td><textarea rows="10" cols="40"  id="board_content" name="board_content" placeholder="내용을 입력해주세요."></textarea></td>
		</tr>
		
		<tr>
			<td style="text-align: center;" colspan="2">
				<button type="submit" id="board_insert">등록</button>
				<input type="button" id="cancel" name="취소" value="취소" id="cancel">
			</td>
		</tr>
			
	</table>
</form>
</body>
</html>
			