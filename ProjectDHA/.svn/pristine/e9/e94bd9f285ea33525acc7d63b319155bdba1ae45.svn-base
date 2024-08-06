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

    #ff input[type="email"],
    #ff input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    #ff button {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #ff button:hover {
        background-color: #45a049;
    }
</style>
</head>
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script>
    $(function(){
        $('#findId').click(function(){
            fdata = $('#ff').serializeJSON();
            $.ajax({
                url : `<%=request.getContextPath()%>/findId.do`,
                data : fdata,
                dataType : 'json',
                type : 'post',
                success : function(res){
                    alert(res.flag);
                    location.href="LoginMember.jsp";
                },
                error : function(xhr){
                    alert('상태 : ' + xhr.status);
                }
            });
        });
    });
</script>
<body>

    <form id="ff">    
        <input type="email" placeholder="가입한 이메일을 입력하세요" id="mem_email" name="mem_email">
        <input type="text" placeholder="가입한 회원의 이름을 입력하세요" id="mem_name" name="mem_name">
        <button type="button" id="findId">전송</button>
    </form>
</body>
</html>