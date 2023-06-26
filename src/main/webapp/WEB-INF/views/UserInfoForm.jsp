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
	
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 아이디 체크할 ajax  -->
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script> -->
</head>
<body>
	<h1>회원가입</h1>
<div class="container">
	<form method="post" action = "">
	
	아이디<br>
	<input type="text" id="Id" name="Id" maxlength="30" placeholder="아이디 입력">
	<button id="IdChkBtn" onclick="IdChk()">중복확인</button>
	
	<input type="text" id="checkID" name="checkID" placeholder="중복확인 값">
	<br>
	비밀번호<br><input type="password" id="password" name="password" placeholder="비밀번호 입력"><br>
	비밀번호 확인<br><input type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 확인"><br>
	이름<br><input type="text" id="name" name="name" placeholder="이름"><br>
	생년월일<br><input type="date" name="birthday" ><br>
	성별<br>
	<select size="1">
	<optgroup label="성별">
	<option value="1">여</option>
	<option value="2">남</option>	
	</optgroup>
	</select>
	<br>
<!-- 	전화번호<br><input type="tel" id="PhoneNumber" placeholder="번호 자동입력하고싶다"><br> -->
	<%@ include file = "sms_cf.jsp" %> 
	주소<br><%@ include file = "address.jsp" %> 
	<br>
	이메일<br><input type="email"><br>
	<!-- 계정주소도 선택하게 하면 테이블 컬럼을 늘려야하나? -->
	회원유형<br>
	<select size="1">
	<optgroup label="회원유형">
	<option value="1">부모님</option>
	<option value="2">시니어님</option>	
	</optgroup>
	</select>
	<br>
	약관
	<%@ include file = "agreementBox.jsp" %> 
	
	
	<input type="submit" onclick="checkValue()" value="다음"><br>
	
	</form>
</div>





<script>
<!-- 아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 ) -->
 	 $(document).ready(function() {
 	$("#idCheck").click(IdChk);
	 });
	 
	function IdChk() {
		
		//id를 param.
		var userId = $("#id").val();
		
		$.ajax({
		async:true,
		true:'post',
		data: userId,
		url : "signUpForm.idchk",
		dataType="json",
		contentType:"application/json; charset=UTF-8",
		success : funtrion(data){
			if(data.cnt == 0 ) {
				alert("아이디가 존재합니다. 다른 아이디를 입력해주세요");
				
			}
			else if (data.cnt == 1){
				alert("사용가능한 아이디입니다.");
				//아이디가 중복하지 않으면  idck = 1 
                idck = 1;
			}
			
		},
		error : funtion(error){
			alert("error : " + error);
		}
			
			
		});
		
		
	}		
	
	
	
	function checkValue(){
		var form = document.UserInfoForm;
		
	if (!form.id.value){
		alert("아이디를 입력하세요");
		return false;
	}
	if(form.checkID.value == null)	{
		alert("아이디 중복체크를 해주세요");
		return false;
	}
	if(!form.password.value){
		alert("비밀번호를 입력하세요");
		return false;
	}
	
	//비밀번호와 비밀번호 확인 입력값이 동일한지 확인
	if(form.password.value != form.passwordCheck.value){
		alert("비밀번호를 동일하게 입력하세요");
		return false;
	}
	if(!form.name.value){
		alert("이름을 입력하세요");
		return false;
	}
		};
		
		
		
		
		
	} 
	



</script>



	
</body>
</html>