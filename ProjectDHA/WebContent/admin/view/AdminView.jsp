<%@page import="kr.or.ddit.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include 하는 페이지에서 아래의 2개를 포함해야함 -->
<!-- <script src="../js/jquery-3.7.1.min.js"></script> -->
<!-- <link rel="stylesheet" href="../css/MainPage.css"> -->
</head>
<%
String imgPath = request.getContextPath() + "/images";
AdminVO adminVo = (AdminVO)session.getAttribute("adminok");
%>
<script>
$(function(){

	// 메인 사진 오른쪽 화살표 눌렀을 때 사진 이동
	$('#right').on('click', function(){
		$.slideImg(1);
	})
	
	$('#left').on('click', function(){
		$.slideImg(-1);
	})
	
	// 현재 메인 페이지 사진
	curMainImg = 1;
	
	setInterval(function(){
		$.slideImg(1);
	}, 3000);
	
	$.slideImg = function(n){
		if(n == 1 && curMainImg == $('.slideImg').length) {
			curMainImg = 1;
		}else if(n == -1 && curMainImg == 1) {
			curMainImg = $('.slideImg').length;
		} else{
			curMainImg = curMainImg + n;
		}
		
		$.each($('.slideImg'), function(i, v){
			$(v).css('display', 'none');
			
			if(i == curMainImg - 1) $(v).css('display', 'inline-block');
		});
	}
	// 로고 클릭시 홈으로
	$('#logo').on('click', function(){
		location.href="/ProjectDHA/admin/AdminMain.jsp";
	})
		
	//	중분류 페이지 이동
	//	게시판 관리
	$('#board_admin').on('click', function(){
		location.href="/ProjectDHA/noticeListAdmin.do";
	})
		
	//	서비스(호텔, 미용) 관리
	$('#service_admin').on('click', function(){
		location.href="/ProjectDHA/admin/service_room_admin.jsp";
	})
	
	//	회원 정보 관리
	$('#member_admin').on('click', function(){
		location.href="/ProjectDHA/memberListAdmin.do";
	})
	
	//	상품 정보 관리
	$('#prod_admin').on('click', function(){
		location.href="/ProjectDHA/pageProdAdmin.do?page=1";
	})
		
		
	// hover 효과
	$('#smallPage').hide();
		
	$('#bigPage div').on('mouseenter', function(){
		$(this).css('color', 'gray');
		$('#smallPage').show();
	})
		
	$('#bigPage div').on('mouseleave', function(){
		$(this).css('color', 'black');
	})
		
	$('#smallPage p').on('mouseenter', function(){
		$(this).css('color', 'black');
	})
		
	$('#smallPage p').on('mouseleave', function(){
		$(this).css('color', 'gray');
	})
	
	$('.nav').on('mouseleave', function(){
		$('#smallPage').hide();
	})
		
})

</script>


<body style="overflow-x: hidden">

<!-- 
	클래스 이름: header - 메인 페이지 맨 위 div
	요소: logo, profile(명함)
 -->
<div class="header">
	<!-- 로고 이미지 - images폴더에서 사진 가져옴 -->
	<img id="logo" src="<%= imgPath %>/main/DHA_logo3.png" alt="DHA_logo3.png">
	
	<div id="profile" class="profile">
		<%
		if(adminVo == null){			
		%>	
		<img id="profileImg" src="<%= imgPath %>/main/대충회원프로필1.png" alt="대충회원프로필1.png">
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
		<img id="profileImg" src="<%= imgPath %>/main/DHA_logo3.png" alt="DHA_logo3.png">
		<!-- 프로필 옆에 문구 + 밑에 버튼 2개 -->
		<div id="profile_detail">
			<!-- 이름 -->
			<p><%=adminVo.getAdmin_name() %>님 반갑습니다.</p>	
			<a href="<%=request.getContextPath()%>/admin/adminPage.jsp">관리자</a>
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
	
	<div id="bigPage">
		<div id="board_admin">
			<h3>게시판 관리</h3>
		</div>
		
		<div id="service_admin">
			<h3>서비스 관리</h3>
			<!-- 호텔, 미용 -->
		</div>
		
		<div id="member_admin">
			<h3>회원 관리</h3>
		</div>
		
		<div id="prod_admin">
			<h3>상품 관리</h3>
		</div>
		
	</div>
	
</div>

</body>
</html>