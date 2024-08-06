<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>	
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/MainPage.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/중분류페이지공통스타일.css">
<link rel="stylesheet" href="../css/Modal창.css">

<style>
#listBox table{
	margin: 0 auto;
	width: 800px;
	border-collapse : collapse;
	border: 2px solid black;
}
</style>

</head>

<script type="text/javascript">
$(function(){
	
	$('#p1').click(function(){
		location.href="/ProjectDHA/admin/service_room_admin.jsp";
	})
	$('#p2').click(function(){
		location.href="/ProjectDHA/admin/service_salon_admin.jsp";
	})
	
	$.getSalonList();
	
	$('#insert').on('click', function(){
		$.showModal();
	})
	
	$(document).on('click', '.update', function(){
		no = $(this).parents('.tr').find('.no').text();
		name = $(this).parents('.tr').find('td:eq(1)').text();
		desc = $(this).parents('.tr').find('td:eq(2)').text();
		weight = $(this).parents('.tr').find('td:eq(3)').text();
		price = $(this).parents('.tr').find('td:eq(4)').text();
		
		$('#NO2').text(no);
		$('#NAME2').val(name);
		$('#DESC2').val(desc);
		$('#PRICE2').val(price);
		$('#WEIGHT2').val(weight);
		console.log(no);
		$.showModal2();
	})
	
	$(document).on('click', '.delete', function(){
		no = $(this).parents('.tr').find('.no').text();
		console.log(no);
		if(confirm(no + ' 객실을 정말 삭제하시겠습니까?')){
			$.getJSON(
				"<%= request.getContextPath()%>/admin/deleteSalon.do",
				{"no": no },
				function(res){
					if(res.flag == '성공') alert('삭제 성공!');
					$.getSalonList();
				}
			)
		}
	})
	
	$.resize();
	$(window).resize(function(){$.resize();});
	
	$('body', parent.document).css('margin', '0');
	
	// 예약 내역 확인 Modal창 띄우기
	$.showModal = function(){
		console.log('show');
		$('#m1').fadeIn(200);
	}
	$.showModal2 = function(){
		console.log('show2');
		$('#m2').fadeIn(200);
	}
	
	$.closeModal = function(){
		console.log('close');
		$('#m1').fadeOut(200);
		$('#m2').fadeOut(200);
	}
	
	$('#ok').on('click', function(){
		
		no = $('#NO').val();
		name = $('#NAME').val();
		desc = $('#DESC').val();
		price = $('#PRICE').val();
		weight = $('#WEIGHT').val();
		
		$.getJSON(
			"<%= request.getContextPath()%>/admin/insertSalon.do",
			{
				"no":no,
				"name":name,
				"desc":desc,
				"weight":weight,
				"price":price
			},
			function(res){
				if(res.flag == '성공') alert('추가 성공!');
				$.getSalonList();
			}
		)
		
		$.closeModal();
	})
	$('#ok2').on('click', function(){
		
		name = $('#NAME2').val();
		desc = $('#DESC2').val();
		price = $('#PRICE2').val();
		weight = $('#WEIGHT2').val();
		
		$.getJSON(
			"<%= request.getContextPath()%>/admin/updateSalon.do",
			{
				"no":no,
				"name":name,
				"desc":desc,
				"weight":weight,
				"price":price
			},
			function(res){
				if(res.flag == '성공') alert('수정 성공!');
				$.getSalonList();
			}
		)
		
		$.closeModal();
	})
	
	$('#cancel').on('click', function(){
		$.closeModal();
	})
	$('#cancel2').on('click', function(){
		$.closeModal();
	})
})

$.resize = function(){
	size = $('#listBox').height() + 300;
	console.log(size);
	$('#section').css('height', size);
}

$.getSalonList = function(){
	
	$.getJSON(
		"<%= request.getContextPath()%>/admin/getSalonList.do",
		function(res){
			console.log('getSalonList suc');
			
			let code = "<table border='1'>";
			code += "<tr><th>번호</th><th>제목</th><th>설명</th>" +
					"<th>종류</th><th>가격</th><th colspan='2'>수정/삭제</th></tr>";
					
					
			$.each(res, function(i,v){
				
				code += "<tr class='tr'><td class='no'>"+v.no+"</td><td>"+v.name+"</td>"+
						"<td>"+v.desc+"</td><td>"+v.weight+"</td>" +
						"<td>"+v.price+"</td>" +
						"<td><button class='update'>수정</button></td>" +
						"<td><button class='delete'>삭제</button></td></tr>";	
			})
			
			code += "</table>";
			$('#listBox').html(code);
			$.resize();
		}	
	)
}

</script>

<body>


<%@ include file="../admin/view/AdminView.jsp" %>



<div id="title">
	<h2>서비스 관리</h2>
</div>
<div id="side">
	<p id="p1">객실 관리</p>
	<p id="p2">미용 관리</p>
</div>
	
<div id="section">
	<h3 id="nickName">미용 관리</h3>
	<div class="hr" style="margin-bottom: 50px;"></div>
	
	<button id="insert">미용추가</button>
	<div id="listBox"></div>
	
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






<div id="m1" class="modal_container" style="margin: none;">
	<div class="modal">
		<div class="modal_header">
			<h3>미용 추가</h3>
		</div>
		<hr>
		<div class="modal_content">
			<h3>미용 정보</h3>
			<p>
				<span class="modalSpan">NO</span>
				<span id="mmemName"><input type='text' id='NO'></span>
			</p>
			<p>
				<span class="modalSpan">NAME</span>
				<span id="mmemName"><input type='text' id='NAME'></span>
			</p>
			<p>
				<span class="modalSpan">DESC</span>
				<span id="mmemName"><input type='text' id='DESC'></span>
			</p>
			<p>
				<span class="modalSpan">WEIGHT</span>
				<span id="mmemName"><input type='text' id='WEIGHT'></span>
			</p>
			<p>
				<span class="modalSpan">PRICE</span>
				<span id="mmemName"><input type='number' id='PRICE'></span>
			</p>
		</div>
		<hr>
		<div class="modal_footer">
			<button id="cancel">취소</button>
			<button id="ok">확인</button>
		</div>
	</div>
</div>
		
<div id="m2" class="modal_container" style="margin: none;">
	<div class="modal">
		<div class="modal_header">
			<h3>미용 수정</h3>
		</div>
		<hr>
		<div class="modal_content">
			<h3>미용 정보</h3>
			<p>
				<span class="modalSpan">NO</span>
				<span id="mmemName"><span id="NO2"></span></span>
			</p>
			<p>
				<span class="modalSpan">NAME</span>
				<span id="mmemName"><input type='text' id='NAME2'></span>
			</p>
			<p>
				<span class="modalSpan">DESC</span>
				<span id="mmemName"><input type='text' id='DESC2'></span>
			</p>
			<p>
				<span class="modalSpan">WEIGHT</span>
				<span id="mmemName"><input type='text' id='WEIGHT2'></span>
			</p>
			<p>
				<span class="modalSpan">PRICE</span>
				<span id="mmemName"><input type='number' id='PRICE2'></span>
			</p>
		</div>
		<hr>
		<div class="modal_footer">
			<button id="cancel2">취소</button>
			<button id="ok2">확인</button>
		</div>
	</div>
</div>	
	
	
	
	
</body>
</html>