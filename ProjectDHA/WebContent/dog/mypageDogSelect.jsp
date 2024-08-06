<%@page import="kr.or.ddit.vo.DogVO"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%
	DogVO dogVo = (DogVO)request.getAttribute("dogvo");
%>
<title>Insert title here</title>


<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>

<style>

 #ff {
        max-width: 400px;
        margin: 100px auto; /* 화면 중앙 정렬 */
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
   
   
    label {
	display: inline-block;
	font-size: 1.5rem;
	padding: 5px;	
	flex: left;
	}
	.dogImg{
		width: 180px;
		height: 180px;
		border-radius: 50%;
		margin-right: 50px;
	}
	.dogProfile{
	    width: 450px;
	    margin:0 auto;
		display: flex;
		margin-bottom: 50px;
		
	}
	.button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #422700;
        color: white;
        text-decoration: none;
        border-radius: 5px;
       
    }

    .button:hover {
        background-color: #45a049;
    }

</style>

<%@ include file="/view/MypageView.jsp" %>
<script>
	$(function(){
		$('#updateBtn').click(function(){
			dog_name = "<%=dogVo.getDog_name() %>";
			dog_breed = "<%=dogVo.getDog_breed() %>";
	        location.href = `<%= request.getContextPath() %>/dog/dogUpdate.jsp?dog_no=<%=dogVo.getDog_no()%>&mem_id=<%=memberVo.getMem_id()%>&dog_name=${dog_name}&dog_breed=${dog_breed}`;
		});
		
		$('#deleteBtn').click(function(){
			if(confirm('정말 삭제하시겠습니까?')){
				
				location.href="<%=request.getContextPath()%>/dogDelete.do?mem_id=<%=memberVo.getMem_id() %>&dog_no=<%=dogVo.getDog_no() %>";
				
			} else {
				alert('삭제를 취소하셨습니다.');
			}
		})
	});
</script>
<body>

	
		<h1 style="text-align: center;">반려견 상세정보</h1>
		<div class="hr" style="margin-bottom: 50px;"></div>
		
		<div class="dogProfile">
			<img class="dogImg" src="<%=request.getContextPath()%>/images/dog/<%=dogVo.getDog_img() %>">
			
			<div class="dogInfo">
				<label><%=dogVo.getDog_name() %></label> <br>
				<label><%=dogVo.getDog_gender() %></label> <br>
				<label><%=dogVo.getDog_breed() %></label> <br>
				<label><%=dogVo.getDog_weight() %></label> <br>
				<label><%=dogVo.getDog_birth() %></label> 
			</div>
		</div>
		<div style="text-align: center;" id="">
			<input type="button" class="button" value="반려견 정보 수정" id="updateBtn">
		</div>
		<div style="text-align: center;" id="">
			<input type="button" class="button" value="반려견 정보 삭제" id="deleteBtn">
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