<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>
@font-face {
	font-family: 'omyu_pretty';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

* {
	text-align: center;
	font-family: 'omyu_pretty';
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
#table {
	border-collapse: separate;
	border-spacing: 0;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	margin: 0 auto;
	background: #FAF3E6;
}

th {
	background: #198754;
	color: #fff;
	text-align: center;
	height: 50px;
	width: 15px;
	font-size: 20px;
}

th:nth-child(1),
th:nth-child(8){
	padding-left: 15px;
	padding-right: 15px;
}

th:nth-child(2),
th:nth-child(3),
th:nth-child(6),
th:nth-child(9){
	padding-left: 30px;
	padding-right: 30px;
}

th:nth-child(4),
th:nth-child(5){
	padding-left: 20px;
	padding-right: 20px;
}

th:nth-child(7),
th:nth-child(8){
	padding-left: 50px;
	padding-right: 50px;
}

tr:first-child th:first-child {
	border-top-left-radius: 6px;
}

tr:first-child th:last-child {
	border-top-right-radius: 6px;
}

td {
	border-right: 1px solid #c6c9cc;
	border-bottom: 1px solid #c6c9cc;
	height: 50px;
}

td:first-child {
	border-left: 1px solid #c6c9cc;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 6px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 6px;
}
</style>
<body>
<%@ include file="header.jsp"%>
<div class="container" style="margin-top:150px;">
	<h1>활동 예정 목록</h1>
	<table id="table">
		<thead>
			<tr>
				<th>매칭번호</th>
				<th>부모 아이디</th>
				<th>시작일자</th>
				<th>종료일자</th>
				<th>픽업장소</th>
				<th>도착장소</th>
				<th>매칭상태</th>
			</tr>
		</thead>
		<c:forEach var="item" items="${matchingDtoList}">
			<tr class="scheduleContainer" onclick="location.href='/scheduleList?matchingNumber=${item.matchingNumber}'">
				<td>${item.matchingNumber}</td>
				<td>${item.parId}</td>
				<td>${fn:substring(item.startDate, 0, 10)}</td>
				<td>${fn:substring(item.endDate, 0, 10)}</td>
				<td>${item.pickUpPlace}</td>
				<td>${item.arrivePlace}</td>
				<td>${item.status}</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${empty matchingDtoList}">
		<p>새로운 스케줄이 없습니다.</p>
	</c:if>
</div>
</body>
</html>