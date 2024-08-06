<%@page import="kr.or.ddit.vo.AdminVO"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>

<style type="text/css">
*{
    padding: 0;
    margin: 0;
    border: none;
}
body{
    font-size: 14px;
    font-family: 'Roboto', sans-serif;
}

.login-wrapper{
    width: 400px;
    height: 350px;
    padding: 40px;
    box-sizing: border-box;
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.login-wrapper > h2{
    font-size: 24px;
    color: #422700;
    margin-bottom: 20px;
    
}
.login-wrapper {
    width: 400px;
    height: 350px;
    padding: 40px;
    box-sizing: border-box;
    position: absolute;
    top: 40%;
    left: 50%;
    transform: translate(-50%, -50%);
}
#login-form > input{
    width: 100%;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    background-color: #F8F8F8;
}
#login-form > input::placeholder{
    color: #D2D2D2;
}
#login-form > input[type="submit"]{
    color: #fff;
    font-size: 16px;
    background-color: #422700;
    margin-top: 20px;
}

#login-form > input[type="checkbox"]{
    display: none;
}
#login-form > label{
    color: #999999;
}
#login-form input[type="checkbox"] + label{
    cursor: pointer;
    padding-left: 26px;
    background-image: url("checkbox.png");
    background-repeat: no-repeat;
    background-size: contain;
}
#login-form input[type="checkbox"]:checked + label{
    background-image: url("checkbox-active.png");
    background-repeat: no-repeat;
    background-size: contain;
}
a{
    margin-left: 20px;
}
</style>

</head>
    
<body>
<%
    // 세션 로그인 값
    MemberVO vo = (MemberVO)session.getAttribute("loginok");
    String check = (String)session.getAttribute("check");
    AdminVO admin = (AdminVO)session.getAttribute("adminok");
    MemberVO black = (MemberVO)session.getAttribute("black");
    // 로그인 아이디 기억하기
    Cookie[] cookieArr = request.getCookies();

    String cookieUserId = "";        // 쿠키값이 저장될 변수
    String strCheck = "";            // 체크박스 체크용 변수

    if( cookieArr != null ){            // 쿠키가 없으면 실행되지 않게 하여 에러가 안 생기게 하기
        for(Cookie cookie : cookieArr){            // 쿠키의 개수만큼 반복
            if("USERID".equals(cookie.getName())){        // 쿠키가 있는지 검사
                cookieUserId = cookie.getValue();
                strCheck = "checked";
            }
        }
    }
    
    if (vo == null && admin == null) {
%>  
    <div class="login-wrapper">
        <h2 style="text-align: center;">Login</h2>
        <form id="login-form" action="/ProjectDHA/loginMember.do" method="post">
            <input type="text" name="mem_id" placeholder="아이디">
            <input type="password" name="mem_pass" placeholder="비밀번호">
            <label for="remember-check">
                <input type="checkbox" name="chkId" value="check" <%= strCheck %>>아이디 저장하기
            </label>
            <input type="submit" value="Login" id="login"><br>
            <a href="<%=request.getContextPath() %>/member/IdMember.jsp">아이디찾기</a> <a href="<%=request.getContextPath() %>/member/PassMember.jsp">비밀번호찾기</a>  <a href="<%=request.getContextPath() %>/member/InsertMember.jsp">회원가입</a>
        </form>
    </div>
    
    <%  
	    } if("false".equals(check) ) { 
	%>
	        <script type="text/javascript">
	      
	        	console.log(<%=check%>+'4444');
	            alert('입력한 아이디와 비밀번호가 다릅니다.');  
// 	            history.back();
	        
	     
	         </script>
	   

<%  
    } else if (vo != null) { 
        if (black == null) { 
%>
            <script type="text/javascript">
                alert('<%=vo.getMem_name()%>님 환영합니다.');
                location.href = "<%=request.getContextPath() %>/main/main.jsp";
                console.log(<%=check%>+'1111');
            </script>
<% 
        } else if(black != null) { 
%>
            <script>
                alert('해당 계정은 블랙리스트 회원입니다.');
                location.href="<%=request.getContextPath()%>/logoutMember.do"
                
				console.log(<%=check%>+'2222');
            </script>
<% 
        }   
    } else if (admin != null) { 
%>
        <script type="text/javascript">
            alert('<%=admin.getAdmin_name()%>님 환영합니다.');
            location.href = "<%=request.getContextPath()%>/admin/AdminMain.jsp";
            console.log(<%=check%>+'3333');
        </script>
<%  } %>
</body>
</html>
