<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.DogVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	MemberVO mvo = (MemberVO)request.getAttribute("memberVo");
	List<DogVO> dogList = (List<DogVO>)request.getAttribute("dogList");
%>
<script src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/MainPage.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/중분류페이지공통스타일.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Modal창.css">
<script>
$(function(){
	 var path = '<%=request.getContextPath()%>';
	 var mem_id = '<%=mvo.getMem_id()%>';
	 
	    $('#blackMember').click(function() {
	        $.showModal();

	        // 회원 정보 가져오기
	      
	        var mem_name = '<%=mvo.getMem_name()%>';
	        var mem_email = '<%=mvo.getMem_email()%>';

	        // 모달에 회원 정보 출력
	        $('#mem_id').text("회원ID : " + mem_id);
	        $('#mem_name').text("회원명 : " + mem_name);
	        $('#mem_email').text("회원메일 : " + mem_email);

	        // 신고자와 사유 입력란 초기화
	        $('#report_id').val('');
	        $('#list_reason').val('');
	    });

	    $('#insert').click(function() {
	       
	        var mem_name = '<%=mvo.getMem_name()%>';
	        var mem_email = '<%=mvo.getMem_email()%>';
	        var report_id = $('#report_id').val();
	        var list_reason = $('#list_reason').val();

	        $.ajax({
	            url: '<%=request.getContextPath()%>/blacklistInsert.do',
	            data: {
	                "mem_id": mem_id,
	                "mem_name": mem_name,
	                "mem_email": mem_email,
	                "report_id": report_id,
	                "list_reason": list_reason
	            },
	            dataType: 'json',
	            type: 'post',
	            success: function(res) {
	                alert(res.flag);
	                $.closeModal();
	            },
	            error: function(xhr) {
	                alert('상태 : ' + xhr.status);
	            }
	        });
	        
	        
	    });
	    
	    $('#deleteMember').click(function(){
	    	
	    	if(confirm('정말 삭제하시겠습니까')){
	    		
	    		
		    	$.ajax({
		    		url : '<%=request.getContextPath()%>/deleteMember.do',
		    		data : { "mem_id": mem_id },
		    		dataType : 'json',
		    		type : 'post',
		    		success : function(res) {
		    			alert(res.flag);
		    			location.href = '<%=request.getContextPath()%>/memberListAdmin.do';
		    		},
		    		error : function(xhr){
		    			alert('상태 : ' + xhr.status);
		    		}
		    	});
	    	} else {
	    		alert('삭제를 취소했습니다.');
	    	} 
	    	
	    });

	    $('#cancel').click(function() {
	        $.closeModal();
	    });

	    $.showModal = function() {
	        console.log('show');
	        $('.modal_container', parent.document).fadeIn(200);
	    };

	    $.closeModal = function() {
	        console.log('close');
	        $('.modal_container', parent.document).fadeOut(200);
	    };
	    
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
});
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
	<h3>특정회원 정보 조회</h3>
	
	<table border='1' class="table table-striped">
		<tr>
			<td>회원 ID</td>
			<td><%=mvo.getMem_id() %></td>
		</tr>
		<tr>
			<td>회원명</td>
			<td><%=mvo.getMem_name() %></td>
		</tr>
		<tr>
			<td>회원메일</td>
			<td><%=mvo.getMem_email() %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=mvo.getMem_tel() %></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><%=mvo.getMem_add1() %><br><%=mvo.getMem_add2() %></td>
		</tr>
		<tr>
			<td>반려견</td>
			<td>
				<%
					if(dogList != null && !dogList.isEmpty()){
						for(int i=0; i<dogList.size(); i++) {
							if(i>0){
				%>				
								,
				<%			} %>
					
							<%=dogList.get(i).getDog_name() %>
				<%		
						}
					} else {
				%>
						보유한 반려견이 없습니다...
				<% 	} %>
			</td>
		</tr>
	</table>
	<br>
	<input type="button" value="블랙리스트 등록" id="blackMember" class="button">
	<input type="button" value="회원정보 삭제" id="deleteMember" class="button">
	
	
	
	<!-- Modal 창 띄우기 -->
	<div class="modal_container" style="margin: none;">
		<div class="modal">
			<div class="modal_header">
				<h3>블랙리스트 등록</h3>
			</div>
			<hr>
			<div class="modal_content">
			<form id="ff">
				<h3 id="mem_id" >회원ID : <%=mvo.getMem_id()%></h3>
				<h3 id="mem_name" >회원명 : <%=mvo.getMem_name()%></h3>
				<h3 id="mem_email" >회원메일 : <%=mvo.getMem_email()%></h3>
				<div id="modal_items">
				</div>
				<hr>
				<h3>신고자</h3>
				<input type="text" id="report_id" style="height: 30px;" placeholder="신고자 id를 입력하세요...">
				<p>
					<span class="modalSpan">신고사유</span>
					<textarea rows="20" cols="50" id="list_reason" style=""></textarea>
				</p>
			</form>
			</div>
			<hr>
			
			<div class="modal_footer">
				<button id="insert">등록하기</button>
				<button id="cancel">취소</button>
			</div>
		</div>
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