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
	<h1>시니어 등록 페이지</h1>

	<table>
		<thead>
			<tr>
				<th>신분증</th>
				<th>범죄이력</th>
				<th>시니어아이디</th>
				<th>인증여부</th>
				<th></th>
				<th></th>

			</tr>
		</thead>

		<tbody>
			<c:forEach var="vlist" items="${seniorVeriList}">
				<tr>
					<td><img
						src="${pageContext.request.contextPath}/image/Certification/${vlist.idcpicture}"
						width="150" height="200" onclick="window.open(this.src)"/></td>
					<td><img
						src="${pageContext.request.contextPath}/image/Certification/${vlist.cmnpicture}"
						width="150" height="200" onclick="window.open(this.src)"/></td>
					<td>${vlist.id}</td>
					<td>${vlist.verificationStatus}</td>

					<td><c:choose>
							<c:when test="${vlist.verificationStatus eq 'N'}">
								<input type="button" value="승인"
									onclick="authorize('${vlist.verificationStatus}', '${vlist.id}')" />
							</c:when>
							<c:when test="${vlist.verificationStatus eq 'Y'}">
								<input type="button" value="승인"
									onclick="authorize('${vlist.verificationStatus}', '${vlist.id}')"/>
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<button type="button" onclick="location.href='verifySenior'">전체 인증 제출 목록 페이지로 돌아가기</button>
	
	<script>
		function authorize(status, id) {
			if (status == 'N') {
				location.href = 'authorizeSenior?id=' + id;
			} else {
				alert('이미 승인 처리되었습니다.');
			}
		}
	</script>
	
</body>
</html>