<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DHA Main Page</title>
<!-- 다른 곳에서 호출 할 경우 아래의 요소들을 넣어줘야함 -->
<!-- <script src="../js/jquery-3.7.1.min.js"></script> -->
<!-- <script src="../js/공통스크립트.js"></script> -->
<!-- <link rel="stylesheet" href="../css/MainPage.css"> -->
</head>

<%
// 여기는 Session 객체로 로그인 정보 받아올 곳
// 로그인 정보가 있냐 없냐에 따라 명함에 버튼, 프로필, 인삿말 변경되야함

String imgPath = request.getContextPath() + "/images";
MemberVO memberVo = (MemberVO)session.getAttribute("loginok");

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
		
	})
</script>
</head>
<body style="overflow-x: hidden">
	<div class="header">
	<!-- 로고 이미지 - images폴더에서 사진 가져옴 -->
	<img id="logo" src="<%= imgPath %>/main/DHA_logo3.png" alt="DHA_logo3.png">
	
		<div id="profile" class="profile">
			<%
			if(memberVo == null){			
			%>	
			<img id="profileImg" src="<%= imgPath %>/main/기본프로필.png" alt="기본프로필.png">
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
			<img id="profileImg" src="<%= imgPath %>/member/<%=memberVo.getMem_img() %>" alt="대충회원프로필1.png">
			<!-- 프로필 옆에 문구 + 밑에 버튼 2개 -->
			<div id="profile_detail">
				<!-- 이름 -->
				<p><%=memberVo.getMem_name() %>님 반갑습니다.</p>	
				<a href="<%= request.getContextPath() %>/selectMember.do?mem_id=<%=memberVo.getMem_id()%>">마이페이지</a>
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
		
		<div id="smallPage">
			<div id="sp1">
				<p id="sp1p1">회사 소개</p>
				<p id="sp1p2">조직도</p>
				<p id="sp1p3">찾아오는 길</p>
			</div>
			<div id="sp2">
				<p id="sp2p1">객실 소개</p>
				<p id="sp2p2">객실 예약</p>
			</div>
			<div id="sp3">
				<p id="sp3p1">미용 소개</p>
				<p id="sp3p2">미용 예약</p>
			</div>
			<div id="sp4">
				<p id="sp4p1">상품</p>
				<p id="sp4p2">장바구니</p>
			</div>
			<div id="sp5">
				<p id="sp5p1">공지사항</p>
				<p id="sp5p2">문의게시판</p>
				<p id="sp5p3">자주하는 질문</p>
			</div>
		</div>
	</div>

</body>
</html>