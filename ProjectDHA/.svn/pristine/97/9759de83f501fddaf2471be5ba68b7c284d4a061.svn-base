<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prodDetail</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/공통스크립트.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/MainPage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ProdPage.css">
	<%
		String prodImgPath = request.getContextPath() + "/images/prod";
		ProdVO prod = (ProdVO)request.getAttribute("prodVo");
		ProdVO ctgry = (ProdVO)request.getAttribute("ctgryVo");
		String prodNo = (String)request.getAttribute("prodNo");
	%>
<script>
	
	$.resize = function(){
		size1 = $('#prodImg').height()+ 100;
		size2 = $('.descInfo tbody').height()+ 100;
		size3 = size1 > size2 ? size1 : size2;
		console.log(size1 + " " + size2 + "  " + size3);
		$('#detail_container').css('height', size3);
	}
	
	$(function(){
		
		$.resize();
		$(window).resize(function(){$.resize()});
		
		// h3에 이름 띄우기
		$('#hprodName').text($('#prodName').text());
		
		//	상품 수정 이벤트
		$('#modifyProd').on('click', function(){
			location.href = '<%= request.getContextPath() %>/prod/getSelectProd.do?prodNo=<%= prodNo %>&trigger=Y';
		})
		
		//	상품 삭제 이벤트
		$('#deleteProd').on('click', function(){
			location.href = '<%= request.getContextPath() %>/prod/prodDelete.do?prodNo=<%= prodNo %>';
		})
		
		$('#goBack').on('click', function(){
			window.history.back();
		})
		
	})
</script>
</head>

<body>
<%@ include file="../admin/view/AdminView.jsp" %>	
		<div id="container">
	
		<h3 id="hprodName" style="text-align: center; margin-top: 50px;"></h3>
		<div class="hr" style="margin-bottom: 50px;"></div>
	
		<div id="sectionDetail">
			<div id="detail_container">
				<div class="asideImg">
					<img id="prodImg" alt="<%= prod.getProd_img() %>" src="<%= prodImgPath %>/<%= prod.getProd_img()%>">
<%-- 					<img id="prodImg" src="<%= request.getContextPath() %>/prod/imageView.do?prod_no=<%= prod.getProd_no() %>"> --%>
				</div>
				<div class="descInfo">
					<table border="1">
						<tr>
							<td><p class="key">상품명</p></td>
							<td><p class="value" id="prodName"><%= prod.getProd_name() %></p></td>
						</tr>
						<tr>
							<td><p class="key">상품 분류 / 상품 분류명</p></td>
							<td><p class="value"><%= prod.getProd_ctgry_id() %> / <%= ctgry.getProd_ctgry_name() %></p></td>
						</tr>
						<tr>
							<td><p class="key">소개</p></td>
							<td><p class="value"><%= prod.getProd_desc() %></p></td>
						</tr>
						<tr>
							<td><p class="key">상품의 사이즈</p></td>
							<td><p class="value"><%= prod.getProd_size() %></p></td>
						</tr>
						<tr>
							<td><p class="key">견종 체급</p></td>
							<td><p class="value"><%= prod.getProd_weight() %></p></td>
						</tr>
						<tr>
							<td><p class="key">가격</p></td>
							<td><p class="value"><%= prod.getProd_price() %></p></td>
						</tr>
						<tr>
							<td><p class="key">상품 수량</p></td>
							<td>
								<select name="prod_qty" id="prod_qty">
									<%
										for(int i = 1; i <= 50; i++) {
									%>
											<option value="<%= i %>"><%= i %></option>
									<%
										}
									%>
								</select>
							</td>
						</tr>
						<tr>
							<td style="border: none; text-align: center;" colspan="2">
								<input type="button" id="modifyProd" value="수정">
								<input type="button" id="deleteProd" value="삭제">
								<input type="button" id="goBack" value="돌아가기">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
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