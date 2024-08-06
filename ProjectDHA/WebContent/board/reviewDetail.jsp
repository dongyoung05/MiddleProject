<%@page import="kr.or.ddit.vo.AdminVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>																								
  <script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>
  <script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/reply.js"></script>
  <style>
	body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 800px;
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

        #update, #boardlist {
            background-color: #333;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 10px;
        }

        #delete {
            background-color: #dc143c;
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
  	<%
		BoardVO boardVo = (BoardVO)request.getAttribute("boardVo");
  		
  		AdminVO adminVo = (AdminVO)session.getAttribute("adminok");
  		
  		String imgPath = "../images/board";
  	%>
  <script>
	
  mypath = '<%= request.getContextPath() %>';
  board_no = '<%=boardVo.getBoard_no()%>';
 
  	$(function() {
  		
  		
  		$('#review_update').on('click',  function() {
  			location.href="<%=request.getContextPath()%>/boardDetail.do?board_no=<%= boardVo.getBoard_no()%>&trigger=Y";
  		});
  		
  		$('#review_delete').on('click',  function() {
  			if(!confirm("해당 게시물을 삭제하시겠습니까?")){
  				location.href = "<%=request.getContextPath()%>/reviewDetail.do?board_no=<%= boardVo.getBoard_no()%>";
  			} else {
  				alert("정상적으로 삭제되었습니다.")
  				location.href = "<%= request.getContextPath()%>/reviewDelete.do?board_no=<%=boardVo.getBoard_no()%>";
  			}
  		});
  		
  		$("#reviewList").on('click', function(){
  		  location.href = "<%= request.getContextPath()%>/boardList_HOTE.do";
  	  })
  		
  		
  	})//function
  </script>
</head>

<body>

<div class="container">
    <table>
        <tr>
            <th colspan="2">제목</th>
        </tr>
        <tr>
            <td colspan="2"><%=boardVo.getBoard_title()%></td>
        </tr>
        
        <tr>
            <th>리뷰점수</th>
            <td><%=boardVo.getReview_score()%></td>
        </tr>
        
        <tr>
            <th>작성일자</th>
            <td><%=boardVo.getBoard_date()%></td>
        </tr>
        
        <!-- <tr>
            <th colspan="2">이미지</th>
        </tr> -->
        <tr>
            <td colspan="2">
                <img id="board_img" src="<%= request.getContextPath() %>/boardImageView?board_no=<%= boardVo.getBoard_no() %>">
            </td>
        </tr>
        
       <!--  <tr>
            <th colspan="2">본문</th>
        </tr> -->
        <tr>
            <td colspan="2"><%=boardVo.getBoard_content()%></td>
        </tr>
 		
 		<tr>
 			<td colspan="2" id="button">
 				<input type="button" id="review_update" value="수정">
 				<input type="button" id="review_delete" value="삭제">
 				<input type="button" id="reviewList" value="리뷰목록">
 			</td>
 		</tr>
 
        
    </table>
 </div>




</body>
</html>