<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
text-align: center;
}
.seniorDiv{
border: 1px solid black;
border-radius: 8px;
margin-bottom: 5px;
}
</style>
</head>
<body>
	<h1>시니어 상세정보</h1>
	<c:forEach var="item" items="${seniorDetail}">
		<div class="seniorDiv" onclick="location.href='/seniorDetail?id=${item.id}';">
			<p>${item.name}님 만${2023 - fn:substring(item.birthday, 0, 4)}세</p>
			<p>${item.info}</p>
			<p>${item.area}</p>
		</div>
	</c:forEach>
<%-- 	<img src="${sample}" alt="${sample}"> --%>
</body>
</html>