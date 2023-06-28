<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>신고 목록</h1>

	<table>
		<thead>
			<tr>
				<th>신고번호</th>
				<th>신고자아이디</th>
				<th>시니어아이디</th>
				<th>시니어이름</th>
				<th>신고사유</th>
				<th>신고일자</th>
				<th>신고처리상태</th>
				<th>누적신고횟수</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="list" items="${reportedList}">
				<tr>
					<td>${list.reportNum}</td>
					<td>${list.parentId}</td>
					<td><p class="seniorId" id="${list.seniorId}">${list.seniorId}</p></td>
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
	
		<button type="button" onclick="location.href='admin'">관리자 페이지로 돌아가기</button>

	<script src="https://code.jquery.com/jquery-3.7.0.js"
		integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
		crossorigin="anonymous">
		
	</script>


	<script>
		$(function() {

			$(".seniorId").click(function() {

				const seniorId = $(this).attr("id");
				location.href = 'reportedList?seniorId=' + seniorId;

			});
		});
	</script>


</body>
</html>