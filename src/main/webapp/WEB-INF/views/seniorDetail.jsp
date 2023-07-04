<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시니어 리스트</title>
<style>
body{
background-color: #F6F6F6}
.seniorDiv{
top:150px;
background-color: white;
border-radius: 12px;
margin-top : 25px;
margin-bottom: 12px;
width: 60%;
height: 230px;
position: relative;
left: 21%;
padding: 20px;
}
.infomation{
	font-size: 1.5rem;
	 font-weight: 700;
}
    .upline {
            width: 100%;
            text-align: center;
            height: 1px;
            background-color: lightgray;
            border-radius: 12px;
        }
</style>
</head>
<body>
<%@include file = "header.jsp" %>
	<h1 style="text-align: center; top:150px; position: relative; font-weight: 700;">코코노아 시터</h1>
	<c:forEach var="item" items="${seniorDetail}">
		<div class="seniorDiv" onclick="location.href='/seniorDetail?id=${item.id}';">
			<p class="infomation">${item.name}님 만${2023 - fn:substring(item.birthday, 0, 4)}세</p>
			<p style="color: #FF7000; font-size: 20px;">★★★★★</p>
			<p style="font-size: 1.2rem; font-weight:500;">활동지역</p>
			<span>${item.area}</span>
			<br><br>
			<div class="upline"></div>
			<br>
			<span style="font-size: 1.2rem; font-weight:500;">자기소개</span>
			<br><br>
			<p style="width: 650px; display: -webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical; overflow:hidden; text-overflow:ellipsis; ">${item.info}</p>
			
		</div>
	</c:forEach>
<%-- 	<img src="${sample}" alt="${sample}"> --%>
</body>
</html>