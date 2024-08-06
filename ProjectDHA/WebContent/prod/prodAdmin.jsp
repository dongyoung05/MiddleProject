<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prod Admin</title>
<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>	
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/MainPage.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/중분류페이지공통스타일.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script>
	$(function(){
		//	상품 등록 이벤트
		$.ajax({
			url : `<%= request.getContextPath() %>/prod/getAllCtrgy.do`,
			type : 'post',
			dataType : 'json',
			success : function(result){
				code = "";
				$.each(result, function(i,v){
					code += `<option value="${v.prod_ctgry_id}"> ${v.prod_ctgry_name} </option>`;
				})
				
				$('#prod_ctgry_id').append(code);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			}
		})
		
		//	resize
		$.resize = function(){
			size = $('.table').height() + 200;
			console.log(size);
			$('#section').css('height', size);
		}
		$.resize();
		$(window).resize(function(){$.resize()});
	})
</script>
<style>
	#section {
		border : 2px double black;
		border-radius : 10px;
		text-align : left;
		display : flex;
		justify-content: center;
		align-items: center;
	}
	.table tr td:first-child {
		font-weight : bold;
		font-size : 1.2em;
		height : 75px;
		text-align : center;
	}
	#buttonTd {
		text-align: center;
	}
	#buttonTd input {
		background-color: #422700;
		border: none;
		color: white;
		padding: 15px 32px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 4px 2px;
		cursor: pointer;
		border-radius: 10px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	}
	
	#buttonTd input:hover {
    	background-color: #8f6427;
	}
</style>
</head>
 
<body>
<%@ include file="../admin/view/AdminView.jsp" %>
	<div id="section">
		<form action="<%= request.getContextPath() %>/prod/prodInsert.do" method="post" enctype="multipart/form-data">
			<table class="table" border="1">
				<tr>
					<th colspan="2">상품 등록</th>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type="text" name="prod_name" id="prod_name"></td>
				</tr>
				<tr>
					<td>상품 설명</td>
					<td><textarea rows="5" cols="50" name="prod_desc" id="prod_desc"></textarea></td>
				</tr>
				<tr>
					<td>상품 사이즈</td>
					<td>
						<select name="prod_size" id="prod_size">
							<option value="없음">없음</option>
							<option value="S"   >S</option>
							<option value="M"   >M</option>
							<option value="L"   >L</option>
							<option value="XL"  >XL</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>견종의 체급</td>
					<td>
						<select name="prod_weight" id="prod_weight">
							<option>소형</option>
							<option>중형</option>
							<option>대형</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>상품 색상</td>
					<td><input type="text" name="prod_color" id="prod_color" placeholder="색상이 없는 상품의 경우 비울 것"></td>
				</tr>
				<tr>
					<td>상품 이미지</td>
					<td><input type="file" name="prod_img" id="prod_img"></td>
				</tr>
				<tr>
					<td>상품 가격</td>
					<td><input type="number" name="prod_price" id="prod_price"></td>
				</tr>
				<tr>
					<td>상품 분류 선택</td>
					<td>
						<select name="prod_ctgry_id" id="prod_ctgry_id">
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" id="buttonTd">
						<input type="submit" name="prodSubimt" id="prodSubmit" value="등록">
						<input type="reset" name="prodReset" id="prodReset" value="취소">
					</td>
				</tr>
			</table>
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
