<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	List<MemberVO> memList = (List<MemberVO>)request.getAttribute("memList");
%>
<script src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/MainPage.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/중분류페이지공통스타일.css">
<style type="text/css">
table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    th {
        background-color: #808080;
        color: #fff;
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    td {
        background-color: #fff;
        color: #000;
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
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
    
    #serachItem {
    	text-align : center;
    }
    
    #memAttr, #searchText {
		height: 40px;
		padding: 5px;
		font-size: 16px;
		border: 1px solid #ccc;
		border-radius: 5px;
	}

	#searchText {
		flex: 1;
		margin: 0 10px;
	}
    #searchButton {
		height: 40px;
		padding: 0 15px;
		font-size: 16px;
		border: none;
		background-color: #007bff;
		color: #fff;
		border-radius: 5px;
		cursor: pointer;
	}
    #searchButton:hover {
		background-color: #0056b3;
	}
</style>
<script type="text/javascript">

	$(function(){
	    var path = '<%=request.getContextPath()%>';
	    
	    $('#memberTable').on('click', '.memberInfo', function() {
	        var mem_id = $(this).find('.memId').text();
	        location.href = path + '/memberSelectAdmin.do?mem_id=' + mem_id;
	    });
	    
		$.resize = function(){
			size = $('.table').height() + 200;
			console.log(size);		
			$('#section').css('height', size);
		}
		
		$.resize();
		
		$(window).resize(function(){$.resize()});
		
		//	회원
		$('#p1').click(function(){
			location.href="/ProjectDHA/memberListAdmin.do";
		})
		//	신고 이력
		$('#p2').click(function(){
			location.href="/ProjectDHA/memberBlackList.do";
		})
		//	블랙리스트
		$('#p3').click(function(){
			location.href="/ProjectDHA/blacklistMember.do";
		})
		
		$('#searchButton').on('click', function(){
			//	분류명
			variable = $(this).parents('#serachItem').find('#memAttr option:selected').val();
			
			//	검색 단어
			searchValue = $(this).parents('#serachItem').find('#searchText').val();
			
			urlCode  = "/ProjectDHA/memberSearchAdmin.do";
			urlCode += "?variable="+variable;
			urlCode += "&searchValue="+searchValue;
			location.href = urlCode;
		})
	})
</script>

</head>
<body>
	<%@ include file="../admin/view/AdminView.jsp" %>
	<div id="title">
		<h2>회원 관리 페이지</h2>
	</div>
	<div id="side">
		<p id="p1">회원 관리</p>
		<p id="p2">신고 이력</p>
		<p id="p3">블랙리스트 관리</p>
	</div>
	
	<div id="section">
		<h3 style="text-align: center;">회원 목록</h3>
		<div class="hr" style="margin-bottom: 50px;"></div>
		
		<table border="1" id="memberTable" class="table table-striped">
			<tr>
				<th>회원 ID</th>
				<th>회원명</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
			<%for(MemberVO memberVo : memList) {%>
				<tr class="memberInfo">
					<td class="memId"><%=memberVo.getMem_id() %></td>
					<td class="memName"><%= memberVo.getMem_name() %></td>
					<td class="memEmail"><%= memberVo.getMem_email() %></td>
					<td class="memTel"><%= memberVo.getMem_tel() %></td>
					<td class="memAdd"><%= memberVo.getMem_add1() %> <%= memberVo.getMem_add2() %></td>
				</tr>
			<%}%>
			
			<tr class="searchBar">
				<td colspan="5" id="serachItem">
					<select name="memAttr" id="memAttr">
						<option value="mem_id">아이디</option>
						<option value="mem_name">이름</option>
						<option value="mem_email">이메일</option>
					</select>
					<input type="text" placeholder="검색할 단어를 입력하세요." name="searchText" id="searchText">
					<input type="button" value="검색" name="searchButton" id="searchButton">
				</td>
			</tr>	
		</table>
		<br>
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