<%@page import="kr.or.ddit.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	NoticeVO noticeVo = (NoticeVO)request.getAttribute("noticeVo");
%>
<script src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/MainPage.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/중분류페이지공통스타일.css">
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
   .button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #422700;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
</style>
<script type="text/javascript">

$(function(){
	
	$('#cancel').click(function(){
		location.href = "<%=request.getContextPath()%>/noticeDetailAdmin.do?notice_no=<%=noticeVo.getNotice_no()%>";
	})
	
	$.resize = function(){
		size = $('.center').height() + 200;
		console.log(size);		
		$('#section').css('height', size);
	}
	
	$.resize();
	
	$(window).resize(function(){$.resize()});
	
//	공지사항
	$('#p1').click(function(){
		location.href="/ProjectDHA/noticeListAdmin.do";
	})
	//	문의 게시판
	$('#p2').click(function(){
		location.href="/ProjectDHA/printListAdmin.do?ctgry=QUES";
	})
	//	신고 게시판
	$('#p3').click(function(){
		location.href="/ProjectDHA/printListAdmin.do?ctgry=ALER";
	})
	//	호텔 리뷰
	$('#p4').click(function(){
		location.href="/ProjectDHA/printListAdmin.do?ctgry=HOTE";
	})
	//	미용 리뷰
	$('#p5').click(function(){
		location.href="/ProjectDHA/printListAdmin.do?ctgry=SALO";
	})
	//	상품 리뷰
	$('#p6').click(function(){
		location.href="/ProjectDHA/printListAdmin.do?ctgry=PROD";
	})
})
	
</script>
</head>

<body>
	<%@ include file="../admin/view/AdminView.jsp" %>
	
	<div id="title">
		<h2>게시판 관리 페이지</h2>
	</div>
	<div id="side">
		<p id="p1">공지사항</p>
		<p id="p2">문의</p>
		<p id="p3">신고</p>
		<p id="p4">호텔 리뷰</p>
		<p id="p5">미용 리뷰</p>
		<p id="p6">상품 리뷰</p>
	</div>
	
	<div id="section">
		<h2>공지사항 수정</h2>
	<div class="hr" style="margin-bottom: 50px;"></div>
		<div class="center">
			<form action="<%= request.getContextPath() %>/noticeUpdateAdmin.do?notice_no=<%=noticeVo.getNotice_no()%>" method="post" enctype="multipart/form-data">
				<table border="1">
					<tr>
						<td style="text-align: center;">제목</td>
						<td><input type="text" id="notice_title" name="notice_title" value="<%=noticeVo.getNotice_title() %>"></td>
					</tr>
					
					<tr>
						<td style="text-align: center;">이미지</td>
						<td><input type="file" id="notice_img" name="notice_img" value="<%=noticeVo.getNotice_img()%>"></td>
					</tr>
					
					<tr>
						<td style="text-align: center;">내용</td>
						<td><textarea rows="10" cols="40"  id="notice_content" name="notice_content"><%=noticeVo.getNotice_content() %></textarea></td>
					</tr>
					
					<tr>
						<td style="text-align: center;" colspan="2">
							<button type="submit">수정</button>
							<input type="button" name="취소" value="취소" id="cancel">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

<footer>
	<div class = "foo_div">
	
		<div id='foo_div1'>
			<div class="foo_div0">
				<div class="foo_profile">
					<img src="<%= imgPath%>/footer/백지열.png" alt="백지열.png">
					<div>
						<p class="foo_name">백지열</p>
						<p class="foo_mail">baek1853@naver.com</p>
					</div>
				</div>
				<div class="foo_profile">
					<img src="<%= imgPath%>/footer/김동영.png" alt="김동영.png">
					<div>
						<p class="foo_name">김동영</p>
						<p class="foo_mail">kimdud0525@naver.com</p>
					</div>
				</div>
				<div class="foo_profile">
					<img src="<%= imgPath%>/footer/김현수.png" alt="김현수.png">
					<div>
						<p class="foo_name">김현수</p>
						<p class="foo_mail">khssusu0124@gmail.com</p>
					</div>
				</div>
			</div>
			<div class="foo_div0">
				<div class="foo_profile">
					<img src="<%= imgPath%>/footer/김동윤.png" alt="김동윤.png">
					<div>
						<p class="foo_name">김동윤</p>
						<p class="foo_mail">rasbet3@naver.com</p>
					</div>
				</div>
				<div class="foo_profile">
					<img src="<%= imgPath%>/footer/금서윤.png" alt="금서윤.png">
					<div>
						<p class="foo_name">금서윤</p>
						<p class="foo_mail">bk0870@naver.com</p>
					</div>
				</div>
			</div>
		</div>
		
		<div id='foo_div2'>
			<div id="foo_div2_1">
				<span>(주)퍼피랑</span> <span>  |  </span>
				<span>대표 : 백지열</span> <span>  |  </span>
				<span>사업자등록번호 : 567-89-10112</span> <span>  |  </span> <br>
				<span>주소 : 대전 중구 계룡로 846 3층</span> <br>
				<span>TEL : 042-222-8202 &nbsp&nbsp&nbsp&nbsp FAX : 042-222-8202</span> <br>
				<span>MAIL : ddit@gmail.com</span>
			</div>
		</div>
		
	</div>
</footer>

</body>
</html>