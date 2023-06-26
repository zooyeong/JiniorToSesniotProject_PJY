<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Main Page</title>
</head>
<body>
    <h1>Welcome, ${userId}!</h1>
    <p>메인 페이지입니다.</p>
    <form action="/redirectToUpload" method="get">
        <button type="submit">마이 페이지</button>
    </form>
   
</body>
</html>