<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
<%
	List<MemberVO> blackList = (List<MemberVO>)request.getAttribute("blackList");
%>
<script>
	$(function(){
		
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
		//	블랙리스트
		$('#p2').click(function(){
			location.href="/ProjectDHA/memberBlackList.do";
		})
		//	블랙리스트
		$('#p3').click(function(){
			location.href="/ProjectDHA/blacklistMember.do";
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
		<h3 style="text-align: center;">신고 이력</h3>

		<div class="hr" style="margin-bottom: 50px;"></div>

		<table border='1' class="table table-striped">
			<tr>
				<th>신고번호</th>
				<th>회원아이디</th>
				<th>회원명</th>
				<th>회원이메일</th>
				<th>신고사유</th>
				<th>신고날짜</th>
				<th>신고자아이디</th>
			</tr>
	
	<%
		for(int i=0; i<blackList.size(); i++) {
			String report = "";
			if(blackList.get(i).getReport_id() == null) {
							
				
				report = "신고자가 없습니다.";
			} else {
				report = blackList.get(i).getReport_id();
			}
	%>		
			<tr>
				
				<td><%=blackList.get(i).getReport_no() %></td>
				<td><%=blackList.get(i).getMem_id() %></td>
				<td><%=blackList.get(i).getMem_name() %></td>
				<td><%=blackList.get(i).getMem_email() %></td>
				<td><%=blackList.get(i).getList_reason() %></td>
				<td><%=blackList.get(i).getList_date() %></td>
				<td><%= report %></td>
			</tr>
		
	<%	
		}
	%>	
		
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