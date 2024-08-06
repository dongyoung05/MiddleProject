<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> -->
  <script src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/중분류페이지공통스타일.css">
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
    #board_insert{
    	background-color: #333;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
        margin-right: 10px;	
    }
</style>



<%
// 여기는 Session 객체로 로그인 정보 받아올 곳
String imgPath = request.getContextPath() + "/images";
MemberVO memberVo = (MemberVO)session.getAttribute("loginok");
String p = "";
p = request.getParameter("p");

%>
<script>
$(function(){
 	
	$.resize();
	//------------------------------------------------------------------------------
	// 옆에 소분류 페이지 클릭시 해당 페이지를 iframe으로 출력 + 중분류 제목(section) 바꾸기
	$('#side p').on('click', function(){
		
		$('#title h2').text($(this).text());
		
		// p태그 id 가져와서 소분류 페이지를 iframe안에 띄움
		if($(this).attr('id') == 'p1') {
			 location.href="<%=request.getContextPath()%>/noticeList.do"
		} else if($(this).attr('id') == 'p2'){
			location.href="<%=request.getContextPath()%>/boardList_QUES.do"
		} else if($(this).attr('id') == 'p3'){
			location.href="<%=request.getContextPath()%>/board/oftenQuestion.jsp"
		}
	})
	//------------------------------------------------------------------------------
	
	$('#board_insert').on('click', function(){
		 loginMemberVo = '<%= session.getAttribute("loginok") %>'; //  memberVo 변수를 선언하고 session에서 값을 받아옴.
		if(loginMemberVo === 'null'){ // '==='를 사용하여 값과 타입을 비교합니다.
			alert("로그인이 필요한 서비스입니다.")
			return false;
		} else {
			location.href='<%=request.getContextPath()%>/board/boardInsert.jsp'	
		}
	})
	
	$(window).resize(function(){$.resize()});
})

$.resize = function(){
	size = $('table').height() + 200;
	console.log(size);
	$('.containaer').css('height', size);
}
</script>
</head>
<%
	List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList_QUES");

%>
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
	<h2>문의게시판</h2>
</div>

<div id="side" style="margin-bottom: 50px;">
	<p id="p1">공지사항</p>		
	<p id="p2">문의게시판</p>		
	<p id="p3">자주하는 질문</p>		
</div>

<div class="containaer">
		<input type="button" value="문의 등록" id="board_insert" > 
		<table border="1" class="table table-hover">
	

		<tr>
			<th>제목</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>	
<%
			for(BoardVO board : boardList) {
%>
		<tr>
			<td> <a href="<%=request.getContextPath()%>/boardDetail.do?board_no=<%= board.getBoard_no()%>"> <%= board.getBoard_title()%> </a></td>
			<td><%= board.getBoard_date() %></td>
			<td><%= board.getBoard_views() %></td>
		</tr>
			
		
<%
		}
%>	
	</table>
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

<!-- 회사 소개

상호: (주)퍼피랑  대표자: 최영호
사업자등록번호:567-89-10112 [사업자정보확인] 
통신판매업 신고번호 제 2024-대전오류-305호
주소: 대전 중구 계룡로 846 3층


평일 10:00 - 18:00
점심시간 12:00-14:00
토요일, 일요일, 공휴일 휴무입니다. -->


</body>
</html>