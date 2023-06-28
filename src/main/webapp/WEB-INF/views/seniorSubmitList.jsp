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
	<h1>시니어 인증파일 제출 리스트</h1>

	<table>
		<thead>
			<tr>
				<th>신분증</th>
				<th>범죄이력</th>
				<th>시니어아이디</th>
				<th>인증여부</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="vlist" items="${seniorVeriList}">
				<tr>
					<td><img src="${pageContext.request.contextPath}/image/Certification/${vlist.idcpicture}" width="150" height="200"/></td>
					<td><img src="${pageContext.request.contextPath}/image/Certification/${vlist.cmnpicture}" width="150" height="200"/></td>
					<td><p class="seniorId" id="${vlist.id}">${vlist.id}</p></td>
					<td>${vlist.verificationStatus}</td>
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
				location.href = 'verifySenior?id=' + seniorId;

			});
		});
	</script>

</body>
</html>