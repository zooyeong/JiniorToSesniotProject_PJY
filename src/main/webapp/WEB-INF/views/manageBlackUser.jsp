<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙회원관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>
.mngrpt {
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
	background: #D8E0A5;
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
	font-size: 20px;

}

th:nth-child(1),
th:nth-child(8){
	padding-left: 15px;
	padding-right: 10px;
}

th:nth-child(2),
th:nth-child(3){
	padding-left: 10px;
	padding-right: 10px;
}
th:nth-child(4),
th:nth-child(6),
th:nth-child(7){
	padding-left: 30px;
	padding-right: 30px;
}

th:nth-child(5){
	padding-left: 70px;
	padding-right: 70px;
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

td:last-child {
	padding-left: 15px;	
	padding-right: 20px;	
}
</style>

<%@ include file="header.jsp"%>

<%
if ( !(userId.equals("admin")) || userId == null) {
response.sendRedirect("main");
}
%> 

<div class="pd">
<div class="mngrpt">신고 처리</div>

<body>
	<table id="table">
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
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="list" items="${reportedList}">
				<tr>
					<td>${list.reportNum}</td>
					<td>${list.parentId}</td>
					<td>${list.seniorId}</td>
					<td>${list.name}</td>
					<td style="max-width: 200px; word-break: break-all;">${list.reportedReason}</td>
					<td>${list.reportDate}</td>
					<td><c:choose>
							<c:when
								test="${list.reportConfirmStatus eq 'N' && list.reportCount eq 3}">처리완료</c:when>
							<c:when test="${list.reportConfirmStatus eq 'N'}">접수상태</c:when>
							<c:when test="${list.reportConfirmStatus eq 'Y'}">처리완료</c:when>
							<c:when test="${list.reportConfirmStatus eq 'Rejected'}">신고반려</c:when>
						</c:choose></td>
					<td>${list.reportCount}
					<td><c:choose>
							<c:when
								test="${list.reportConfirmStatus eq 'N' && list.reportCount eq 3}">
								<input type="button" class="btn btn-secondary" value="경고" disabled />
							</c:when>
							<c:when test="${list.reportConfirmStatus eq 'N'}">
								<input type="button" class="btn btn-secondary" value="경고"
									onclick="warn('${list.reportCount}', '${list.seniorId}', '${list.reportNum}')" />
							</c:when>
						</c:choose></td>
					<td><c:choose>
							<c:when
								test="${list.reportConfirmStatus eq 'N' && list.reportCount eq 3}">
								<input type="button" class="btn btn-secondary" value="반려" disabled />
							</c:when>
							<c:when test="${list.reportConfirmStatus eq 'N'}">
								<input type="button" class="btn btn-secondary" value="반려"
									onclick="reject('${list.reportCount}', '${list.seniorId}', '${list.reportNum}')" />
							</c:when>
						</c:choose></td>
					<td><c:choose>
							<c:when
								test="${list.reportConfirmStatus eq 'N' && list.reportCount eq 3}">
								<input type="button" class="btn btn-dark" value="블랙회원 등록" disabled />
							</c:when>
							<c:when test="${list.reportConfirmStatus eq 'N'}">
								<input type="button" class="btn btn-dark" value="블랙회원 등록"
									onclick="setBlack('${list.reportCount}', '${list.seniorId}', '${list.reportNum}')" />
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<c:set var="blackUser" value="false"/>
	
	<c:forEach var="list" items="${reportedList}">
		<c:if test="${list.reportCount eq 3 && !blackUser}">
			<c:set var="blackUser" value="true"/>
			<br>
			<h3>[BLACK 회원] 해당 사용자는 서비스 이용이 불가한 상태입니다.</h3>
		</c:if>
	</c:forEach>
	<br>
	<button type="button" class="btn btn-secondary" onclick="location.href='reportedList'">전체 신고 내역 리스트 페이지로 돌아가기</button>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	function warn(cnt, seniorId, reportNum) {
		Swal.fire({
			title: "해당 사용자를 경고 처리하시겠습니까?",
			icon: "question",
			showCancelButton: true,
			confirmButtonColor: "#22741C",
			cancelButtonColor: "#CC3D3D",
			confirmButtonText: "경고 처리",
			cancelButtonText: "취소"
		}).then((result) => {
			if (result.isConfirmed) {
				if (Number(cnt) == 0 || Number(cnt) == 1) {
					location.href = 'reportedList?seniorId=' + seniorId + '&reportNum=' + reportNum;
				} else {
					Swal.fire({
						title: "최대 경고 횟수가 누적되어 처리할 수 없습니다. 블랙회원으로 등록해 주세요.",
						icon: "warning",
						confirmButtonText: "확인"
					});
				}
			}
		});
	}

	function reject(cnt, seniorId, reportNum) {
		Swal.fire({
			title: "신고를 반려 처리하시겠습니까?",
			icon: "question",
			showCancelButton: true,
			confirmButtonColor: "#22741C",
			cancelButtonColor: "#CC3D3D",
			confirmButtonText: "반려 처리",
			cancelButtonText: "취소"
		}).then((result) => {
			if (result.isConfirmed) {
				if (Number(cnt) < 3 ) {
					location.href = 'rejectReport?seniorId=' + seniorId + '&reportNum=' + reportNum;
				} else {
					Swal.fire({
						title: "최대 경고 횟수가 누적되어 처리할 수 없습니다. 블랙회원으로 등록해 주세요.",
						icon: "warning",
						confirmButtonText: "확인"
					});
				}
			}
		});
	}

	function setBlack(cnt, seniorId, reportNum) {
		Swal.fire({
			title: "해당 사용자를 블랙회원으로 등록하시겠습니까?",
			icon: "question",
			showCancelButton: true,
			confirmButtonColor: "#22741C",
			cancelButtonColor: "#CC3D3D",
			confirmButtonText: "등록",
			cancelButtonText: "취소"
		}).then((result) => {
			if (result.isConfirmed) {
				if (Number(cnt) >= 2) {
					location.href = 'registerBlackUser?seniorId=' + seniorId + '&reportNum=' + reportNum;
					Swal.fire({
						title: "블랙회원으로 등록이 완료되었습니다.",
						icon: "success",
						confirmButtonText: "확인"
					});
				} else if (Number(cnt) < 2) {
					Swal.fire({
						title: "블랙회원 등록은 누적 경고가 2회 이상일 때만 가능합니다.",
						icon: "error",
						confirmButtonText: "확인"
					});
				} else {
					Swal.fire({
						title: "이미 블랙회원으로 처리되었습니다.",
						icon: "warning",
						confirmButtonText: "확인"
					});
				}
			}
		});
	}
</script>

</body>
</div>
</html>