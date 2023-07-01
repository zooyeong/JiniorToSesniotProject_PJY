<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>

<style>
.admin {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.8rem;
	margin: 10px;
}

.pd {
	align-items: center;
	padding: 10px 100px 10px 100px;
}
</style>

<div class="pd">
<div class="admin">관리자 페이지</div>

<body>
	<div class="row row-cols-1 row-cols-md-3 g-4">
		<div class="col">
			<div class="card">
				<button class="btn btn-success"
					onclick="location.href ='verifySenior'">시니어 등록 관리</button>
				<div class="card-body">
					<p class="card-text">
						<br>시니어 사용자가 제출한 신분증 사본과 범죄 이력 조회 캡처본을 확인하고, 승인 또는 거절 처리를 하여
						서비스 접근 권한을 부여하거나 제한합니다.<br>
						<br>
					</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<button class="btn btn-success"
					onclick="location.href ='reportedList'">신고 관리</button>
				<div class="card-body">
					<p class="card-text">
						<br>부모 사용자가 신고한 내역을 확인하고, 신고 사유를 파악하여 '신고 반려' 처리를 하거나 해당 시니어
						사용자 '경고' 처리를 할 수 있습니다. 2회 이상 경고가 누적된 경우에는 '블랙 회원 등록' 기능로 서비스 접근
						권한을 제한합니다. <br>
						<br>
					</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<button class="btn btn-success"
					onclick="location.href ='matchingLogList'">매칭 / 동행 이력 조회</button>
				<div class="card-body">
					<p class="card-text">
						<br>전체 사용자의 매칭 이력 및 동행 여부를 조회할 수 있습니다.<br>
						<br>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>