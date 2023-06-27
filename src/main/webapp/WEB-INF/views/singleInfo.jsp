<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>회원정보 1개 출력</h1>
	<h3>아직 certification 테이블이 없어서.. 여기서 그거 출력할 것임 이건 테스트용</h3>
		
	<c:forEach var="list" items="${userList}" >
		<p>${list.id}, ${list.password}, ${list.name}, 
		${list.phoneNumber}, ${list.adress}, ${list.gender}, 
		${list.email}, ${list.userCode}, ${list.regDate} </p>
	</c:forEach>
	
</html>