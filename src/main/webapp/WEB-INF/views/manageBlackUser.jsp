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
	<h1>신고 처리</h1>

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
								<input type="button" value="경고" disabled />
							</c:when>
							<c:when test="${list.reportConfirmStatus eq 'N'}">
								<input type="button" value="경고"
									onclick="warn('${list.reportCount}', '${list.seniorId}', '${list.reportNum}')" />
							</c:when>
						</c:choose></td>
					<td><c:choose>
							<c:when
								test="${list.reportConfirmStatus eq 'N' && list.reportCount eq 3}">
								<input type="button" value="반려" disabled />
							</c:when>
							<c:when test="${list.reportConfirmStatus eq 'N'}">
								<input type="button" value="반려"
									onclick="reject('${list.reportCount}', '${list.seniorId}', '${list.reportNum}')" />
							</c:when>
						</c:choose></td>
					<td><c:choose>
							<c:when
								test="${list.reportConfirmStatus eq 'N' && list.reportCount eq 3}">
								<input type="button" value="블랙회원 등록" disabled />
							</c:when>
							<c:when test="${list.reportConfirmStatus eq 'N'}">
								<input type="button" value="블랙회원 등록"
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
			<h2>[BLACK 회원] 해당 사용자는 서비스 이용이 불가한 상태입니다.</h2>
		</c:if>
	</c:forEach>
	
	<button type="button" onclick="location.href='reportedList'">전체 신고 내역 리스트 페이지로 돌아가기</button>

	<script>
		function warn(cnt, seniorId, reportNum) {
			if (Number(cnt) == 0 || Number(cnt) == 1) {
				location.href = 'reportedList?seniorId=' + seniorId
						+ '&reportNum=' + reportNum;
			} else {
				alert('최대 경고 횟수가 누적되어 처리할 수 없습니다. 블랙회원으로 등록해 주세요.');
			}
		}

		function reject(cnt, seniorId, reportNum) {
			if (Number(cnt) < 3 ) {
				location.href = 'rejectReport?seniorId=' + seniorId
						+ '&reportNum=' + reportNum;
			} else {
				alert('최대 경고 횟수가 누적되어 처리할 수 없습니다. 블랙회원으로 등록해 주세요.');
			}
		}

		function setBlack(cnt, seniorId, reportNum) {
			if (Number(cnt) >= 2) {
				location.href = 'registerBlackUser?seniorId=' + seniorId
						+ '&reportNum=' + reportNum;
				alert('블랙회원으로 등록이 완료되었습니다.')
			} else if (Number(cnt) < 2) {
				alert('블랙회원 등록은 누적 경고가 2회 이상일 때만 가능합니다.');
			} else {
				alert('이미 블랙회원으로 처리되었습니다.');
			}
		}
	</script>

</body>
</html>