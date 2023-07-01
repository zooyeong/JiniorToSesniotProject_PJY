<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 변경</h1>
	<p>안전한 비밀번호로 내 정보를 보호하세요.</p>
	
	<form action="" method="post" name="changePasswordForm">
		<label>현재 비밀번호</label><br>
		<input type="password" id="password" name="password"><br>
		
		<label>새 비밀번호</label><br>
		<input type="password" id="newPassword" name="newPassword"><br>
		
		<label>새 비밀번호 재확인</label><br>
		<input type="password" id="newPasswordChk"><br>
		
		<button type="button" onclick="changePassword()">변경</button>
		<button type="button" onclick="location.href='/parMypage'">취소</button>
	</form>
	
	<script>
		function changePassword(){
			let form = document.changePasswordForm;
			let reg = new RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$");
			
			let password = document.getElementById('password');
			let newPassword = document.getElementById('newPassword');
			let newPasswordChk = document.getElementById('newPasswordChk');
			
			if(password.value == ""){
				alert('비밀번호를 입력해주세요.');
				password.focus();
			} else if(newPassword.value == ""){
				alert('변경할 비밀번호를 입력해주세요.');
				newPassword.focus();
			} else if(newPasswordChk.value == ""){
				alert('비밀번호를 재확인해주세요.');
				newPasswordChk.focus();
			} else if(password.value == newPassword.value){
				alert("기존 비밀번호와 변경하려는 비밀번호가 동일합니다.");
				newPassword.focus();
			} else if(newPassword.value != newPasswordChk.value){
				alert('입력한 비밀번호가 다릅니다. 비밀번호를 재확인해주세요.');
				newPasswordChk.focus();
			} else if(!reg.test(newPassword.value)){
				alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다.");
				newPassword.focus();
			} else if(newPassword.value.search(" ") != -1){
				alert("비밀번호는 공백을 포함할 수 없습니다.");
				newPassword.focus();
			} else{
				form.submit();
			}
		}
		
	</script>
	
</body>
</html>