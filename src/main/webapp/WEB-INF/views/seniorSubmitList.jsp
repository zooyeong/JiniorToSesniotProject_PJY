<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.regSnrList {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.8rem;
	margin: 10px;
}

.pd {
	align-items: center;
	padding: 110px 50px 110px 50px;
}

#idBtn {
	font-weight: bold;
	color: green;
	
}

@charset "UTF-8";

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

body {
	color: #666;
}

#table {
	border-collapse: separate;
	border-spacing: 0;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	margin: 0 auto;
}

th {
	background: #198754;
	color: #fff;
	text-align: center;
	height: 50px;
	width: 15px;
	font-size: 20px;
}


tr th {
	padding-left: 30px;
	padding-right: 30px;
}


tr:first-child th:first-child {
	border-top-left-radius: 6px;
	padding-left: 30px;
}

tr:first-child th:last-child {
	border-top-right-radius: 6px;
	padding-left: 30px;
	padding-right: 30px;
}

td {
	border-right: 1px solid #c6c9cc;
	border-bottom: 1px solid #c6c9cc;
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

<%@ include file="header.jsp"%>

<%
if ( !(userId.equals("admin")) || userId == null) {
response.sendRedirect("main");
}
%> 

<div class="pd">
<div class="regSnrList">시니어 인증파일 제출 리스트</div>

<body>
	<table id="table">
		<thead>
			<tr>
				<th>NO.</th>
				<th>신분증</th>
				<th>범죄이력</th>
				<th>시니어아이디</th>
				<th>인증여부</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="vlist" items="${seniorVeriList}">
				<tr>
					<td>${vlist.verificationNum}</td>
					<td><img src="${pageContext.request.contextPath}/image/Certification/${vlist.idcpicture}" width="150" height="200"/></td>
					<td><img src="${pageContext.request.contextPath}/image/Certification/${vlist.cmnpicture}" width="150" height="200"/></td>
					<td><a id="idBtn" href="verifySenior?id=${vlist.id}">${vlist.id}</a></td>
					<td><c:choose>
							<c:when test="${vlist.verificationStatus eq 'N'}">미인증</c:when>
							<c:when test="${vlist.verificationStatus eq 'Y'}">인증</c:when>
							<c:when test="${vlist.verificationStatus eq 'Rejected'}">인증거절</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 처리 부분 -->
	<div style="text-align: center">
	<c:if test="${prev}">
		<span>
			<a href="/verifySenior?num=${startPageNum - 1}">
				<button class="btn btn-success" style="margin-top: 10px">이전</button>
			</a>
		</span>
	</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> <c:if test="${select != num}">
					<a href="/verifySenior?num=${num}"><button type="button" class="btn btn-light"  style="margin-top: 10px">${num}</button></a>
				</c:if> <c:if test="${select == num}">
					<button type="button" class="btn btn-success"  style="margin-top: 10px"><b>${num}</b></button>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${next}">
		<span>
			<a href="/verifySenior?num=${endPageNum + 1}">
				<button class="btn btn-success" style="margin-top: 10px">다음</button>
			</a>
		</span>
	</c:if>
	</div>
	<!-- 페이징 처리 끝 부분 -->
	<br>
	<button type="button" class="btn btn-secondary" onclick="location.href='admin'">관리자 페이지로 돌아가기</button>

</body>
</div>
</html>