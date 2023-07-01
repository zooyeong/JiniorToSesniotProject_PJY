<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="userCode" value="<%=session.getAttribute("userCode") %>">
	<script>
		let userCode = document.getElementById('userCode').value;
		alert('비밀번호가 변경되었습니다.');
		if(userCode == 'PAR'){
			location.href='/parMypage';			
		}else if(userCode == 'SNR'){
			location.href='/snrMypage';			
		}
	</script>
</body>
</html>