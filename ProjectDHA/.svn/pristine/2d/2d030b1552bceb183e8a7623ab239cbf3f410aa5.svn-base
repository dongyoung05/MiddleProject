<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DHA Main Page</title>

<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/공통스크립트.js"></script>
<link rel="stylesheet" href="../css/MainPage.css">

</head>

<style>
#listBox table{
	margin: 0 auto;
	width: 800px;
}
</style>

<%
// 여기는 Session 객체로 로그인 정보 받아올 곳
// 로그인 정보가 있냐 없냐에 따라 명함에 버튼, 프로필, 인삿말 변경되야함

String imgPath = request.getContextPath() + "/images";
MemberVO memberVo = (MemberVO)session.getAttribute("loginok");

%>

<script>

member = "<%= memberVo%>"
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


<!-- 
	클래스 이름: containers - container 전체 묶음
	요소 : 메인 그림, 메인 호텔 예약 사진, 메인 미용 예약 사진, 베스트 상품 사진
 -->
<div class="containers">
	<!-- 메인 그림 - 넘어가는 효과 만들 예정 -->
	<div class="container" id="mainImg">
		<img class="slideImg" style="position: relative; display: inline-block;" src="<%= imgPath %>/main/찐1.png" alt="찐1.png">
		<img class="slideImg" style="position: relative;" src="<%= imgPath %>/main/찐2.png" alt="찐2.png">
		<img class="slideImg" style="position: relative;" src="<%= imgPath %>/main/찐3.png" alt="찐3.png">
		<img class="slideImg" style="position: relative;" src="<%= imgPath %>/main/찐4.png" alt="찐4.png">
		
  		<button class="slideBtn" id="right"><p>&#10095;</p></button>
		<button class="slideBtn" id="left"><p>&#10094;</p></button>
	</div>
	
	<h1>DHA HOTEL</h1>
	<div class="hr"></div>
	<div class="container">
		<img src="<%= imgPath %>/main/스크린샷(152).png" alt="스크린샷(152).png">
		<img src="<%= imgPath %>/main/스크린샷(153).png" alt="스크린샷(153).png">
		<img src="<%= imgPath %>/main/스크린샷(154).png" alt="스크린샷(154).png">
	</div>

	<h1>Beauty & Bath</h1>
	<div class="hr"></div>
	<div class="container">
		<img src="<%= imgPath %>/main/목욕하는 강아지.jpg" alt="목욕하는 강아지.jpg">
		<img src="<%= imgPath %>/main/미용하는 강아지.jpg" alt="미용하는 강아지.jpg">
		<img src="<%= imgPath %>/main/washing-pet-dog-at-home.jpg" alt="washing-pet-dog-at-home.jpg">
	</div>

	<h1>Best Product Top3</h1>
	<div class="hr"></div>
	<div class="container">
		<img src="<%= imgPath %>/main/3163ab20-ab8d-4259-a212-e2219ed61df1_피너츠 강아지 장난감.png" alt="3163ab20-ab8d-4259-a212-e2219ed61df1_피너츠 강아지 장난감.png">
		<img src="<%= imgPath %>/main/4972fd0c-c21f-4bba-b3e4-0ad6dcef913c_LEd발톱깎기.png" alt="4972fd0c-c21f-4bba-b3e4-0ad6dcef913c_LEd발톱깎기.png">
		<img src="<%= imgPath %>/main/d7305c44-32ff-4d1a-a484-b6011629137e_로얄캐닌_엑스스몰 퍼피.png" alt="d7305c44-32ff-4d1a-a484-b6011629137e_로얄캐닌_엑스스몰 퍼피.png">
	</div>
	
	
</div>


<!-- 
	클래스 이름: footer - 메인 페이지 맨 밑에 들어갈 호텔 간략
	 소개나 간략 지도 
	요소: 회사 이름, 찾아오는길 등 나중에 추가 예정
-->


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