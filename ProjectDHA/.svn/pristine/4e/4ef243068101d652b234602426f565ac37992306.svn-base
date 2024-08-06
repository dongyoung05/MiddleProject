<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>
<link rel="stylesheet" href="../css/중분류페이지공통스타일.css">

<style>
.hr{
	border: 1px solid black;
	width: 100%;
	margin: 0 auto;
}
</style>

</head>

<%
// 여기는 Session 객체로 로그인 정보 받아올 곳
// 로그인 정보가 있냐 없냐에 따라 명함에 버튼, 프로필, 인삿말 변경되야함

String imgPath = "../images/main";
String boardPath ="../board";
MemberVO memberVo = (MemberVO)session.getAttribute("loginok");

%>

<script>
$(function(){
	
	// 로고 클릭시 홈으로
	$('#logo').on('click', function(){
		location.href="<%= request.getContextPath()%>/main/main.jsp";
	})
	
	// 중분류 페이지 이동
	$('#hotel_intro').on('click', function(){
		location.href="<%= request.getContextPath()%>/hotel/hotelIntro.jsp";
	})
	
	$('#hotel_reserve').on('click', function(){
		location.href="<%= request.getContextPath()%>/hotel/hotelReserve.jsp";
	})
	
	$('#salon_reserve').on('click', function(){
		location.href="<%= request.getContextPath()%>/salon/salonReserve.jsp";
	})
	
	$('#prod_sale').on('click', function(){
		location.href="<%= request.getContextPath()%>/prod/getAllProd.do";
	})
	
	$('#hotel_help').on('click', function(){
		location.href="<%= request.getContextPath()%>/hotel/hotelHelp.jsp";
	})
	
})

</script>

<body>

<!-- 
	클래스 이름: header - 메인 페이지 맨 위 div
	요소: logo, profile(명함)
 -->
<div class="header">
	<!-- 로고 이미지 - images폴더에서 사진 가져옴 -->
	<img id="logo" src="<%= imgPath %>/DHA_logo3.png" alt="DHA_logo3.png">
	
	<div id="profile" class="profile">
		<%
		if(memberVo == null){			
		%>	
		<img id="profileImg" src="<%= imgPath %>/대충회원프로필1.png" alt="대충회원프로필1.png">
		<!-- 프로필 옆에 문구 + 밑에 버튼 2개 -->
		<div id="profile_detail">
			<!-- 이름 -->
			<p>로그인이 필요합니다.</p>
			<a href="<%= request.getContextPath() %>/member/LoginMember.jsp">로그인</a>
			<a href="<%= request.getContextPath() %>/member/InsertMember.jsp">회원가입</a>
		</div>	
			
<%
		} else {
%>		
		<img id="profileImg" src="../images/member/<%=memberVo.getMem_img() %>" alt="대충회원프로필1.png">
		<!-- 프로필 옆에 문구 + 밑에 버튼 2개 -->
		<div id="profile_detail">
			<!-- 이름 -->
			<p><%=memberVo.getMem_name() %>님 반갑습니다.</p>	
			<a href="<%= request.getContextPath() %>/member/mypageMember.jsp">마이페이지</a>
			<a href="<%= request.getContextPath() %>/logoutMember.do">로그아웃</a>
		</div>	
<% 
		}
%>
			
		
	</div>
</div>


<!--
	클래스 이름: nav - 메인 페이지 nav
	요소 : 중분류 요소들 (호텔 소개, 호텔 예약, 미용 예약, 상품, 고객센터)
 -->
<div class="nav">
	
	<div id="hotel_intro">
		<h3>소개</h3>
	</div>
	
	<div id="hotel_reserve">
		<h3>호텔</h3>
	</div>
	
	<div id="salon_reserve">
		<h3>미용</h3>
	</div>
	
	<div id="prod_sale">
		<h3>상품</h3>
	</div>
	
	<div id="hotel_help">
		<h3>Q&A</h3>
	</div>

</div>


<!-- 
	클래스 이름: containers - container 전체 묶음
	요소 : 메인 그림, 메인 호텔 예약 사진, 메인 미용 예약 사진, 베스트 상품 사진
 -->
<div class="containers">
	<!-- 전체게시판 - 완성이후 삭제예정 -->
	
	<h1>전체 게시판</h1>
	<div class="hr"></div>
	<div class="container">
  		<a href="<%=request.getContextPath()%>/boardList.do" style="text-align: left">게시판 전체조회</a> <br>
  		<iframe name="iboard" src="<%=request.getContextPath() %>/boardList.do"></iframe>
	</div>
	
	<h1>문의 게시판</h1>
	<div class="hr"></div>
	<div class="container">
  		<a href="<%=request.getContextPath()%>/boardList.do" style="text-align: left">문의 전체조회</a> <br>
		<iframe name="iboard" src="<%= request.getContextPath() %>/boardList_QUES.do" ></iframe>
	</div>
	
	<h1>신고 게시판</h1>
	<div class="hr"></div>
	<div class="container">
  		<a href="<%=request.getContextPath()%>/boardList.do" style="text-align: left">신고 전체조회</a> <br>
		<iframe name="iboard" src="<%= request.getContextPath() %>/boardList_ALER.do" ></iframe>
	</div>

	<h1>상품리뷰 게시판</h1>
	<div class="hr"></div>
	<div class="container">
  		<a href="<%=request.getContextPath()%>/boardList.do" style="text-align: left">상품리뷰 전체조회</a> <br>
		<iframe name="iboard" src="<%= request.getContextPath() %>/boardList_PROD.do"></iframe>
	</div>

	<h1>호텔리뷰 게시판</h1>
	<div class="hr"></div>
	<div class="container">
  		<a href="<%=request.getContextPath()%>/boardList.do" style="text-align: left">호텔리뷰 전체조회</a> <br>
		<iframe name="iboard" src="<%= request.getContextPath() %>/boardList_HOTE.do"></iframe>
	</div>
	
	<h1>미용리뷰 게시판</h1>
	<div class="hr"></div>
	<div class="container">
  		<a href="<%=request.getContextPath()%>/boardList.do" style="text-align: left">미용리뷰 전체조회</a> <br>
		<iframe name="iboard" src="<%= request.getContextPath() %>/boardList_SALO.do"></iframe>
	</div>
	
</div>


<!-- 
	클래스 이름: footer - 메인 페이지 맨 밑에 들어갈 호텔 간략 소개나 간략 지도 
	요소: 회사 이름, 찾아오는길 등 나중에 추가 예정
-->
<div class="footer">
	
	<div style="border: 1px solid black; width: 30%;">
		<p>대충 회사 소개</p>
	</div>
	
	<div style="border: 1px solid black; width: 30%;">
		<p>대충 지도</p>
	</div>
	
</div>

</body>
</html>