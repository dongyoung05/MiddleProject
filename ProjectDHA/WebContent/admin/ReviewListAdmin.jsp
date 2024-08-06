<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="kr.or.ddit.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Admin</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>	
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/MainPage.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/중분류페이지공통스타일.css">
<script>
	$(function(){
		$.resize = function(){
			size = $('.table').height() + 200;
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
<style>
	table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    th {
        background-color: #808080;
        color: #fff;
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    td {
        background-color: #fff;
        color: #000;
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
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
    
    .reveiwTitle {
    	width : 20%;
    }
    .reviewContent {
    	width : 60%;
    }
    .reviewScore {
    	width : 5%;
    }
    .reviewDate {
    	width : 15%;
    }
</style>
</head>
<%
// List<NoticeVO> noticeList = (List<NoticeVO>)request.getAttribute("noticeList");
List<BoardVO> reviewList = (List<BoardVO>)request.getAttribute("printList");
%>
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
	<h3>리뷰 게시판</h3>
	<div class="hr" style="margin-bottom: 50px;"></div>
	
		<table border="1" class="table">
		<tr>
			<th>제목</th>
			<th>내용</th>
			<th>별점</th>
			<th>작성일자</th>
		</tr>
		<%if(reviewList != null){ %>
<%
			for(BoardVO board : reviewList) {				
%>
		<tr>
			<td class="reveiwTitle"><%= board.getBoard_title() %></td>
			<td class="reviewContent"><%= board.getBoard_content() %></td>
			<td class="reviewScore"><%= board.getReview_score() %></td>
			<td class="reviewDate"><%= board.getBoard_date() %></td>
		</tr>	
<%
			}
		} else{%>
			<tr>
			<td colspan="4">등록된 리뷰가 없습니다.</td>
			</tr>
	<%	}	%>
		</table>
		<br>
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