<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신고하기</title>
</head>
<body>
    <h1>신고하기</h1>
    <form action="/report/declaration" method="post">
        <input type="hidden" name="parentId" value="${parentId}">
        <label for="reportedUserId">신고 대상 ID </label><br>
        <input type="text" name="seniorId" value="${seniorId}" readonly="readonly"><br><br><br><br>
         <label for="reportedUserName">신고 대상 이름 </label><br>
        <input type="text" name="name" value="${name}" readonly="readonly"><br><br><br><br>
        <label for="reportedReason">신고 사유</label><br>
        <textarea name="reportedReason" id="reportedReason" cols="50" rows="20" required></textarea><br>
        <button type="submit">신고</button>
    </form>
    
</body>
</html>
