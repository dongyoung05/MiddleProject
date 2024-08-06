<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prod Admin</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>	
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/MainPage.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/중분류페이지공통스타일.css">
<script>
	$(function(){
		$.resize = function(){
			size = $('.table').height() + 200;
			console.log(size);
			$('#section').css('height', size);
		}
		$.resize();
		$(window).resize(function(){$.resize()});
		
		//	상품 등록 버튼
		$('#insertProd').on('click', function(){
			location.href = "<%= request.getContextPath() %>/prod/prodAdmin.jsp";
		})
		
		//	페이지 번호 클릭 이벤트
		$('.page').on('click', function(){
			pageNum = $(this).text();
			pageUrl = "<%= request.getContextPath() %>/pageProdAdmin.do";
			pageUrl += "?page=" + pageNum;
			location.href = pageUrl;
		})
		
		//	상품 클릭(상세보기 이벤트)
		$('.prodHead').on('click', function() {
	        prod_id = $(this).attr('id');
	        prodUrl  = "<%= request.getContextPath() %>/prodSelectAdmin.do";
	        prodUrl += "?prod_id=" + prod_id;
	        location.href =  prodUrl;
	    });
	})
</script>
<style>
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
	#pages {
		text-align : center;
	}
	#pages span{
		margin-right : 10px;
	}
	#pages span:hover {
		font-weight : bold;
	}
	
	.ctgry {
		width : 10%;
		text-align : center;
	}
	.prodNo {
		width : 20%;
		text-align : center;
	}
	.prodName {
		width : 25%;
	}
	.prodPrice {
		width : 15%;
		text-align : right;
	}
	.prodDate {
		width : 20%;
		text-align : center;
	}
	.dogWeight {
		width : 10%;
		text-align : center;
	}
	#prodHeader th {
		text-align : center;
	}
</style>
</head>
<%
List<ProdVO> prodList = (List<ProdVO>)request.getAttribute("prodList");
%>
<body>
<%@ include file="../admin/view/AdminView.jsp" %>
	<div id="title">
		<h2>상품 관리</h2>
	</div>
	<div id="section">
		<table border="1" class="table">
		<tr id="prodHeader">
			<th>상품분류</th>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>등록일자</th>
			<th>체급분류</th>
		</tr>	
		<%if(prodList != null){ %>
<%
			for(ProdVO prod : prodList) {
				int price = prod.getProd_price();
				DecimalFormat format = new DecimalFormat("###,###,###");
%>
		<tr id="<%= prod.getProd_no()%>" class="prodHead">
			<td class="ctgry"> <%= prod.getProd_ctgry_id()%> </td>
			<td class="prodNo"> <%= prod.getProd_no() %>      </td>
			<td class="prodName"> <%= prod.getProd_name() %>    </td>
			<td class="prodPrice"> <%= format.format(price) %>원   </td>
			<td class="prodDate"> <%= prod.getProd_date() %>    </td>
			<td class="dogWeight"> <%= prod.getProd_weight()%>   </td>
		</tr>
<%
			}
		} else{%>
			<tr>
				<td colspan="6">등록된 상품이 없습니다.</td>
			</tr>
	<%	}	%>
		<tr>
			<td id="pages" colspan="6">
				<span class="page">1</span>
				<span class="page">2</span>
				<span class="page">3</span>
				<span class="page">4</span>
				<span class="page">5</span>
				<span class="page">6</span>
				<span class="page">7</span>
				<span class="page">8</span>
				<span class="page">9</span>
				<span class="page">10</span>
			</td>
		</tr>
		</table>
		<br>
		<input type="button" value="상품 등록" id="insertProd" class="button">
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