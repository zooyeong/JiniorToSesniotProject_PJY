<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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





.cocoImg {
	width: 50%;
	height: 800px;
	background-image: url('../../resources/image/코코노아일러.png');
	background-size: cover;
	
}

.cocologoBox {
	width: 50%;
	height: 250px;

margin: 0 auto;
}

.cocoLogo {
	width: 280px;
	height: 230px;
	background-image: url('../../resources/image/코코노아로고.png');
	background-size: cover;

	margin: 0 auto;
}

.userType{
width:620px;

margin: 0 auto;

}
.btn {
	width: 400px;
	height: 60px;
	margin: 0 auto;
}

.parent {
	background-image: url('../../resources/image/가입부모.png');
	background-size: cover;
}

.senior {
	background-image: url('../../resources/image/가입시니어.png');
	background-size: cover;
}

.par, .snr {
	text-align: center;
}
.text{
font-size: 35px;
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
	

		<div class="cocologoBox" >
		<br><br><br>		
		<div class="cocoLogo" onclick="moveMain()"></div>
	<br><br><br><br><br><br>
	<div class="userType" >
		<p class="text">자녀들의 등하교 안전이 걱정되는 부모님이라면?</p>
        <div class="btn parent" id="parInfo" name="parInfo" onclick="moveParInfoForm()" >          
        </div>
        <br><br><br><br>
        <p class="text">자투리시간을 활용하는 부업,<br> 소일거리를 찾고계시다면?</p>
        <div class="btn senior" id="snrInfo" name="snrInfo" onclick="moveSnrInfoForm()">          
        </div>
    </div>
		</div>
	<div class="cocoImg"></div>
</div>
<div class="footer"></div>


	<script>


		function moveMain() {
			location.href = "/main";
		}

		function moveParInfoForm() {
			location.href = "/userInfoFormPar";
		}

		function moveSnrInfoForm() {
			location.href = "/userInfoFormSnr";
		}
	</script>
	
</body>
</html>