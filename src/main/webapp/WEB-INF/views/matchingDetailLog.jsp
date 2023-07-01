<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/table.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>
.dLog {
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

</style>

<div class="pd">
<div class="dLog">매칭 상세 - 동행 여부 확인</div>

<body>
	<table>
		<thead>
			<tr>
				<th>매칭 고유번호</th>
				<th>스케줄 코드</th>
				<th>동행 완료 날짜</th>
				<th>동행 상태</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="mDetail" items="${matchingDetail}">
				<tr>
					<td>${mDetail.matchingNumber}</td>
					<td><c:choose>
							<c:when test="${mDetail.scheduleCode eq '1A'}">월요일 오전</c:when>
							<c:when test="${mDetail.scheduleCode eq '1B'}">월요일 오후</c:when>
							<c:when test="${mDetail.scheduleCode eq '2A'}">화요일 오전</c:when>
							<c:when test="${mDetail.scheduleCode eq '2B'}">화요일 오후</c:when>
							<c:when test="${mDetail.scheduleCode eq '3A'}">수요일 오전</c:when>
							<c:when test="${mDetail.scheduleCode eq '3B'}">수요일 오후</c:when>
							<c:when test="${mDetail.scheduleCode eq '4A'}">목요일 오전</c:when>
							<c:when test="${mDetail.scheduleCode eq '4B'}">목요일 오후</c:when>
							<c:when test="${mDetail.scheduleCode eq '5A'}">금요일 오전</c:when>
							<c:when test="${mDetail.scheduleCode eq '5B'}">금요일 오후</c:when>
						</c:choose></td>
					<td>${mDetail.day}</td>
					<td>${mDetail.status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<br>
	<button type="button" class="btn btn-secondary" onclick="history.back();">이전 페이지로 돌아가기</button>
	
</body>
</div>
</html>