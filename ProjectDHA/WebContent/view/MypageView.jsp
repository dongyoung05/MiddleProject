<%@page import="kr.or.ddit.vo.DogVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>

<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/공통스크립트.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/MainPage.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/중분류페이지공통스타일.css">



</head>

<%
	
	MemberVO memberVo = (MemberVO)session.getAttribute("loginok");
	String imgPath = request.getContextPath() + "/images";
	List<DogVO> dlist = (List<DogVO>)session.getAttribute("myDogList");
	
%>
<script type="text/javascript">

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
		
		$('#insertDog').click(function(){
			location.href="<%= request.getContextPath()%>/dog/dogInsert.jsp?mem_id=<%=memberVo.getMem_id()%>";
		})
		
		$('#updateMember').click(function(){
			location.href="<%= request.getContextPath()%>/member/UpdateMember.jsp";
		})
		$('#p1').click(function(){	// 회원정보
			location.href="<%=request.getContextPath()%>/member/mypageMember2.jsp";
		})
		$('#p2').click(function(){	// 반려견 정보
			location.href="<%=request.getContextPath()%>/dog/mypageDog.jsp";
		})
		$('#p3').click(function(){	// 예약내역
			location.href="<%=request.getContextPath()%>/room/myReserve.jsp";
		})
		$('#p4').click(function(){	// 결제내역
			location.href="<%=request.getContextPath()%>/payment/myPayment.jsp";
		})
		$('#p5').click(function(){	// 나의리뷰
			location.href="<%=request.getContextPath()%>/member/selectReview.jsp";
		})
		$('#p6').click(function(){ // 회원탈퇴
			path = '<%=request.getContextPath() %>';
			mem_id = '<%=memberVo.getMem_id() %>';
			
			
			if(confirm("정말 삭제하시겠습니까?")){
				$.ajax({
					url : `${path}/deleteMember.do`,
					data : {"mem_id" : mem_id},
					dataType : 'json',
					success : function(res){
						
						alert(res.flag + "에 성공했습니다.");
						location.href="logoutMember.do";
					},
					error : function(xhr){
						alert('상태 : '+ xhr.status);
					},
					type : 'post'
				})	
			} else {
				alert('삭제를 취소했습니다.');
			}
			
			
		})
	})

</script>

<body style="overflow-x : hidden">
<!-- 
	클래스 이름: header - 메인 페이지 맨 위 div
	요소: logo, profile(명함)
 -->
<div class="header">
	<!-- 로고 이미지 - images폴더에서 사진 가져옴 -->
	<img id="logo" src="<%= imgPath %>/main/DHA_logo3.png" alt="DHA_logo3.png">
	
	<div id="profile" class="">
		<%
		if(memberVo == null){			
		%>	
		<img id="profileImg" src="<%= imgPath %>/main/기본프로필.png" alt="대충회원프로필1.png">
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
		<h2>마이페이지</h2>
	</div>
	
	<div id="side">
		<p id="p1">회원정보</p>		
		<p id="p2">반려견 프로필</p>		
		<p id="p3">예약내역</p>		
		<p id="p4">결제내역</p>		
		<p id="p5">나의리뷰</p>		
		<p id="p6">회원탈퇴</p>		
	</div>
	
	
	
	
	
	
	
</body>
</html>