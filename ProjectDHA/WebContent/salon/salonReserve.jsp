<%@page import="kr.or.ddit.vo.DogVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salon Reserve</title>
<script src="../js/jquery-3.7.1.min.js"></script>

<style>
table{
	border-collapse: collapse;
	border: 2px solid black;
}

td{
	padding: 5px;
}
tr{
	text-align: center;
}

th{
	width: 400px;
	height: 80px;
}

.memSpan{
	display: inline-block; 
	width: 120px;
	text-align: center;
	margin-right: 100px; 
}

.restd{
	width: 100px;
	height: 30px;
}

.reserve:hover{
	color: blue;
}

.hr{
	border: 1px solid black;
	width: 300px;
	height: 0px;
	margin: 0 auto 50px auto;
}

#loginYes, #loginNo{
	width: 50%;
	text-align: center;
	margin: 0 auto;
}

#profileImg{
	width: 400px;
	height: 400px;
}

#MemInfo{
	text-align: left;
	margin-bottom: 100px;
}

#MemInfo h4{
	border-bottom: 1px solid black;
	padding: 5px;
}

#salonList{
	text-align: center;
}

#chooseDate{
	text-align: center;
}

#chooseDate table{
	margin: 0 auto;
}

.salon{
	border: 1px dotted black;
	border-radius: 25px;
	margin-bottom: 20px;
}

.salon:hover{
	border: 2px dotted red;
}

.dogProfile{
	display: flex;
	margin-bottom: 50px;
}

.dogImg{
	width: 180px;
	height: 180px;
	border-radius: 50%;
	margin-right: 50px;
}

.dogImg:hover{
	border: 2px solid red; 
}

.dogInfo{
	text-align: left;
}

.dogId{
	display: none;
}
</style>


<%
// 여기는 Session 객체로 로그인 정보 받아올 곳
// 로그인 정보가 있냐 없냐에 따라 명함에 버튼, 프로필, 인삿말 변경되야함

String imgPath = request.getContextPath() + "/images";

MemberVO memberVo = (MemberVO)session.getAttribute("loginok");

List<DogVO> myDogList = (List<DogVO>)session.getAttribute("myDogList");



%>


<script>

$(function(){
	
	$.resize();
	
	// 오늘 이전으로는 선택 안됨
	var today = new Date();
	$('input[type=date]').attr('min', today.toISOString().substr(0, 10));
	
	weight = "";
	dogId = "";
	dogName = "";
	salonNo = "";
	salonType = "";
	price = "";
	
	fullTime = "";
	time = "";
	date = "";
	
	reserveNo = "";

	
	$('#chkdate').on('change', function(){
		$.chkReserve();
	})
	
	$('.dogProfile').on('click', function(){
		$('.dogImg').css('border', 'none');
		$(this).find('.dogImg').css('border', '5px solid red');
		weight = $(this).find('.weight').text();
		dogId = $(this).find('.dogId').text();
		dogName = $(this).find('.dogName').text();
		salonNo = "";
		console.log(weight + "," + dogId);
		
		$.chkSalon();
		$.chkReserve();
	})
	
	// 미용 종류 띄우기
	$.chkSalon = function(){
		
		$.getJSON(
			"<%= request.getContextPath()%>/reserve/checkSalon.do",
			{'weight' : weight},
			function(res){
				
				console.log(res);
				$('#salonList').find('.hr').next().children().remove();
				
				$.each(res, function(i, v){
					let code = "<div class='salon'>"
							+ "<p class='sno' style='display: none;'>" + v.salon_no +"</p>"
							+ "<p class='stype'>" + v.salon_name +"</p>"
							+ "<p class='sprice'>" + v.salon_price +" 원</p>"
							+ "<p>설명: " + v.salon_desc +"</p></div>";
					$('#salonList').find('.hr').next().append(code);
				})
				
				$.resize();
			}
		)
	}
	
	
	// 예약 가능한 시간 table에 띄우기
	$.chkReserve = function(){
		date = $('#chkdate').val();
		
		if(date != "" && weight != ""){
			// 테이블 날짜 변경
			$('#datetime').text(date);
			
			$.getJSON(
				"<%= request.getContextPath()%>/reserve/checkReserve.do",
				{'date' : date, 'weight' : weight},
				function(res){
					
					td = $('.restd').get();
					
					$.each(res, function(i, v){
						let code = "";
						if(v == "예약불가능") {
							$(td[i]).css('color', 'red');
							code += v;
						} else{
							$(td[i]).css('color', 'black');
							code += "<span class='reserve'>" + v + "</span>";
						}
						$(td[i]).html(code);
					})
					
					$.resize();
				}
			)
		}
	}
	
	// 예약 가능 span태그 reserve클래스 태그 클릭 했을 때 예약하기
	$(document).on('click', '.reserve', function(){
		
		fullTime = $(this).parent().prev().text();
		time = $(this).parent().prev().text().substr(0, 5);
		console.log(date + "," + time + "," + weight + "," + salonNo);
		
		if(date != "" && weight != "" && salonNo != ""){
			$.getJSON(
				"<%= request.getContextPath()%>/reserve/salonReserve.do",
				{	
					'memId' : '<%= memberVo.getMem_id()%>',
					'dogId' : dogId,
					'date' : date, 
					'time' : time, 
					'weight' : weight,
					'salonNo' : salonNo
				},
				function(res){
					
					reserveNo = res.no;
					
					if(res.flag == '성공'){
						$('#mmemName', parent.document).text('<%= memberVo.getMem_name()%>');
						$('#mmemId', parent.document).text('<%= memberVo.getMem_id()%>');
						$('#mmemMail', parent.document).text('<%= memberVo.getMem_email()%>');
						$('#mdogName', parent.document).text(dogName);
						$('#mweight', parent.document).text(weight);
						$('#mdate', parent.document).text(date);
						$('#mtime', parent.document).text(fullTime);
						$('#mtype', parent.document).text(salonType);
						$('#mprice', parent.document).text(price);
						$.showModal();
					} 
					$.chkReserve();
				}
			)
		} else if(date == ""){
			alert('날짜를 선택해주세요.');
		} else if(weight == ""){
			alert('반려견을 선택해주세요.');
		} else {
			alert('미용 옵션을 선택해주세요.');
		}
		
		$.chkReserve();
	})
	
	// 미용 종류 선택
	$(document).on('click', '.salon', function(){
		
		$('.salon').css('border', '1px dotted black');
		$(this).css('border', '3px dotted red');
		
		salonNo = $(this).find('.sno').text();
		salonType = $(this).find('.stype').text();
		price = $(this).find('.sprice').text();
		console.log(salonNo + "," + salonType + "," + price);
	})
	
	
	
	$('body', parent.document).css('margin', '0');
	
	// 예약 내역 확인 Modal창 띄우기
	$.showModal = function(){
		console.log('show');
		$('.modal_container', parent.document).fadeIn(200);
	}
	
	$.closeModal = function(){
		console.log('close');
		$('.modal_container', parent.document).fadeOut(200);
	}
	
	$('#cancel', parent.document).on('click', function(){
		
		$.getJSON(
				"<%=request.getContextPath()%>/reserve/cancelReserve.do",
				{'reserveNo' : reserveNo},
				function(res){
					if(res.flag = '성공'){
						alert('예약이 취소 되었습니다.');
					}
				}
			)
		
		$.closeModal();
	})
	
	$('#pay', parent.document).on('click', function(){
		
		$.getJSON(
			"<%=request.getContextPath()%>/payment/payReserve.do",
			{'reserveNo' : reserveNo, 'price' : price.substr(0, price.length - 2)},
			function(res){
				if(res.flag1 == '성공' && res.flag2 == '성공'){
					alert('결제가 완료되었습니다.');
				}
			}
		)
		
		$.closeModal();
	})
	
	$(window).resize(function(){$.resize()});
})

$.resize = function(){
	size = $('body').height() + 200;
	console.log(size);
	$('#section', parent.document).css('height', size);
}
</script>


</head>
<body>

<!-- 
	로그인 하면 예약시 필요한 요소와 함께 프로필 등장
	로그인 안했을 시는 로그인 필요하다는 말과 로그인 페이지로 이동하는 버튼 출력
 -->
<%
if(memberVo != null){
%>
<div id="loginYes">
	
	<h3>예약자 프로필</h3>
	<div class="hr" style="margin-bottom: 50px;"></div>
	
	<img id="profileImg" src="<%= imgPath %>/member/<%=memberVo.getMem_img() %>" alt="<%=memberVo.getMem_img() %>">
	
	<div id="MemInfo">
		
		<h4><span class="memSpan">이름</span> <%= memberVo.getMem_name() %></h4>
		<h4><span class="memSpan">ID</span> <%= memberVo.getMem_id() %></h4>
		<h4><span class="memSpan">EMAIL</span> <%= memberVo.getMem_email() %></h4>
	
	</div>
	
	<h3>반려견 프로필</h3>
	<div class="hr" style="margin-bottom: 50px;"></div>
	
	<%
	if(myDogList == null){
	%>
		<h3>마이페이지에서 반려견을 등록해주세요.</h3>
	<%	
	} else{
	%>
		<h3>미용할 반려견을 선택해주세요.</h3>
		<%
		for(int i=0;i<myDogList.size();i++){
			DogVO dog = myDogList.get(i);
		%>
		<div class="dogProfile">
			<img class="dogImg" id="dogImg<%=i+1%> %>" src="<%= imgPath %>/dog/<%=dog.getDog_img() %>" 
				alt="<%=dog.getDog_img() %>">
			<div class="dogInfo">
				<h4 class="dogName"><%=dog.getDog_name() %></h4>
				<h4 class="dogId"><%=dog.getDog_no() %></h4>
				<h4><%=dog.getDog_birth() %></h4>
				<h4><%=dog.getDog_breed() %></h4>
				<h4 class="weight"><%=dog.getDog_weight() %></h4>
			</div>	
		</div>
		<% 	
		}
		%>
	<%
	}
	%>
</div>
<%
} else{
%>
<div id="loginNo">
	<h3>로그인이 필요한 기능입니다.</h3>
	<div class="hr" style="margin-bottom: 50px;"></div>
</div>	
<%	
}
%>



<div id="salonList">
	
	<h3>미용 선택</h3>
	<div class="hr" style="margin-bottom: 50px;"></div>
	<div></div>
</div>



<div id="chooseDate">
	<h3>날짜 선택</h3>
	<div class="hr" style="margin-bottom: 50px;"></div>
	
	<form action="#" method="post">
		
		<input type="date" name="date" id="chkdate">

		<table border="1">
			<tr>
				<th colspan="3" id="datetime">날짜를 선택하세요.</th>
			</tr>
			
			<tr><td>10:00 - 10:59</td><td class="restd"></td><tr>
			<tr><td>11:00 - 11:59</td><td class="restd"></td><tr>
			<tr><td>12:00 - 12:59</td><td class="restd"></td><tr>
			<tr><td>13:00 - 13:59</td><td class="restd"></td><tr>
			<tr><td>14:00 - 14:59</td><td class="restd"></td><tr>
			<tr><td>15:00 - 15:59</td><td class="restd"></td><tr>
			<tr><td>16:00 - 16:59</td><td class="restd"></td><tr>
			<tr><td>17:00 - 17:59</td><td class="restd"></td><tr>
			
		</table>
	</form>
</div>






</body>
</html>