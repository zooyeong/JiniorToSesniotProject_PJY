<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>시니어 리스트</title>
</head>
<body>
	<h1>시니어 리스트</h1>
<%-- 	<c:forEach var="item" items="${seniorList}"> --%>
<!-- 		<div> -->
<%-- 			<p>${item.name}님, 만${2023 - fn:substring(item.birthday, 0, 4)}세</p> --%>
<%-- 			<c:forEach var="itemSNR" items="${seniorSNRList}"> --%>
<%-- 				<c:if test="${item.id eq itemSNR.id}">			 --%>
<%-- 					<p>${itemSNR.info}</p>		 --%>
<%-- 				</c:if> --%>
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<%-- 	</c:forEach> --%>
	
	<hr>
	
	<c:forEach var="item" items="${seniorDetail}">
		<div>
			<p>${item.name}님 만${2023 - fn:substring(item.birthday, 0, 4)}세</p>
			<p>${item.info}</p>
			<hr>
		</div>
	</c:forEach>
</body>
</html>