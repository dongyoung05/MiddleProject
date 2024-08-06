<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.DogVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/view/MypageView.jsp" %>
<%
	
String dog_name = request.getParameter("dog_name");
String dog_breed = request.getParameter("dog_breed");
int dog_no = Integer.parseInt(request.getParameter("dog_no"));

	

%>

<style>
  body {
        font-family: Arial, sans-serif;
        background-color: ;
        margin: 0;
        padding: 0;
    }

    #ff {
        max-width: 400px;
        margin: 100px auto; /* 화면 중앙 정렬 */
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    #ff input[type="text"],
    #ff input[type="email"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    #ff input[type="date"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    
    #ff select {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    #ff input[type="button"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #422700;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #ff input[type="button"]:hover {
        background-color: #45a049;
    }
     #ff input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #422700;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #ff input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<div id="sec">
	<form id="ff" action="/ProjectDHA/dogUpdate.do?&dog_no=<%=dog_no %>&mem_id=<%=memberVo.getMem_id() %>" method="post" enctype="multipart/form-data"  >
		<h1 style="text-align: center;">반려견 정보 변경</h1>
		<label></label><input type="text" placeholder="반려견 이름을 입력하세요" name="dog_name" value="<%=dog_name%>"><br>
		<label></label><input type="text" placeholder="반려견 종을 입력하세요" name="dog_breed" value="<%=dog_breed%>"><br>
		<label>성별</label> <select name = "dog_gender">
							    <option>남</option>
							    <option>여</option>
		  				   </select><br>

		<label>생일</label> <input type="date"  name="dog_birth"><br>
		<label>체급</label> <select name = "dog_weight">
									<option>소형</option>
							    	<option>중형</option>
							    	<option>대형</option>
		                  </select><br><br>
		
		<label>이미지</label><input type="file" name="dog_img"><br>
		<br>
		<input type='submit' value='수정'>
		
	
	</form>
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