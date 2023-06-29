<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	text-align: center;
}
.mailDiv{
	border: 1px solid black;
	border-radius: 8px;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<h1>알림 메일함</h1>
	<c:forEach var="item" items="${mail}">
		<form action="" method="post">
			<div class="mailDiv">
				<p>보낸사람 : ${item.sendId}님</p>
				<p>보낸시간 : ${item.sendTime}</p>
				<p>내용 : ${item.content}</p>
				<input type="hidden" name="no" value="${item.no}">
				<input type="hidden" name="revId" value="${item.sendId}">
				<input type="hidden" name="sendId" value="${item.revId}">
				<input type="hidden" name="matchingNumber" value="${item.matchingNumber}">
				<button type="submit" onclick="javascript: form.action='/acceptMail';">수락</button>
				<button type="submit" onclick="javascript: form.action='/refuseMail';">거절</button>
			</div>
		</form>
	</c:forEach>
	<c:if test="${empty mail}">
		<p>새로운 알림이 없습니다.</p>
	</c:if>
</body>
</html>