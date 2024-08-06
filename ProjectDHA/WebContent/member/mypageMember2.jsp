<%@page import="kr.or.ddit.vo.DogVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>

<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/MainPage.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/중분류페이지공통스타일.css">
<style type="text/css">

   

    .profile {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .profile h2 {
        font-size: 24px;
        margin-bottom: 20px;
    }

    .profile p {
        font-size: 16px;
        margin-bottom: 10px;
    }

    .button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #422700;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .button:hover {
        background-color: #45a049;
    }
    
    .memSpan {
    	
		display: inline-block;
		width: 200px;
		
	}
	.dogImg{
	width: 180px;
	height: 180px;
	border-radius: 50%;
	margin-right: 50px;
	}
	
	


</style>
<%@ include file="/view/MypageView.jsp" %>
<%
String birth = memberVo.getMem_bir().substring(0, 10);
%>

</head>

	<div class="profile" >
			<h3 style="text-align: center;">개인 프로필</h3>
			
			<div id="MemInfo" style="margin: 0 25%; padding: 0 30px; border: 1px solid black; border-radius: 10px;">
		
				<h4><span class="memSpan">이름</span> <%= memberVo.getMem_name() %></h4>
				<h4><span class="memSpan">ID</span> <%= memberVo.getMem_id() %></h4>
				<h4><span class="memSpan">EMAIL</span> <%= memberVo.getMem_email() %></h4>
				<h4><span class="memSpan">주소</span> <%= memberVo.getMem_add1() %> <%=memberVo.getMem_add2() %></h4>
				<h4><span class="memSpan">생년월일</span> <%= birth %></h4>
			
			</div>
			<br><BR>
			<div style="text-align: center;">
				<input class="button" type="button" value="회원정보수정" id="updateMember">
			</div>
			<br>
			<br><BR><BR>
			<h3 style="text-align: center;">반려견 목록</h3>
			<div class="hr" style="margin-bottom: 50px;"></div>
			<% 
				if(dlist == null){
			%>		
					<p>등록된 반려견이 없습니다..</p>	
			<%	
				}
			 %>
			
			<%
			for(DogVO dogvo : dlist){
			%>		
				<div style=" text-align: center;" >
					<img class="dogImg" src= "<%= request.getContextPath() %>/images/dog/<%=dogvo.getDog_img() %>" alt="<%=dogvo.getDog_img() %>" > 
				
				
					
						<%=dogvo.getDog_name() %>
					
				</div>
			<%		 
			}
			%> 
			<Br>
			<div style="text-align: center;" id="ff">				
				<input class="button" type="button" value="반려견등록" id="insertDog">
				
				
			</div>
			<Br>
	</div>
	
	
	
	
<!-- 
클래스 이름: footer - 메인 페이지 맨 밑에 들어갈 호텔 간략 소개나 간략 지도 
요소: 회사 이름, 찾아오는길 등 나중에 추가 예정
-->
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