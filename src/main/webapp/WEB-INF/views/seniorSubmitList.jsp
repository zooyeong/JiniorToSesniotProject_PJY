<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<title>Insert title here</title>
<link href="/resources/css/table.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.regSnrList {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.8rem;
	margin: 10px
}
.pd {
	align-items: center;
	padding: 10px 100px 10px 100px;
}

a {
	font-weight: bold;
}
</style>

<div class="pd">
<div class="regSnrList">시니어 인증파일 제출 리스트</div>

<body>
	<table>
		<thead>
			<tr>
				<th>인증</th>
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
					<td><a href="verifySenior?id=${vlist.id}">${vlist.id}</a></td>
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
	
	<button type="button" style="margin-left: 220px;" class="btn btn-secondary" onclick="location.href='admin'">관리자 페이지로 돌아가기</button>

</body>
</div>
</html>