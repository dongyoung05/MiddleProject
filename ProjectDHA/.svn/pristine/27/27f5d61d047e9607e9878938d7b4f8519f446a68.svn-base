<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Common Prod</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="../js/공통스크립트.js"></script>
<link rel="stylesheet" href="../css/MainPage.css">
<link rel="stylesheet" href="../css/ProdPage.css">
<%
	String p = "";
	p = request.getParameter("p");
%>
<script>
	$(function(){
		
		// 소분류 페이지 선택 이동 효과
		if('<%= p %>' == 'p2'){
			$('#title h2').text($('#p2').text());
			$('#section').css('height', '800px');
			$('#ifr').attr('src', "./hotelIntro_organization.html");
		} else if('<%= p %>' == 'p3'){
			$('#title h2').text($('#p3').text());
			$('iframe').css('height', '100%');
			$('#ifr').attr('src', "./hotelIntro_comeway.html");
		}
		
		// 옆에 소분류 페이지 클릭시 해당 페이지를 iframe으로 출력 + 중분류 제목(section) 바꾸기
		$('#side p').on('click', function(){
			
			$('#title h2').text($(this).text());
			
			// p태그 id 가져와서 소분류 페이지를 iframe안에 띄움
			if($(this).attr('id') == 'p1') {
				$('#section').css('height', '3200px');
				$('#ifr').attr('src', "./hotelIntro_intro.html");
			} else if($(this).attr('id') == 'p2'){
				$('#section').css('height', '800px');
				$('#ifr').attr('src', "./hotelIntro_organization.html");
			} else if($(this).attr('id') == 'p3'){
				$('iframe').css('height', '100%');
				$('#ifr').attr('src', "./hotelIntro_comeway.html");
			}
		})
		
		//	애견상품 분류 클릭시 이동
		$('.ctgryBar').on('click', function(){
			prodCtgryId = $(this).attr('tagId');
			location.href = `<%= request.getContextPath()%>/prod/getCtrgyProd.do?prodCtgryId=${prodCtgryId}`;
		})
		
		//	임시로 제작함 = 애견상품 클릭시 전체 출력
		$('#ctgryTitle').on('click', function(){
			location.href="<%= request.getContextPath()%>/prod/getAllProd.do";
		})
		
		//	검색 조건 적용 후 목록 출력하기
		$('#searchButton').on('click', function(){
			ctgryPath = $(this).parents('#searchTable').find('input[name="ctgryId"]:checked').val();
			weightPath = $(this).parents('#searchTable').find('input[name="weight"]:checked').val();
			variablePath = $(this).parents('#searchTable').find('input[name="variable"]:checked').val();
			searchValue = $(this).parents('#searchTable').find('#searchText').val();
			url  = "<%= request.getContextPath()%>/prod/getAllProd.do";
			url += "?searchValue=" + searchValue;
			url += "&weight=" + weightPath;
			url += "&variable=" + variablePath;
			url += "&ctgryId=" + ctgryPath;
			location.href = url;
		})
		
	})		//	$(function()) 종료
	
</script>
</head>
<body>
		<div id="side">
			<div id="ctgryTab">
				<h3 id="ctgryTitle">상품 카테고리</h3>
				<div style="display: flex;">
					<p class="ctgryBar" tagId="A001">사료</p>
					<p class="ctgryBar" tagId="A002">간식</p>
				</div>
				<div style="display: flex; justify-content: space-between;">
					<p class="ctgryBar" tagId="B001">의류</p>
					<p class="ctgryBar" tagId="B002">악세사리</p>
				</div>
				<div style="display: flex; justify-content: space-between;">
					<p class="ctgryBar" tagId="C001">위생용품</p>
					<p class="ctgryBar" tagId="C002">배변용품</p>
				</div>
				<div style="display: flex; justify-content: space-between;">
					<p class="ctgryBar" tagId="C003">목욕용품</p>
					<p class="ctgryBar" tagId="D001">산책용품</p>
				</div>
				<div style="display: flex; justify-content: space-between;">
					<p class="ctgryBar" tagId="D002">훈련용품</p>
					<p class="ctgryBar" tagId="D003">장난감</p>
				</div>

			</div>
			
			<div id="searchBar">
				<div id="searchBox">
					<div id="clickCtgry">
						<table id="searchTable">
							<tr class="checkedBox">
								<td class="columnName"><span style="font-size: 1.1rem; font-weight: bold;">상품 분류</span></td>
								<td class="radioBtn">
									<label><input type="radio" name="ctgryId" value="" checked />제한 없음</label>
									<label><input type="radio" name="ctgryId" value="A001" />사료</label>
									<label><input type="radio" name="ctgryId" value="A002" />간식</label>
									<label><input type="radio" name="ctgryId" value="B001" />의류</label>
									<label><input type="radio" name="ctgryId" value="B002" />악세사리</label>
									<label><input type="radio" name="ctgryId" value="C001" />위생용품</label>
									<br>
									<label><input type="radio" name="ctgryId" value="C002" />배변용품</label>
									<label><input type="radio" name="ctgryId" value="C003" />목욕용품</label>
									<label><input type="radio" name="ctgryId" value="D001" />산책용품</label>
									<label><input type="radio" name="ctgryId" value="D002" />훈련용품</label>
									<label><input type="radio" name="ctgryId" value="D003" />장난감</label>
								</td>
							</tr>
							<tr><td colspan="2"><div class="hr"></div></td>
							
							<tr class="checkedBox">
								<td class="columnName"><span style="font-size: 1.1rem; font-weight: bold;">체급 분류</span></td>
								<td class="radioBtn">
									<label><input type="radio" name="weight" value="" checked />제한 없음</label>
									<label><input type="radio" name="weight" value="소형" />소형(10kg 미만)</label>
									<label><input type="radio" name="weight" value="중형" />중형(10 ~ 25kg)</label>
									<label><input type="radio" name="weight" value="대형" />대형(25kg 이상)</label>
								</td>
							</tr>
							<tr><td colspan="2"><div class="hr"></div></td>
							
							<tr class="checkedBox">
								<td class="columnName"><span style="font-size: 1.1rem; font-weight: bold;">검색 분류</span></td>
								<td class="radioBtn">
									<label><input type="radio" name="variable" value="descTime" checked>최신순</label>
									<label><input type="radio" name="variable" value="desc" />높은가격</label>
									<label><input type="radio" name="variable" value="asc" >낮은가격</label>
									<label><input type="radio" name="variable" value="review" >리뷰많은순</label>
								</td>
							</tr>
							<tr><td colspan="2"><div class="hr"></div></td>
							
							<tr>
								<td colspan="2">
									<input type="text" placeholder="검색할 단어를 입력하세요." name="searchText" id="searchText">
									<input type="button" value="검색조건 적용" name="searchButton" id="searchButton">
								</td>
							</tr>							
						</table>
					</div>
				</div>
			</div>
		</div>
		
</body>
</html>