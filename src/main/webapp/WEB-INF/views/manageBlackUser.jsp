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
.mngrpt {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.8rem;
	margin: 10px
}
.pd {
	align-items: center;
	padding: 10px 50px 10px 50px;
}
</style>

<div class="pd">
<div class="mngrpt">신고 처리</div>

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
					<td>${list.reportedReason}</td>
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