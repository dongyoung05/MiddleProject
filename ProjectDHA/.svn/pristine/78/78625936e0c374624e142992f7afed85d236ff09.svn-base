<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.DogVO"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DHA Main Page</title>


<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>


<style type="text/css">
  
.dogProfile{
    width: 450px;
    margin:0 auto;
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
.button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #422700;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    

</style>
<%@ include file="/view/MypageView.jsp" %>

<script type="text/javascript">
$(function(){
	$('.dogImg').click(function(){
	    // 클릭된 이미지 요소에서 개 번호(.dogId) 텍스트 가져오기
        var dogId = $(this).attr('idx');
        // JavaScript 변수를 사용하여 멤버 아이디 가져오기
        var memId = "<%= memberVo.getMem_id() %>";
        // 개 번호와 멤버 아이디를 사용하여 URL 생성
		var url = '<%= request.getContextPath() %>/selectDog.do?mem_id=' + memId + '&dog_no=' + dogId;
        // URL로 페이지 이동
        location.href = url;
	})
	
	$.resize();
	$(window).resize(function(){$.resize()});
})


$.resize = function(){
	size = $('.dogProfile').height() * $('.dogProfile').length + 400;
	console.log(size);
	$('#section').css('height', size);
}
</script>
<body >
	<div id=section style="text-align: center;">
		<h3>반려견 프로필</h3>
		<div class="hr" style="margin-bottom: 50px;"></div>
    <%
		for(DogVO dogVo1 : dlist) {
							
			if(dogVo1 != null) {
								
	%>
				<!-- Project Card 1-->
			
			    <div class="dogProfile" >
					
					<img idx="<%=dogVo1.getDog_no() %>" class="dogImg" src="<%=request.getContextPath() %>/images/dog/<%=dogVo1.getDog_img() %>" alt="..." />
					<div class="dogInfo">
						<h4> <%=dogVo1.getDog_name() %></h4>
						<h4 class="dogId"><%=dogVo1.getDog_no() %></h4>
						<h4><%=dogVo1.getDog_birth() %></h4>
						<h4><%=dogVo1.getDog_breed() %></h4>
						<h4 class="weight"><%=dogVo1.getDog_weight() %></h4>
					</div>	
				</div>
			    
			                            <!-- 반복문 여기까지 -->
	<%			
			} 
		}
	%>	
		<input type="button" id="insertDog" value="반려견 등록" class="button">
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
