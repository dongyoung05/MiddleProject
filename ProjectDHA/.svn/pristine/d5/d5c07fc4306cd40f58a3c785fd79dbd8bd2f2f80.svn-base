<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prod Sale</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/공통스크립트.js"></script>
<link rel="stylesheet" href="../css/MainPage.css">
<link rel="stylesheet" href="../css/ProdPage.css">

<script>
	$(function(){
		//	상품 상세보기
		$('.description').on('click', function(){
			prodNo = $(this).attr('idx');
			location.href = `<%= request.getContextPath() %>/prod/getSelectProd.do?prodNo=${prodNo}`;
		})
		
	})		//	$(function()) 종료

</script>
</head>
	<%
	String prodImgPath = "../images/prod";
	List<ProdVO> prodList = (List<ProdVO>)request.getAttribute("prodList");
	%>
<body>
	<!-- 공통 헤더 출력 -->
	<%@ include file="../view/commonView.jsp" %>
	
	<div id="container">
	<!-- 상품 공통 검색창 출력 -->
	<%@ include file="../prod/view/prodView.jsp" %>
	
		<div id="section">
			<h2 id="h2name">상품</h2>
			<div class="hr"></div>
			<div id="prod_container">
			<%
			if(prodList == null || prodList.isEmpty()){
			%>
				<div class="non-item">
					<h4>상품에 대한 정보가 없습니다.</h4>
				</div>
			<%
			} else {
			%>
				<%
				for(ProdVO prod : prodList) {
					int price = prod.getProd_price();
					DecimalFormat format = new DecimalFormat("###,###,###");
				%>
					<div class="item">
						<div class="thumbnail">
							<img alt="<%= prod.getProd_img() %>" src="<%= prodImgPath %>/<%= prod.getProd_img()%>">
<%-- 							<img src="<%= request.getContextPath() %>/prod/imageView.do?prod_no=<%= prod.getProd_no() %>" width="200px"> --%>
						</div>
						<div class="description" idx="<%= prod.getProd_no() %>">
							<p class="prod_name"><%= prod.getProd_name() %></p>
							<p class="prod_price"><%= format.format(price) %>원</p>
						</div>
					</div>
				<%
				}
				%>
			<%
			}
			%>
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

<script type="text/javascript">

size = $('#prod_container').height() + 300;
console.log(size)
$('#section').css('height', size);

</script>

</html>