<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/Modal창.css">
</head>
<%@ include file="/view/MypageView.jsp" %>

<style>
.hr{
	border: 1px solid black;
	width: 300px;
	height: 0px;
	margin: 0 auto 50px auto;
}

h3{
	text-align: center;
}

.listBox{
	margin-top: 50px;
}

.listBox table{
	margin: 0 auto;
	width: 1000px;
}

table{
	border-collapse: collapse;
	border: 2px solid black;
}

td{
	padding: 5px;
}
	.review_score {
		width : 100%; 
		box-sizing : border-box; 
		display : inline-flex; 
		float : left;
		flex-direction : row; 
		justify-content : flex-start;
	}
	
	.review_score .star {
		width : 25px; 
		height : 25px; 
		margin-right : 10px;
		display : inline-block; 
		background : url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FE2bww%2FbtsviSSBz4Q%2F5UYnwSWgTlFt6CEFZ1L3Q0%2Fimg.png') no-repeat;
		background-size : 100%; 
		box-sizing : border-box; 
	}
	
	.review_score .star.on {
		width : 25px; 
		height : 25px;
		margin-right : 10px;
		display : inline-block; 
		background : url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb2d6gV%2FbtsvbDoal87%2FXH5b17uLeEJcBP3RV3FyDk%2Fimg.png') no-repeat; 
		background-size : 100%; 
		box-sizing : border-box; 
	}
	.star_box {
		width : 400px;
		box-sizing : border-box;
		display : inline-block;
		margin : 15px 0;
		background : #F3F4F8;
		border : 0;
		border-radius : 10px;
		height : 100px;
		resize : none;
		padding : 15px;
		font-size : 13px;
		font-family : sans-serif;
	}
	.btn02 {
		display : block;
		width : 400px;
		font-weight : bold;
		border : 0;
		border-radius : 10px;
		max-height : 50px;
		padding : 15px 0;
		font-size : 1.1em;
		text-align : center;
		background : bisque;
	}
</style>

<script>
$(function(){
	
	$.getMyPayment('prod');
	
	$('select[name=type]').on('change', function(){
		$.getMyPayment($(this).val());
	})
	
	$(window).resize(function(){$.resize()});
	
})

$.resize = function(){
	size = $('#payment').height() + 200;
	console.log(size);
	$('#section').css('height', size);
}

$.getMyPayment = function(type){
	$.getJSON(
		"<%=request.getContextPath()%>/payment/myProdPayment.do",
		{	
			'memId' : '<%= memberVo.getMem_id()%>', 
			'type' : type
		},
		function(res){
			console.log("pay success");
			
			let code = "<table border='1'>";
			
			if(res.type == 'prod'){
				
				code += "<tr><th class='no'>주문번호</th>" + 
				"<th>상품이름</th><th>가격</th><th>수량</th>" + 
				"<th>금액 총합</th><th>날짜</th><th></th></tr>";

				$.each(res.list, function(i, v){
					code += "<tr class='tr' id='tr" + i + "'><td>"+ v.orderNo +"</td>"+
					"<td>"+v.prodName+"</td>"+
					"<td>"+v.prodPrice+"</td><td>"+v.qty+"</td>"+
					"<td>"+v.price+"</td><td>"+v.date.substr(0, 16)+"</td>"+
					"<td><button class='review'>리뷰</button></td></tr>";
				})

				code += "</table>";
				$('#paytb').html(code);
				$.makeSimple();
				
			} else{
				code += "<tr><th class='no'>주문번호</th>" + 
				"<th>서비스</th><th>반려견</th><th>IN/OUT</th>" + 
				"<th>가격</th><th>날짜</th></tr>";
				
				$.each(res.list, function(i, v){
					console.log(v.orderNo);
					code += "<tr class='tr' id='tr"+i+"'><td>"+ v.orderNo +"</td>"+
					"<td>"+v.service+"</td><td>"+v.dog+"</td>"+
					"<td>"+v.sin.substr(0, 16)+" - " + v.sout.substr(0, 16)+"</td>"+
					"<td>"+v.price+"</td><td>"+v.date+"</td></tr>";
				})

				code += "</table>";
				$('#paytb').html(code);
			}
			$.resize();
		}
	)
}

$.makeSimple = function(){
	
	for(let i=1;i<$('.tr').length;i++){
		temp = $('#tr'+(i-1)).find('td:eq(0)').text();
		
		let row = 1;
		for(let j=i;j<$('tr').length;j++){
			
			if(temp == $('#tr'+j).find('td:eq(0)').text()){
				row++;
				$('#tr'+j).find('td:eq(6)').remove();
				$('#tr'+j).find('td:eq(5)').remove();
				$('#tr'+j).find('td:eq(4)').remove();
				$('#tr'+j).find('td:eq(0)').remove();
			} else {
				$('#tr'+(i-1)).find('td:eq(0)').attr('rowspan', row);
				$('#tr'+(i-1)).find('td:eq(4)').attr('rowspan', row);
				$('#tr'+(i-1)).find('td:eq(5)').attr('rowspan', row);
				$('#tr'+(i-1)).find('td:eq(6)').attr('rowspan', row);
				i += j - i;
				row = 1;
				break;
			}
		}
	}
}

</script>

<body>

<div id="section">
	
	<select name="type">
		<option value="prod">==== 상품 ====</option>
		<option value="service">==== 서비스 ====</option>
	</select>
	
	<div id="payment" class="listBox">
		<h3>결제 내역</h3>
		<div class="hr" style="margin-bottom: 50px;"></div>
		
		<div id="paytb"></div>
		
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

<!-- Modal 창 띄우기 -->
<div class="modal_container" style="margin: none;">
	<div class="modal">
		<form method="post" id="reviewModal" enctype="multipart/form-data">
			<div class="modal_header">
				<h3>리 뷰</h3>
			</div>
			<hr>
			<div class="modal_content">
				<div id="review_title">
					<span>리뷰 제목</span><br>
					<input type="text" name="board_title" id="board_title">
				</div>
				<hr>
				<span>별점</span>
				<div class ="review_score">
					<span class="star on" value="1"> </span>
					<span class="star" value="2"> </span>
					<span class="star" value="3"> </span>
					<span class="star" value="4"> </span>
					<span class="star" value="5"> </span>
				</div>
				<hr>
				<div id="content">
					<span>리뷰 내용</span>
					<textarea name="board_content" id="board_content" cols="50" rows="8" placeholder="리뷰 내용을 작성해주세요."></textarea>
				</div>
			</div>
			<hr>
			<div class="modal_footer">
				<button id="cancel">작성 취소</button>
				<button id="submitReview">작성 완료</button>
			</div>
		</form>
	</div>
</div>
<script>
	reserveNo = "";
	ctgryName = "";
	//	별점 작동하는 이벤트
	$('.review_score > .star').click(function(){
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
	})
	
	//	리뷰 작성 버튼을 눌렀을 때 작동하는 이벤트
	$(document).on('click', '.review', function(){
		orderNo = $(this).parents('tr').attr('id');
		console.log("reviewNo >>>>>> " + reserveNo);
		
		ctgryName = $(this).parents('#section').children('select').val();
		console.log("ctrgyName >>>>>> " + ctgryName);
		
		$.showModal();
	})
	
	$('#submitReview').on('click', function(){
		if(confirm("리뷰를 등록하시겠습니까?")){
			
			//	별점 가져오기
			var arrayLength = $(this).parents('.modal_container').find(".on");
			console.log("length >>>> " + arrayLength.length);
			reviewScore = arrayLength.length;
			console.log("reviewScore >>>> " + reviewScore);
			$(this).parents('.modal_container').find("#review_score").val(reviewScore);
			
			title = $(this).parents('.modal_container').find("#board_title").val();
			content = $(this).parents('.modal_container').find("#board_content").val();
			
			$.ajax({
				url : "<%= request.getContextPath() %>/board/reviewInsert.do",
				type : 'post',
				data : {"orderNo" : orderNo,
					    "ctgryName" : ctgryName,
					    "reviewScore" : reviewScore,
					    "title" : title,
					    "content" : content},
				success : function(result){
					alert("성공!");
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				}
			})
		}
	});		//	submitReview().on('click') 종료
	
	//	리뷰 작성 중 취소를 눌렀을 때 발동하는 이벤트
	$('#cancel', parent.document).on('click', function(){
		if(confirm("작성을 취소하시겠습니까?")){
			$.closeModal();
		}
	});
	
	//	Modal 창 여는 함수
	$.showModal = function(){
		console.log('show');
		$('.modal_container', parent.document).fadeIn(200);
	};

	//	Modal 창 닫는 함수
	$.closeModal = function(){
		console.log('close');
		$('.modal_container', parent.document).fadeOut(200);
	};
	
</script>
</body>
</html>