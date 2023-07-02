<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/table.css" rel="stylesheet" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<style>
.regSnr {
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
	font-size: 20px;
	padding-left: 30px;
	
}

tr th {
	padding-left: 30px;
	padding-right: 30px;
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

<div class="pd">
<div class="regSnr">시니어 등록 페이지</div>

<body>
	<table id="table">
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
						width="150" height="200" onclick="window.open(this.src)" /></td>
					<td><img
						src="${pageContext.request.contextPath}/image/Certification/${vlist.cmnpicture}"
						width="150" height="200" onclick="window.open(this.src)" /></td>
					<td>${vlist.id}</td>
					<td><c:choose>
							<c:when test="${vlist.verificationStatus eq 'N'}">미인증</c:when>
							<c:when test="${vlist.verificationStatus eq 'Y'}">인증</c:when>
							<c:when test="${vlist.verificationStatus eq 'Rejected'}">인증거절</c:when>
						</c:choose></td>

					<td><c:choose>
							<c:when
								test="${vlist.verificationStatus eq 'N' or vlist.verificationStatus eq 'Rejected'}">
								<input type="button" class="btn btn-success" value="승인"
									onclick="authorize('${vlist.verificationStatus}', '${vlist.id}')" />
							</c:when>
							<c:when
								test="${vlist.verificationStatus eq 'Y' or vlist.verificationStatus eq 'Rejected'}">
								<input type="button" class="btn btn-success" value="승인"
									onclick="authorize('${vlist.verificationStatus}', '${vlist.id}')" />
							</c:when>
						</c:choose></td>

					<td><c:choose>
							<c:when
								test="${vlist.verificationStatus eq 'N' or vlist.verificationStatus eq 'Y'}">
								<input type="button" class="btn btn-secondary" value="거절"
									onclick="reject('${vlist.verificationStatus}', '${vlist.id}')" />
							</c:when>
							<c:when
								test="${vlist.verificationStatus eq 'Rejected' or vlist.verificationStatus eq 'Y'}">
								<input type="button" class="btn btn-secondary" value="거절"
									onclick="reject('${vlist.verificationStatus}', '${vlist.id}')" />
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>

	<button type="button" class="btn btn-secondary"
		onclick="location.href='verifySenior'">전체 인증 제출 목록으로 돌아가기</button>
		
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
	function authorize(status, id) {
		Swal.fire({
			title: "승인 처리하시겠습니까?",
			icon: "question",
			showCancelButton: true,
			confirmButtonColor: "#22741C",
			cancelButtonColor: "#CC3D3D",
			confirmButtonText: "승인",
			cancelButtonText: "취소"
		}).then((result) => {
			if (result.isConfirmed) {
				if (status == 'N') {
					Swal.fire({
						title: "해당 사용자를 인증 시니어로 등록했습니다.",
						icon: "success",
						confirmButtonText: "확인",
					}).then(() => {
						location.href = 'authorizeSenior?id=' + id;
					});
				} else if (status == 'Y') {
					Swal.fire({
						text: "이미 승인 처리되었습니다.",
						icon: "warning",
						confirmButtonText: "확인",
					});
				} else {
					Swal.fire({
						text: "이미 승인 거절 처리되었습니다.",
						icon: "warning",
						confirmButtonText: "확인",
					});
				}
			}
		});
	}

	function reject(status, id) {
		Swal.fire({
			title: "승인 거절 처리하시겠습니까?",
			icon: "question",
			showCancelButton: true,
			confirmButtonColor: "#22741C",
			cancelButtonColor: "#CC3D3D",
			confirmButtonText: "거절",
			cancelButtonText: "취소"
		}).then((result) => {
			if (result.isConfirmed) {
				if (status == 'N') {
					Swal.fire({
						title: "해당 사용자의 인증을 거절 처리했습니다.",
						icon: "success",
						confirmButtonText: "확인",
					}).then(() => {
						location.href = 'rejectAuthorization?id=' + id;
					});
				} else if (status == 'Rejected'){
					Swal.fire({
						text: "이미 승인 거절 처리되었습니다.",
						icon: "warning",
						confirmButtonText: "확인",
					});
				} else {
					Swal.fire({
						text: "이미 승인 처리되었습니다.",
						icon: "warning",
						confirmButtonText: "확인",
					});				
				}
			}
		});
	}
</script>
</body>
</div>
</html>