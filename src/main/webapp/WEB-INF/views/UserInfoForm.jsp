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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
</head>
<body>
	<h1>회원가입</h1>
<div class="container">
	<form method="post" action = "">
	
	아이디<br>
	<input type="text" class="id_input" id="Id" name="Id" maxlength="30" placeholder="아이디 입력">
	<button id="IdChkBtn" >중복확인</button>
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
	
	
	<input type="submit" value="다음"><br>
	
	</form>
</div>



<script>

</script>


	
</body>
</html>