$.cartList = function(){
	$.ajax({
		url : `${mypath}/cart/getCartProd.do`,
		type : "post",
		dataType : "json",
		success : function(result){
			code  = `<div class="sectionContainer">
						<div class="cartHeader">
							장바구니
						</div>`;

			$.each(result, function(i, v){
				code += `<div class="cartProdContainer" id="${v.prod_no}">
							<div class="cartItem">
								<div class="cartProdThumbnail">
									<img class="cartProdImg" src="${prodImgPath}/${v.prod_img}" alt="${v.prod_img}">
								</div>
								<div class="cartProdScript">
									<div class="prodName"><p class="cartProdName" name="${v.prod_name}">${v.prod_name}</p></div>
									<div class="prodQty">
										<span class="qty-label">수량:</span>
										<div class="buttons">
											<input type="button" class="qty-button" value="-">
	                        				<span class="cartProdQty"></span>
	                        				<input type="button" class="qty-button" value="+">
										</div>
									</div>
									<div class="prodPrice" price="${v.prod_price}"><p class="cartProdPrice"></div>
								</div>
								<div class="cartActions">
									<input type="button" value="삭제" class="removeButton">
								</div>
							</div>
						</div>`;
			})		//	$.each() 종료
			
			//	총합 출력 할 div 생성
			code += `	<div id="printResult">
							<span id="resultSum"></span>
							<input type="button" id="checkout" value="결제하기">
						</div>`;
			
			//	.sectionContainer 닫기
			code += `</div>`;
			
			$('#cart_section').html(code);
			$.cartInfo();
		},
		error : function(xhr){
			if(xhr.status == 200){
				code = `<div class="noList">
							<img id="emptyImg" src="${prodImgPath}/error_dog.jpg">
							<span id="emptyText">장바구니에 상품이 없습니다.</span>
						</div>`;
				$('#cart_section').html(code);
			} else {
				alert("오류가 발생했습니다. 잠시 후 다시 실행해주세요.");
			}
		}
	});			//	장바구니에 품목 추가 종료
}	//	cartList() 종료

$.cartInfo = function(){
		
	$.ajax({
		url : `${mypath}/cart/getProdQty.do`,
		type : "post",
		dataType : 'json',
		success : function(result){
			//	값의 합을 구할 변수 선언
			sumPrice = 0;
			
			$.each(result, function(i, v){
				//	상품 번호 가져오기
				var prodId = "#" + v.prod_no;
				
				//	상품 가격 가져오기
				var prodPrice = $("#"+v.prod_no).children("div").eq(0).children("div").eq(1).children("div").eq(2).attr('price');
				//	수량 값 적용
				var prodPath = $(`${prodId} .cartProdQty`);
	            prodPath.text(v.prod_qty);
				
				//	가격 계산
				var qtyPrice = (prodPrice * parseInt(v.prod_qty));
				sumPrice += qtyPrice;
				qtyPrice = qtyPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				printPrice = qtyPrice + "원";
				
				//	가격 값 저장 및 가격 값 출력
				$("#"+v.prod_no).children("div").eq(0).children("div").eq(1).children("div").eq(2).children("p").html(printPrice);
			});
			//	가격 총합 출력
			sumPricePrint = "총 합계 : " + sumPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')  + "원";
			$('#resultSum').html(sumPricePrint);
			$('#resultSum').attr('price', sumPrice);
		},
		error : function(xhr){
			printErrorCode = `에러가 발생했습니다.`;
			$('#cartSection').html(printErrorCode);
		}
	})			//	장바구니에 상품 수량 및 가격 출력 완료
}	//	cartInfo() 종료

$.modifyProdCart = function(prodId, symbol){
	
	$.ajax({
		url : `${mypath}/cart/modifyProdCart.do`,
		type : "post",
		data : {
					prodId : prodId,
					symbol : symbol
				},
		dataType : 'json',
		success : function(result){
			if(result.flag=="성공"){
				$.cartList();
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

$.deleteProdCart = function(prodId){
	
	$.ajax({
		url : `${mypath}/cart/deleteProdCart.do`,
		type : 'post',
		data : { prodId : prodId },
		dataType : 'json',
		success : function(result){
			if(result.flag=="성공"){
				$.cartList();
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}