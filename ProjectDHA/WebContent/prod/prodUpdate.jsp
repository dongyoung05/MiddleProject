<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prodDetail</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/공통스크립트.js"></script>
<link rel="stylesheet" href="../css/MainPage.css">
<link rel="stylesheet" href="../css/ProdPage.css">
<style>
	#section {
		width : 100%;
		display: flex;
		justify-content: center;
	}
	#prod_container{
		width : 80%;
		height : 1000px;
		border : 1px black solid;
		display : flex;
		justify-content : flex-start;
	}
	.asideImg .descInfo {
		width : 45%;	
	}
	#prodImg {
		width : 500px;
		height : 500px;
	}
</style>
	<%
		String imgPath = "../images/main";
		String prodImgPath = "../images/prod";
		MemberVO memberVo = (MemberVO)session.getAttribute("loginok");
		ProdVO prod = (ProdVO)request.getAttribute("prodVo");
		String prodNo = (String)request.getAttribute("prodNo");
	%>
<script>
	$(function(){
		
		//	상품 분류 불러오기
		$.ajax({
			url : `<%= request.getContextPath() %>/prod/getAllCtrgy.do`,
			type : 'post',
			dataType : 'json',
			success : function(result){
				code = "";
				$.each(result, function(i,v){
					code += `<option value="${v.prod_ctgry_id}"> ${v.prod_ctgry_name} </option>`;
				})
				
				$('#prod_ctgry_id').append(code);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			}
		})
		
		//	로고 클릭시 홈으로
		$('#logo').on('click', function(){
			location.href="<%= request.getContextPath()%>/main/main.jsp";
		})
		
		//	중분류 페이지 이동
		$('#hotel_intro').on('click', function(){
			location.href="<%= request.getContextPath()%>/hotel/hotelIntro.jsp";
		})
		
		//	호텔 예약 페이지 이동
		$('#hotel_reserve').on('click', function(){
			location.href="<%= request.getContextPath()%>/hotel/hotelReserve.jsp";
		})
		
		//	미용 예약 페이지 이동
		$('#salon_reserve').on('click', function(){
			location.href="<%= request.getContextPath()%>/salon/salonReserve.jsp";
		})
		
		//	애견상품 판매 페이지 이동
		$('#prod_sale').on('click', function(){
			location.href="<%= request.getContextPath()%>/prod/getAllProd.do";
		})
		
		//	문의사항 페이지 이동
		$('#hotel_help').on('click', function(){
			location.href="<%= request.getContextPath()%>/hotel/hotelHelp.jsp";
		})
		
		//	등록 버튼
		$('#insertProd').on('click', function(){
			location.href = "<%= request.getContextPath() %>/prod/prodAdmin.jsp";
		})
		
		//	상품 수정 이벤트
		$('#modifyProd').on('click', function(){
			prodNo = <%= prod.getProd_no() %>
			location.href = '<%= request.getContextPath() %>/prod/prodUpdate.do?prodNo=<%= prodNo %>';
		})
	})
</script>
</head>

<body>

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
			<div id="profile_detail">
				<p><%=memberVo.getMem_name() %>님 반갑습니다.</p>	
				<a href="<%= request.getContextPath() %>/member/mypageMember.jsp">마이페이지</a>
				<a href="<%= request.getContextPath() %>/logoutMember.do">로그아웃</a>
			</div>	
			<% 
			}
			%>
		</div>
	</div>

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
	
		<div id="container">
		<div id="side">
			<h3>애견 상품</h3>
			<p class="ctrgyBar">사료</p>		
			<p class="ctrgyBar">간식</p>		
			<p class="ctrgyBar">의류</p>		
			<p class="ctrgyBar">악세사리</p>		
			<p class="ctrgyBar">위생용품</p>		
			<p class="ctrgyBar">배변용품</p>		
			<p class="ctrgyBar">목욕용품</p>		
			<p class="ctrgyBar">산책용품</p>		
			<p class="ctrgyBar">훈련용품</p>		
			<p class="ctrgyBar">장난감</p>		
		</div>
		
		<div id="section">
			<div id="prod_container">
				<div class="asideImg">
					<img id="prodImg" alt="<%= prod.getProd_img() %>" src="<%= prodImgPath %>/<%= prod.getProd_img()%>">
				</div>
				<div class="descInfo">
					<form action="<%= request.getContextPath() %>/prod/prodUpdate.do?prodNo=<%= prodNo %>" method="post" enctype="multipart/form-data">
						<table border="1">
							<tr>
								<td><p class="key">상품명</p></td>
								<td><input type="text" name="prod_name" id="prod_name" value="<%= prod.getProd_name() %>"></td>
							</tr>
							<tr>
								<td><p class="key">소개</p></td>
								<td><textarea rows="5" cols="50" name="prod_desc" id="prod_desc"><%= prod.getProd_desc() %></textarea></td>
							</tr>
							<tr>
								<td>상품 사이즈</td>
								<td>
									<select name="prod_size" id="prod_size">
										<option value="없음">없음</option>
										<option value="S"   >S</option>
										<option value="M"   >M</option>
										<option value="L"   >L</option>
										<option value="XL"  >XL</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>견종의 체급</td>
								<td>
									<select name="prod_weight" id="prod_weight">
										<option>소형</option>
										<option>중형</option>
										<option>대형</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>상품 색상</td>
								<td><input type="text" name="prod_color" id="prod_color" placeholder="색상이 없는 상품의 경우 비울 것"></td>
							</tr>
							<tr>
								<td>상품 이미지</td>
								<td><input type="file" name="prod_img" id="prod_img"></td>
							</tr>
							<tr>
								<td><p class="key">가격</p></td>
								<td><input type="number" name="prod_price" id="prod_price" value="<%= prod.getProd_price() %>"></td>
							</tr>
							<tr>
								<td>상품 분류 선택</td>
								<td>
									<select name="prod_ctgry_id" id="prod_ctgry_id">
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" id="updateProd" value="수정">
									<input type="button" id="" value="확인">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		
	</div>
	
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