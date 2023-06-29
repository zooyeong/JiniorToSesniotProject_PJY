<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>

.btn{
width: 100px;
height: 60px;
border: 1px solid black;
}
.par, .snr {
    text-align: center;
}

</style>


</head>
<body>
	<h1>유저 타입별로 나누기</h1>
	
	<div class="userType">

        <div class="btn parent" id="parInfo" name="parInfo" onclick="moveParInfoForm()" >
            <p class="par">부모님</p>
        </div>
        <div class="btn senior" id="snrInfo" name="snrInfo" onclick="moveSnrInfoForm()">
            <p class="snr">시니어님</p>
        </div>
    </div>

	<script>

function moveParInfoForm() {
    location.href = "/userInfoFormPar";
}

function moveSnrInfoForm() {
    location.href = "/userInfoFormSnr";
}

	</script>
	
</body>
</html>