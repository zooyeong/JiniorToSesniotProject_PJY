<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container {
		width: 100%;
		height: 100%;
		}
		

	

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<body>
	<h1>회원가입</h1>
<div class="container">
	<form method="post" action = "" name="userInfo">
	
	아이디<br>
	<input type="text" class="id_input" id="Id" name="Id" maxlength="50" onkeydown="inputIdChk()">
	
	<button type="button" id="IdChkBtn" onclick="openIdChk()">중복확인</button>
	<input type="text" name="idDuplication" value="idUnCheck">
	<br>
	비밀번호<br><input type="password" id="password" name="password" placeholder="비밀번호 입력"><br>
	비밀번호 확인<br><input type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 확인"><br>
	이름<br><input type="text" id="name" name="name" placeholder="이름"><br>
	생년월일<br><input type="date" name="birthday" ><br>
	성별<br>
	남자<input type="radio" id="gender" name="gender" value="M" checked>여자<input type="radio" id="gender" name="gender" value="F">
	<br>
	<%@ include file = "sms_cf.jsp" %> 
	주소<br><%@ include file = "address.jsp" %> 
	<br>
	이메일<br><input type="email" name="email"><br>
	
	<!-- 이전 페이지에서 부모 버튼 누르면 "PAR"입력, 시니어 누르면 "SNR" 입력됨. 확인 후 hidden할 것임. -->
	<input type="text" class="user_code" id="user_code" name="user_code">
	
	<!-- 부모 누르면 parForm 가져오고 시니어 누르면 snrForm 가져오기 -->
	<%@ include file = "ParForm.jsp" %> 
	<%@ include file = "SnrForm.jsp" %> 
	<br>
	약관
	<%@ include file = "agreementBox.jsp" %> 
	
	<input type="button" onclick="goMainPage()" value="취소">
	<input type="button" onclick="checkValue()" onclick="signUp()" value="가입"><br>
	
	</form>
</div>



<script>

	//회원가입 화면의 입력값들을 검사함.
	function checkValue(){
		var form = document.userInfo;

		if(!form.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			if(form.idDuplication.value != "idCheck"){
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if(!form.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
			if(form.password.value != form.passwordCheck.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
			if(!form.name.value){
				alert("이름을 입력하세요.");
				return false;
			}

			if(!form.phoneNum.value){
				alert("휴대전화 번호를 입력하세요.");
				return false;
			}
			if(!form.smsPass.value || form.smsPass.value == 0){
				alert("휴대전화를 인증하세요.");
				return false;
			}
			if(isNaN(form.phoneNum.value)){
				alert("전화번호는 - 제외한 숫자만 입력해주세요.");
				return false;
			}
			if(!form.postCode.value){
				alert("우편번호를 입력하세요.")
				return false;
			}
			if(!form.address.value){
				alert("주소를 입력하세요.")
				return false;
			}
			if(form.agree_code_01.value == "N" || form.agree_code_02.value == "N"){
				alert("필수약관에 동의 후 가입가능합니다.")
				return false;
			}
			
	}

	// 취소 버튼 클릭시 첫화면으로 이동(메인페이지랑 생성하면 수정해서 연결하기)
	// function goMainPage() {
	// 	location.href = "메인페이지jsp";
	// }

	// 아이디 중복체크 화면open
	function openIdChk(){
		window.name = "parentForm";
		window.open("/IdCheckForm",
					"chkForm", "width=500, height=300, resizable = no, scrollbars = no");
	}

		// 아이디 입력창에 값 입력시 hidden에 idUnCheck를 세팅한다.
		// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
		// 다시 중복체크를 하도록 한다.
		function inputIdChk(){
			document.userInfo.idDuplication.value ="idUnCheck";
		}

		

		
</script>


	
</body>
</html>