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
	<h1>logIn</h1>
	
<form id="login-form" name = "login-form" action="/login" method="post">
    <input type="text" id="logIn_Id" name="id" maxlength="50" required><br>
    <input type="password" id="logIn_Password" name="password" required><br>
    <input type="button" onclick="idAndPasswordCheck()" value="로그인하기"><br>
</form>
	<div class="forgotInfo">
	<div class = "forgotId" id="forgotId">
	<p>아이디 찾기</p>
	</div>
	<div class = "forgotPw" id="forgotPw">
	<p>비밀번호 찾기</p>
	</div>	
	</div>
	
	<p>아직 회원이 아니신가요?</p>
	
<script>

function idAndPasswordCheck() {
    var id = $('#logIn_Id').val();
    var password = $('#logIn_Password').val();

    if (!id || !password) {
        alert("아이디와 비밀번호를 입력하세요.");
        return false;
    }else{
    	alert("코코노아에 오신 걸 환영합니다!");
    	let form = document.getElementById('login-form');
    	form.submit();
    }
}    

</script>

	
	
	
</body>
</html>