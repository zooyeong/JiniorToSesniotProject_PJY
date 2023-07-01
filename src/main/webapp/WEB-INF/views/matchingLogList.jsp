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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<style>
.mLog {
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
<div class="mLog">매칭 이력</div>

<body>
	<table>
		<thead>
			<tr>
				<th>매칭 고유번호</th>
				<th>시니어 아이디</th>
				<th>부모 아이디</th>
				<th>시작일자</th>
				<th>종료일자</th>
				<th>스케줄</th>
				<th>픽업장소</th>
				<th>도착장소</th>
				<th>매칭상태</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="mList" items="${matchingLogList}">
				<tr>
					<td><a href="matchingDetailLog?matchingNumber=${mList.matchingNumber}">${mList.matchingNumber}</a></td>
					<td><a href="matchingLogList?snrId=${mList.snrId}">${mList.snrId}</a></td>
					<td><a href="matchingLogList?parId=${mList.parId}">${mList.parId}</a></td>
					<td>${mList.startDate}</td>
					<td>${mList.endDate}</td>
					<td><c:choose>
							<c:when test="${mList.scheduleCode eq '1A'}">월요일 오전</c:when>
							<c:when test="${mList.scheduleCode eq '1B'}">월요일 오후</c:when>
							<c:when test="${mList.scheduleCode eq '2A'}">화요일 오전</c:when>
							<c:when test="${mList.scheduleCode eq '2B'}">화요일 오후</c:when>
							<c:when test="${mList.scheduleCode eq '3A'}">수요일 오전</c:when>
							<c:when test="${mList.scheduleCode eq '3B'}">수요일 오후</c:when>
							<c:when test="${mList.scheduleCode eq '4A'}">목요일 오전</c:when>
							<c:when test="${mList.scheduleCode eq '4B'}">목요일 오후</c:when>
							<c:when test="${mList.scheduleCode eq '5A'}">금요일 오전</c:when>
							<c:when test="${mList.scheduleCode eq '5B'}">금요일 오후</c:when>
						</c:choose></td>
					<td>${mList.pickUpPlace}</td>
					<td>${mList.arrivePlace}</td>
					<td>${mList.status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 처리 부분 -->
	<div style="text-align: center">
		<c:if test="${prev}">
			<span>
				<a href="/matchingLogList?num=${startPageNum - 1}">
					<button class="btn btn-success" style="margin-top: 10px">이전</button>
				</a>
			</span>
		</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> 
			<c:if test="${select != num and select != null}">
					<a href="/matchingLogList?num=${num}"><button type="button" class="btn btn-light" style="margin-top: 10px">${num}</button></a>
				</c:if> <c:if test="${select == num}">
					<button type="button" class="btn btn-success" style="margin-top: 10px"><b>${num}</b></button>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${next}">
			<span>
				<a href="/matchingLogList?num=${endPageNum + 1}">
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