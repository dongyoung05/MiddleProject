<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/공통스크립트.js"></script>
<link rel="stylesheet" href="../css/중분류페이지공통스타일.css">
<link rel="stylesheet" href="../css/Modal창.css">

</head>

<style>


</style>

<%
// 여기는 Session 객체로 로그인 정보 받아올 곳
// 로그인 정보가 있냐 없냐에 따라 명함에 버튼, 프로필, 인삿말 변경되야함

String imgPath = request.getContextPath() + "/images";
MemberVO memberVo = (MemberVO)session.getAttribute("loginok");
String p = "";
p = request.getParameter("p");

%>


<script>


$(function(){
	// 소분류 페이지 선택 이동 효과
	if('<%= p %>' == 'p2'){
		$('#title h2').text($('#p2').text());
		$('#ifr').attr('src', "./roomReserve.jsp");
	} 
	
	// 옆에 소분류 페이지 클릭시 해당 페이지를 iframe으로 출력 + 중분류 제목(section) 바꾸기
	$('#side p').on('click', function(){
		
		$('#title h2').text($(this).text());
		
		// p태그 id 가져와서 소분류 페이지를 iframe안에 띄움
		if($(this).attr('id') == 'p1') {
			$('#ifr').attr('src', "./roomIntro.html");
		} else if($(this).attr('id') == 'p2'){
			$('#ifr').attr('src', "./roomReserve.jsp");
		}
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


<div id="title">
	<h2>객실 소개</h2>
</div>

<div id="side">
	<p id="p1">객실 소개</p>		
	<p id="p2">객실 예약</p>
</div>

<div id="section">
	<iframe id="ifr" src="./roomIntro.html"></iframe>
</div>




<!-- 
	클래스 이름: footer - 메인 페이지 맨 밑에 들어갈 호텔 간략 소개나 간략 지도 
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



<!-- Modal 창 띄우기 -->
<div id="m1" class="modal_container" style="margin: none;">
	<div class="modal">
		<div class="modal_header">
			<h3>예약 정보 확인</h3>
		</div>
		<hr>
		<div class="modal_content">
			<h3>예약자 정보</h3>
			<p>
				<span class="modalSpan">이름</span>
				<span id="mmemName"></span>
			</p>
			<p>
				<span class="modalSpan">ID</span>
				<span id="mmemId"></span>
			</p>
			<p>
				<span class="modalSpan">EMAIL</span>
				<span id="mmemMail"></span>
			</p>
			
			<h3>반려견 정보</h3>
			<p>
				<span class="modalSpan">이름</span>
				<span id="mdogName"></span>
			</p>
			<p>
				<span class="modalSpan">무게</span>
				<span id="mweight"></span>
			</p>
			
			<h3>예약 정보</h3>
			<p>
				<span class="modalSpan">IN</span>
				<span id="min"></span>
			</p>
			<p>
				<span class="modalSpan">OUT</span>
				<span id="mout"></span>
			</p>
			
			<h3>가격</h3>
			<p>
				<span class="modalSpan">총 가격</span>
				<span id="mprice"></span>
			</p>
		</div>
		<hr>
		<div class="modal_footer">
			<button id="cancel">예약취소</button>
			<button id="pay">결제</button>
		</div>
	</div>
</div>




</body>
</html>