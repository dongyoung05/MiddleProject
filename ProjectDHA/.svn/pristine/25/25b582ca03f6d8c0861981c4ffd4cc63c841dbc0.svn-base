<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	width: 1200px;
}

table{
	border-collapse: collapse;
	border: 2px solid black;
}

td{
	padding: 5px;
}
</style>
<script>
$(function(){
	
	$.getMyReview();
	
	
	
	$(window).resize(function(){$.resize()});
	
})

$.resize = function(){
	size = $('#review').height() + 200;
	console.log(size);
	$('#section').css('height', size);
}

$.getMyReview = function(){
	$.getJSON(
		"<%=request.getContextPath()%>/mypageReview.do",
		{	
			'memId' : '<%= memberVo.getMem_id()%>'
		},
		function(res){
			console.log("review list");
			
			let code = "<table border='1'>";
							
				code += "<tr><th class='no'>리뷰번호</th>" + 
				"<th>제목</th><th>내용</th><th>날짜</th>" + 
				"<th style='width:40px;'>별점</th></tr>";

				$.each(res, function(i, v){
					var date = new Date(v.date); // 날짜 문자열을 Date 객체로 변환
					var year = date.getFullYear().toString().substr(2, 2); // 연도에서 뒤의 두 자리만 가져옴
					var month = ('0' + (date.getMonth() + 1)).slice(-2); // 월을 가져오고, 한 자릿수일 경우 앞에 0을 추가
					var day = ('0' + date.getDate()).slice(-2); // 일을 가져오고, 한 자릿수일 경우 앞에 0을 추가
					var formattedDate = year + '/' + month + '/' + day; // yy/mm/dd 형식으로 날짜를 조합
					
					code += "<tr class='tr' id='tr"+i+"'><td>"+ v.no +"</td>"+
					"<td>"+v.title+"</td>"+
					"<td>"+v.content+"</td><td>"+formattedDate+"</td>"+
					"<td>"+v.star+"</td>"+
					"</tr>";
				})

				code += "</table>";
				$('#reviewList').html(code);
				
				
		
			$.resize();
		}
	)
}

</script>

<body>

<div id="section">
	
	
	
	<div id="review" class="listBox">
		<h3>나의 리뷰</h3>
		<div class="hr" style="margin-bottom: 50px;"></div>
		
		<div id="reviewList"></div>
		
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