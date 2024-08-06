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
<link rel="stylesheet" href="../css/MainPage.css">
<link rel="stylesheet" href="../css/ProdPage.css">
	<%
		String prodImgPath = "../images/prod";
		ProdVO prod = (ProdVO)request.getAttribute("prodVo");
		ProdVO ctgry = (ProdVO)request.getAttribute("ctgryVo");
		String prodNo = (String)request.getAttribute("prodNo");
	%>
</head>

<body>

	<!-- 공통 헤더 출력 -->
	<%@ include file="../view/commonView.jsp" %>	
	
		<div id="container">
		
	<!-- 상품 공통 검색창 출력 -->
	<%@ include file="../prod/view/prodView.jsp" %>	
	
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
							<td style="border: none; text-align: center;">
							</td>
							<td style="border: none; text-align: center;">
								<input type="button" id="insertCart" value="장바구니에 담기">
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
		
		$('#insertCart').on('click', function(){
			
// 			qtyPath = $(this).parents('#prod_container').find('#prod_qty');
// 			prodQty = $(this).parents('#prod_container').find('#prod_qty').val();
			prodQty = $('#prod_qty option:selected').val();
			prodNo = <%= prodNo %>
			
			<%
			 if(memberVo == null) {
			%>
				alert("로그인이 필요한 기능입니다.");
			<%
			} else {
			%>
				memberId = "<%= memberVo.getMem_id() %>"
				$.ajax({
					url : "<%= request.getContextPath() %>/cart/cartInsert.do",
					data : { "prodNo" : prodNo,
							 "prodQty" : prodQty,
							 "mem_id" : memberId},
					type : 'post',
					success : function(result) {
						if(result.flag == "성공"){
							alert("상품을 장바구니에 담았습니다.")//
							
							if(confirm("장바구니로 이동하시겠습니까?")){
								location.href="<%= request.getContextPath() %>/cart/cartMain.jsp";
							}
						}
					},
					error : function(xhr) {
						alert("상태 : " + xhr.status)
					},
					dataType : 'json'
				})
			<%
			}
			%>
		})		//	#insertCart 종료
	})
</script>

</html>