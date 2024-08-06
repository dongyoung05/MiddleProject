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
        padding: 10px;
        text-align: left;
    }
    #reviewInsert {
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
// 로그인 정보가 있냐 없냐에 따라 명함에 버튼, 프로필, 인삿말 변경되야함

String imgPath = "../images/main";
MemberVO memberVo = (MemberVO)session.getAttribute("loginok");
String p = "";
p = request.getParameter("p");

%>


<script>


$(function(){
	
$('#side p').on('click', function(){
		
		
		
		// p태그 id 가져와서 소분류 페이지를 iframe안에 띄움
		if($(this).attr('id') == 'p1') {
			location.href="<%=request.getContextPath()%>/boardList_SALO.do"
		} else if($(this).attr('id') == 'p2'){
			location.href="<%=request.getContextPath()%>/boardList_HOTE.do"
		} else if($(this).attr('id') == 'p3'){
			location.href="<%=request.getContextPath()%>/boardList_PROD.do"
		}
	})
 	
	// 소분류 페이지 선택 이동 효과
	if('<%= p %>' == 'p1'){
		location.href="<%=request.getContextPath()%>/boardList_SALO.do"
	} else if('<%= p %>' == 'p2'){
		location.href="<%=request.getContextPath()%>/boardList_HOTE.do"
	} else if('<%= p %>' == 'p3'){
		location.href="<%=request.getContextPath()%>/boardList_PROD.do"
	} 
	
	
	
})
</script>
</head>
<%
	List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList_PROD");
%>
<body>
<body>

<!-- 
	클래스 이름: header - 메인 페이지 맨 위 div
	요소: logo, profile(명함)
 -->
<div class="header">
	<!-- 로고 이미지 - images폴더에서 사진 가져옴 -->
	<img id="logo" src="<%=request.getContextPath()%>/images/main/DHA_logo3.png" alt="DHA_logo3.png">
	
	<div id="profile" class="profile">
		<!-- 프로필 이미지 - images 폴더에서 사진 가져옴 추후에 변경해야함 -->
		<img id="profileImg" src="<%= imgPath %>/대충회원프로필1.png" alt="대충회원프로필1.png">
		<!-- 프로필 옆에 문구 + 밑에 버튼 2개 -->
		<div id="profile_detail">
			<!-- 이름 -->
			
		<%
		if(memberVo == null){			
		%>	
			<p>로그인이 필요합니다.</p>
			<a href="<%= request.getContextPath() %>/member/LoginMember.jsp">로그인</a>
			<a href="<%= request.getContextPath() %>/member/InsertMember.jsp">회원가입</a>
<%
		} else {
%>	
			<p><%=memberVo.getMem_name() %>님 반갑습니다.</p>	
			<a href="#">마이페이지</a>
			<a href="<%= request.getContextPath() %>/logoutMember.do">로그아웃</a>
<% 
		}
%>
			
		</div>
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
		</div>
		<div id="sp5">
			<p id="sp5p1">공지사항</p>
			<p id="sp5p2">문의게시판</p>
			<p id="sp5p3">리뷰게시판</p>
		</div>
	</div>
</div>


<div id="title">
	<h2>리뷰게시판</h2>
</div>

<div id="side">
	<p id="p1">미용리뷰</p>		
	<p id="p2">호텔리뷰</p>		
	<p id="p3">상품리뷰</p>		
</div>

<h2>상품리뷰</h2>
<div class="containaer">
		<input type="button" value="리뷰 등록" id="reviewInsert" onClick="location.href='<%=request.getContextPath()%>/board/reviewInsert.jsp'"> 
		<table border="1" class="table table-hover">
	

		<tr>
			<th>리뷰점수</th>
			<th>제목</th>
			<th>작성일자</th>
		</tr>	
<%
			for(BoardVO board : boardList) {
%>
		<tr>
			<td> <%= board.getReview_score()%>   </td>
			<td> <a href="<%=request.getContextPath()%>/reviewDetail.do?board_no=<%= board.getBoard_no()%>"> <%= board.getBoard_title()%> </a></td>
			<td><%= board.getBoard_date() %></td>
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
<div class="footer">
	
	<div>
		<p>평일 10:00 - 18:00  |  점심시간 12:00-14:00  |  토요일, 일요일, 공휴일 휴무입니다.</p>
	</div>
	
	<div>
		<p>상호: (주)DHA  |  대표: 백지열  |  주소: 대전 중구 계룡로 846 3층</p>
	</div>
	
</div>

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