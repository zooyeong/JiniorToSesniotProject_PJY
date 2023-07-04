<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
	integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
	@font-face {
	font-family: 'omyu_pretty';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
	
}
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box; 
	font-family: 'omyu_pretty';
}
.container {
	width: 100%;
	height: 800px;

	background-color: #FAF3E6;
	display: flex;
	text-align: center;
}
.loginForm{
width: 50%;
height: 700px;
font-size: xx-large;
}

.cocoLogo {
	width: 280px;
	height: 230px;
	background-image: url('../../resources/image/코코노아로고.png');
	background-size: cover;
	margin: 0 auto;
	margin-top: 17px;	
}

input{
width: 350px;
height: 50px;
margin-bottom: 20px;
font-size: 40px;
}

.login{
width: 300px;
height: 65px;
background-image: url('../../resources/image/코코로그인.png');
background-size: cover;
margin: 0 auto;
}
.signUp{
text-decoration: none;
color: black;
}
.cocoImg {
	width: 50%;
	height: 800px;
	background-image: url('../../resources/image/코코노아일러.png');
	background-size: cover;
	
}

.footer{
width:100%;
height:130px;
background-image:url('../../resources/image/footPrint_coco.png');
background-size: cover;
}

</style>
</head>
<body>
<div class="container">

<div class="loginForm">
		<br>		
		<div class="cocoLogo" onclick="moveMain()"></div>
	<br><br><br>
<form id="login-form" name = "login-form" action="/login" method="post">
	아이디<br>
    <input type="text" id="logIn_Id" name="id" maxlength="50" required><br>
    비밀번호<br>
    <input type="password" id="logIn_Password" name="password" required><br>
<!--     <input type="button" onclick="idAndPasswordCheck()" value="로그인하기"><br> -->
</form>
    <div class="login" onclick="idAndPasswordCheck()" ></div>
	<br>
	<a href="/signUpType" class="signUp">아직 코코노아 회원이 아니신가요?</a>
	
</div>	
<div class="cocoImg"></div>	
</div>
<div class="footer"></div>


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
function moveMain() {
	location.href = "/main";
}
</script>

	
	
	
</body>
</html>