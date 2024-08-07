<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="/js/jquery-3.7.1.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/공통스크립트.js"></script>
  <script src="/js/jquery.serializejson.min.js"></script>
 
 <style>
body *{
  box-sizing:   border-box;
}
nav , #write{
  margin : 10px 5% ;
}
nav a{
   visibility:  hidden;
}
#stype {
  width : 100px;
}
#sword {
  width : 150px;
}
p{
   border  : 1px solid darkgray;
   padding : 4px;
   margin  :2px;
   word-break:keep-all;/* 줄바꿈: 단어단위로  */
   
}
.p12{
  display: flex;
  flex-direction:  row;
}

.p1{
   flex:  70%;
}
.p2{
   flex : 30%;
   text-align:  right;
}

.card-body, .reply-body{
   display:  flex;
   flex-direction:  column;
}
input[name=reply]{
   height : 55px;
   vertical-align: top;
}
textarea {
	width : 70%;
}
label{
  display : inline-block;
  width : 80px;
  height : 30px;
}
#modifyform{
  display: none;
} 
#modifyform textarea{
  vertical-align: bottom;
}
#btnok, #btnreset{
   height : 40px;
}
#pageList{
	margin-left: 10%;
}
.reply-body{
	background: darkgray;
	border: 1px solid blue;
	margin: 3px;
	padding: 2px;
}
.reply-body p{
	border: 1px solid gray;
}

#modifyform textarea {
vertical-align: bottom;
}
#insertform textarea {
 vertical-align: top;
 }
</style>
<% 
	//session값 꺼내기 
// 	MemberVO memberVo = (MemberVO)session.getAttribute("cnt");
	//memberVo -> mem_id mem_name
// 	String user = null;
// 	Gson gson = new Gson();
	//vo객체를 json형식으로 변환-직렬화
// 	if(memberVo != null) user = gson.toJson(memberVo);
%>
 
 
 <script>
 
<%--  user = <%= user %>;  //user.mem_id, user.mem_name, user.mem_pass --%>
//  currentPage = 1;
 mypath = '<%=request.getContextPath()%>';
//  reply  = {};
 
 
 $(function(){
	 
	 //실행하면 먼저 리스트를 출력 - 함수호출
	 $.listPage();
	 
	 //검색기능
// 	 $("#search").on('click', function(){
// 		 currentPage = 1;
// 		 $.listPage();
// 	 })
	 
	 //글쓰기 버튼클릭
	 $('#write').on('click',function(){
		 $('#insertModal').modal('show');
		 //로그인한 회원의 이름으로 작성자 설정
		 //$("#insertform #writer").val(user.mem_name);
	 })//click
	 
// 	 $("#insertSend").on('click',function(){
// 		 // 전체 입력 내용 가져오기
// 		 fdata = $('#insertForm').serializeJSON();
// 		 console.log(fdata);
		 
// 		 //서버로 전송 - ajax()
// 		 $.boardInsert();
		 
// 		 //모달에 입력한 내용 지우기
// 		 $('#insertForm .txt').val("");
		 
// 		 //모달창 닫기
// 		 $('#insertModal').modal('hide');
		 
// 	 })//click
	 
	 //페이지 이동기능
// 	 $(document).on("click",'.prev',function(){//이전버튼
// 		 currentPage = parseInt($('.pnum').first().text())-1;
// 		 $.listPage();
// 	 }) 
	 
// 	 $(document).on("click",'.next',function(){//다음버튼
// 		 currentPage = parseInt($('.pnum').last().text())=1;
// 		 $.listPage();
// 	 }) 
	 
	 //페이지 번호 클릭
// 	  $(document).on('click','.pnum',function(){
// 		  currentPage = parseInt($(this).text());
// 		  $.listPage();
// 	  })
	  
 })
 </script>
</head>
<body>
<!-- 네브바  -->
	<div class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
  <!-- <a class="navbar-brand" href="javascript:void(0)">Logo</a>  --> 
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-brand" href="javascript:void(0)">logo</a>
      </ul>
      <form class="d-flex">
        <select class="form-select" id="stype">
		  <option value="">전체</option>
		  <option value="mem_id" >이름</option>
		  <option value="board_title" >제목</option>
		  <option value="board_content">내용</option>
		</select>
      
        <input class="form-control me-2" type="text" id="sword" placeholder="Search">
        <button class="btn btn-primary" id="search" type="button">Search</button>
      </form>
    </div>
  </div>
</div>

<input type="button" value="글쓰기" id="write" >
 <br><br>

<!-- 게시판리스트를 출력할 공간 -->
<div id="boardList"></div>
<br><br>
<!-- 페이지리스트를 출력할 공간 -->
<div id="pagelist"></div>

<!-- 게시글 작성 팝업모달  -->
<div class="modal" id="insertModal">
	<div class="modal-dialog">
		<div class="modal-content">
		<!--모달 헤더부분  -->
			<div class="modal=header">
				<h4 class="modal-title">글 작성하기</h4>
				<hr>
				
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			
			<!-- 모달 바디부분 -->
			<div class="modal-body">
				<form name="insertForm" id="insertForm">
					<div class="form-select" id="checkbox">
		  				<input type="radio" name="board_ctgry_no" id="question" value="QUES">문의
		  				<input type="radio" name="board_ctgry_no" id="report" value="ALER">신고
					</div>
					
					<label>제목</label>
					<input type="text" id="board_title" class="txt" name="board_title"> <br>
					
					<label>작성자</label>
					<input type="text" id="mem_id" class="txt" name="mem_id"> <br>
					
					<label>이미지</label>
					<input type="file" id="board_image" class="txt" name="board_img"> <br>
					
					<label>내용</label>
					<textarea rows="10" cols="40" class="txt"  id="board_content" name="board_content"></textarea>
					<br> <br>
					<input type="button" value="확인" id="insertSend">
					
				</form>
			</div>
			
			<!-- 모달 푸터부분  -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
			</div>
			
		</div>
	</div>
</div>

<!-- 게시글 수정 팝업모달  -->
<!-- <div class="modal" id="insertModal"> -->
<!-- 	<div class="modal-dialog"> -->
<!-- 		<div class="modal-content"> -->
		<!--모달 헤더부분  -->
<!-- 			<div class="modal=header"> -->
<!-- 				<h4 class="modal-title">글 작성하기</h4> -->
<!-- 				<hr> -->
				
<!-- 				<button type="button" class="btn-close" data-bs-dismiss="modal"></button> -->
<!-- 			</div> -->
			
			<!-- 모달 바디부분 -->
<!-- 			<div class="modal-body"> -->
<!-- 				<form name="insertForm" id="insertForm"> -->
<!-- 					<div class="form-checkbox" id="checkbox"> -->
<!-- 		  				<input type="checkbox" name="board_ctgry_no" id="question" value="QUES">문의 -->
<!-- 		  				<input type="checkbox" name="board_ctgry_no" id="report" value="ALER">신고 -->
<!-- 					</div> -->
					
<!-- 					<label>제목</label> -->
<!-- 					<input type="text" id="board_title2" class="txt" name="board_title"> <br> -->
					
<!-- 					<label>작성자</label> -->
<!-- 					<input type="text" id="mem_id2" class="txt" name="mem_id"> <br> -->
					
<!-- 					<label>이미지</label> -->
<!-- 					<input type="file" id="board_image2" class="txt" name="board_img"> <br> -->
					
<!-- 					<label>내용</label> -->
<!-- 					<textarea rows="10" cols="40" class="txt"  id="board_content2" name="board_content"></textarea> -->
<!-- 					<br> <br> -->
<!-- 					<input type="button" value="확인" id="insertSend"> -->
					
<!-- 				</form> -->
<!-- 			</div> -->
			
			<!-- 모달 푸터부분  -->
<!-- 			<div class="modal-footer"> -->
<!-- 				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button> -->
<!-- 			</div> -->
			
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->



</body>
</html>