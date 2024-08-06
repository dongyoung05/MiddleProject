<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
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

    #ff input[type="button"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #ff input[type="button"]:hover {
        background-color: #45a049;
    }

</style>
</head>
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script>
$(function(){
    $('#findPass').click(function(){
        fdata = $('#ff').serializeJSON();
        $.ajax({
            url : `<%=request.getContextPath()%>/findPass.do`,
            data : fdata,
            type : 'post',
            dataType : 'json',
            success : function(res){
                alert(res.flag);
                
                location.href="LoginMember.jsp";
            },
            error : function(xhr){
                alert('상태  : ' + xhr.status)
            }
        }) 
    })
    // 로고 클릭시 홈으로
	   $('#logo').on('click', function(){
	      location.href="<%= request.getContextPath()%>/main/main.jsp";
	   })
})
</script>
<body>


<div>
	<form id="ff">    
        <input type="text" placeholder="가입한 회원의 ID를 입력하세요" name="mem_id">
        <input type="email" placeholder="가입한 이메일을 입력하세요" name="mem_email">
        <input type="text" placeholder="가입한 회원의 이름을 입력하세요" name="mem_name">
        <input type="button" id="findPass" value="전송">
    </form>
</div>
</body>

</html>
