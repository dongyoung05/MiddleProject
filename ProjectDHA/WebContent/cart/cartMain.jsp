<%@page import="kr.or.ddit.vo.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Main</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/cartScripts.js"></script>
<script src="../js/공통스크립트.js"></script>
<link rel="stylesheet" href="../css/MainPage.css">
<link rel="stylesheet" href="../css/CartPage.css">
<link rel="stylesheet" href="../css/Modal창.css">
<%
 	CartVO cartVo = (CartVO)session.getAttribute("cart");
%>
<script>
	mypath = '<%= request.getContextPath() %>';
	prodImgPath = "../images/prod";
	
	$(function(){
		$.cartList();
	})
</script>
<style>

</style>
</head>
<body>

	<!-- 공통 헤더 출력 -->
	<%@ include file="../view/commonView.jsp" %>
	<div class="full-hr"></div>
	
	<div id="cart_section">
	</div>
	<div class="backProd">
    <input type="button" value="상품 페이지로 돌아가기" id="backProd">
</div>

<!-- Modal 창 띄우기 -->
<div class="modal_container" style="margin: none;">
	<div class="modal">
		<div class="modal_header">
			<h3>구매 정보 확인</h3>
		</div>
		<hr>
		<div class="modal_content">
			<h3>상품 목록</h3>
			<div id="modal_items">
			</div>
			<hr>
			<h3>가격</h3>
			<p>
				<span class="modalSpan">전체 가격</span>
				<span id="mprice"></span>
			</p>
		</div>
		<hr>
		<div class="modal_footer">
			<button id="cancel">창 닫기</button>
			<button id="pay">결제</button>
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
	$(document).ready(function(){
		//	장바구니 물품 수량 버튼 클릭 이벤트
		$(document).on('click', '.qty-button', function(){
			prodId = $(this).parents('.cartProdContainer').attr('id');
			symbol = $(this).val();
			
			$.modifyProdCart(prodId, symbol);
		})
		
		//	장바구니 물품 삭제 이벤트
		$(document).on('click', '.removeButton', function(){
			prodId = $(this).parents('.cartProdContainer').attr('id');
			
			$.deleteProdCart(prodId);
		})
		
	})

	//	상품 리스트로 돌아가기 버튼
	$('#backProd').on('click', function(){
		location.href="/ProjectDHA/prod/getAllProd.do";
	})
	
	// 예약하기를 눌렀을 때 예약하기
	$(document).on('click', '#checkout', function(){
		
		//	합산 가격 가져오기
		sumPrice = $(this).prev().attr('price');
		console.log("sumPrice : " + sumPrice);
		
		//	담긴 상품의 가짓수 가져오기
		var arrayLength = $(".cartProdContainer");
		
		//	각 상품의 이름 값 가져오기
		var nameArray = [];
		for(var i = 0; i < arrayLength.length; i++) {
			var prodName = $(this).parents('.sectionContainer').find('.cartProdName:eq(' + i + ')').attr('name');
			console.log(i + " Name >>>>>>> " + prodName)
			nameArray.push(prodName);
		}
		console.log("nameArray >>>> " + nameArray)
		
		//	각 상품의 수량 값 가져오기
		var qtyArray = [];
		for(var i = 0; i < arrayLength.length; i++) {
			var qty = $(this).parents('.sectionContainer').find('.cartProdQty:eq(' + i + ')').text();
			console.log(i + " QTY >>>>>>> " + qty)
			qtyArray.push(qty);
		}
		console.log("QtaArray >>>>>> " + qtyArray);
		
		//	각 상품의 가격 값 가져오기
		var priceArray = [];
		for(var i = 0; i < arrayLength.length; i++) {
			var price = $(this).parents('.sectionContainer').find('.prodPrice:eq(' + i + ')').attr('price');
			console.log(i + " price >>>>>>> " + price)
			price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			priceArray.push(price);
		}
		console.log("PriceArray >>>>>> " + priceArray);
		
		//	modal에 출력할 목록 작성
		modalCode = "";
		for(var i = 0; i < arrayLength.length; i++) {
			modalCode += `<div class="modalName">${nameArray[i]}</div>
			              <div class="modalQty">${qtyArray[i]}개</div>
			              <div class="modalPrice">${priceArray[i]}원</div>
			              <div class="modalLine"></div>`;
		}
		console.log("CODE >>>> " + modalCode)
		printSumPrice = sumPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		sumCode = `${printSumPrice} 원`;
		
		//	modal 창에 출력
		$('#modal_items').html(modalCode);
		$('#mprice').html(sumCode);
		$.showModal();
	})
	
	//	장바구니 확인 Modal창 띄우기
	$.showModal = function(){
		console.log('show');
		$('.modal_container', parent.document).fadeIn(200);
	};

	$.closeModal = function(){
		console.log('close');
		$('.modal_container', parent.document).fadeOut(200);
	};

	$('#cancel', parent.document).on('click', function(){
		$.closeModal();
	});

	$('#pay', parent.document).on('click', function(){
		if(confirm("주문 내용을 확인하셨습니까?")){
			$.getJSON(
				"<%=request.getContextPath()%>/payment/payProd.do",
				{"price" : sumPrice},
				function(res){
					if(res.flag1 == '성공' && res.flag2 == '성공'){
						alert('주문이 완료 되었습니다.');
						location.href="/ProjectDHA/prod/getAllProd.do";
					}
				}
			)
		}
		$.closeModal();
	});
	
	$.resize = function(){
		size = $('.sectionContainer').height() + 200;
		console.log(size);		
		$('#cart_section').css('height', size);
	}
	
	$.resize();
	
	$(window).resize(function(){$.resize()});
	
	
</script>

</html>