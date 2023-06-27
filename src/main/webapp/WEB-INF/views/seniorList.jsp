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
	<h1>senior List</h1>

	<c:forEach var="list" items="${userList}" >
		<p class="singleInfo" id="${list.id}">${list.id}, ${list.password}, ${list.name}, 
		${list.phoneNumber}, ${list.adress}, ${list.gender}, 
		${list.email}, ${list.userCode}, ${list.regDate} </p>
	</c:forEach>
</body>

<script src="https://code.jquery.com/jquery-3.7.0.js" 
		integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
		crossorigin="anonymous">
</script>

<script>
$(function() {

	$(".singleInfo").click(function() {

		const temp_link = $(this).attr("id");
		location.href = 'singleInfo?id=' + temp_link;

	});
});
</script>

</html>