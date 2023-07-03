<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
	integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


</head>
<body>
	<h1>로그인</h1>
<div class="loginForm">
<form id="login-form" name = "login-form" action="/login" method="post">
    <input type="text" id="logIn_Id" name="id" maxlength="50" required><br>
    <input type="password" id="logIn_Password" name="password" required><br>
    <input type="button" onclick="idAndPasswordCheck()" value="로그인하기"><br>
</form>
	
	<p>아직 회원이 아니신가요?</p>
</div>		
<script>

function idAndPasswordCheck() {
    var id = $('#logIn_Id').val();
    var password = $('#logIn_Password').val();

    if (!id || !password) {
        alert("아이디와 비밀번호를 입력하세요.");
        return false;
    }else{
    	
    	let form = document.getElementById('login-form');
    	form.submit();
    }
}    

</script>

	
	
	
</body>
</html>