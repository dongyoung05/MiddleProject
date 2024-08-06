<%@page import="kr.or.ddit.vo.AdminVO"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminPage</title>

<script src="../js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="../css/MainPage.css">
</head>

<body>
<%@ include file="../admin/view/AdminView.jsp" %>
	<div class="containers">
		<div class="container" id="mainImg">
			<img class="slideImg" style="position: relative; display: inline-block;" src="<%= imgPath %>/main/update main00.png" alt="update main00.png">
			<img class="slideImg" style="position: relative;" src="<%= imgPath %>/main/MAIN0.png" alt="MAIN0.png">
			<img class="slideImg" style="position: relative;" src="<%= imgPath %>/main/002.png" alt="002.png">
			<img class="slideImg" style="position: relative;" src="<%= imgPath %>/main/003.png" alt="003.png">
			
	  		<button class="slideBtn" id="right"><p>&#10095;</p></button>
			<button class="slideBtn" id="left"><p>&#10094;</p></button>
		</div>
		
		<h1>DHA HOTEL</h1>
		<div class="hr"></div>
		<div class="container">
			<img src="<%= imgPath %>/main/스크린샷(152).png" alt="스크린샷(152).png">
			<img src="<%= imgPath %>/main/스크린샷(153).png" alt="스크린샷(153).png">
			<img src="<%= imgPath %>/main/스크린샷(154).png" alt="스크린샷(154).png">
		</div>
	
		<h1>Beauty & Bath</h1>
		<div class="hr"></div>
		<div class="container">
			<img src="<%= imgPath %>/main/스크린샷(155).png" alt="스크린샷(155).png">
			<img src="<%= imgPath %>/main/스크린샷(156).png" alt="스크린샷(156).png">
			<img src="<%= imgPath %>/main/스크린샷(157).png" alt="스크린샷(157).png">
		</div>
	
		<h1>Best Product Top3</h1>
		<div class="hr"></div>
		<div class="container">
			<img src="<%= imgPath %>/main/3163ab20-ab8d-4259-a212-e2219ed61df1_피너츠 강아지 장난감.png" alt="3163ab20-ab8d-4259-a212-e2219ed61df1_피너츠 강아지 장난감.png">
			<img src="<%= imgPath %>/main/4972fd0c-c21f-4bba-b3e4-0ad6dcef913c_LEd발톱깎기.png" alt="4972fd0c-c21f-4bba-b3e4-0ad6dcef913c_LEd발톱깎기.png">
			<img src="<%= imgPath %>/main/d7305c44-32ff-4d1a-a484-b6011629137e_로얄캐닌_엑스스몰 퍼피.png" alt="d7305c44-32ff-4d1a-a484-b6011629137e_로얄캐닌_엑스스몰 퍼피.png">
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
