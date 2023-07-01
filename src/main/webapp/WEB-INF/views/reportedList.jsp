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
<div class="regSnrList">신고 목록</div>

<body>
	<table>
		<thead>
			<tr>
				<th>NO.</th>
				<th>신고자아이디</th>
				<th>시니어아이디</th>
				<th>이름</th>
				<th>신고사유</th>
				<th>신고일자</th>
				<th>신고처리상태</th>
				<th>경고누적횟수</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="list" items="${reportedList}">
				<tr>
					<td>${list.reportNum}</td>
					<td>${list.parentId}</td>
					<td><a href="reportedList?seniorId=${list.seniorId}">${list.seniorId}</a></td>
					<td>${list.name}</td>
					<td>${list.reportedReason}</td>
					<td>${list.reportDate}</td>
					<td><c:choose>
							<c:when test="${list.reportConfirmStatus eq 'N' && list.reportCount eq 3}">처리완료</c:when>
							<c:when test="${list.reportConfirmStatus eq 'N'}">접수상태</c:when>
							<c:when test="${list.reportConfirmStatus eq 'Y'}">처리완료</c:when>
							<c:when test="${list.reportConfirmStatus eq 'Rejected'}">신고반려</c:when>
						</c:choose></td>
					<td>${list.reportCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 처리 부분 -->
	<div style="text-align: center">
	<c:if test="${prev}">
		<span>
		<a href="/reportedList?num=${startPageNum - 1}">
			<button class="btn btn-success" style="margin-top: 10px">이전</button>
		</a>
		</span>
	</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> <c:if test="${select != num}">
					<a href="/reportedList?num=${num}"><button type="button" class="btn btn-light" style="margin-top: 10px">${num}</button></a>
				</c:if> <c:if test="${select == num}">
					<button type="button" class="btn btn-success" style="margin-top: 10px"><b>${num}</b></button>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${next}">
		<span>
			<a href="/reportedList?num=${endPageNum + 1}">
				<button class="btn btn-success" style="margin-top: 10px">다음</button>
			</a>
		</span>
	</c:if>
	</div>
	<!-- 페이징 처리 끝 부분 -->
	
		<button type="button" class="btn btn-secondary" onclick="location.href='admin'">관리자 페이지로 돌아가기</button>

</body>
</div>
</html>