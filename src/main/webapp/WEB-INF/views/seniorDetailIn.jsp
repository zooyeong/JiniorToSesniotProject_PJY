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
.scheduleDiv{
	width: 100px;
	height: 100px;
	background-color: lightgray;
	margin: 5px;
	display: inline-block;
}
</style>
</head>
<body>
	<h1>시니어 상세페이지 진입</h1>
	
	<p>${seniorDetail.name}님
		<c:if test="${seniorDetail.gender eq 'F'}">
			<span>여성</span>
		</c:if>
		<c:if test="${seniorDetail.gender eq 'M'}">
			<span>남성</span>
		</c:if>
		<span>만${2023 - fn:substring(seniorDetail.birthday, 0, 4)}세</span>
	</p>
	<div>
		<p>소개 : ${seniorDetail.info}</p>
	</div>
	<p>활동희망지역 : ${seniorDetail.area}</p>
	<p>스케줄 : </p>
	<c:forEach var="item" items="${seniorEnableSchedule}">
	
		<c:set var="code" value="${item.scheduleCode}"/>
		<c:set var="status" value="${item.workStatus}"/>
		
		<div class="scheduleDiv" style="
			<c:if test="${fn:contains(status, 'Y')}">background-color:yellow;</c:if>
		">
		</div>				
		
		<c:if test="${fn:contains(code, '1')}"><span>월요일</span></c:if>
		<c:if test="${fn:contains(code, '2')}"><span>화요일</span></c:if>
		<c:if test="${fn:contains(code, '3')}"><span>수요일</span></c:if>
		<c:if test="${fn:contains(code, '4')}"><span>목요일</span></c:if>
		<c:if test="${fn:contains(code, '5')}"><span>금요일</span></c:if>
		<c:if test="${fn:contains(code, 'A')}"><span>오전</span></c:if>
		<c:if test="${fn:contains(code, 'B')}"><span>오후</span></c:if>
<%-- 		<c:if test="${fn:contains(status, 'Y')}"><span>가능</span></c:if> --%>
<%-- 		<c:if test="${fn:contains(status, 'N')}"><span>불가능</span></c:if> --%>
		
	</c:forEach>
<%-- 	<p>${seniorDetail.picture}</p> --%>
	<br>
	<button type="button" onclick="location.href='/askForSenior?id=${seniorDetail.id}'">도우미 신청하기</button>
	<button type="button">채팅하기</button>
</body>
</html>