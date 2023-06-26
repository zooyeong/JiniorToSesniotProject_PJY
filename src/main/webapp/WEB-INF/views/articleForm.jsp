<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
</head>
<body>
	<h1>글을 작성해보자</h1>
	 <form action="" method="post">
	 	<label for="id">작성자:</label>
        <input type="text" id="id" name="id">
        <br>
        <label for="title">Title:</label>
        <input type="text" id="title" name="title">
        <br><br>
        
        <label for="content">Content:</label>
        <textarea id="content" name="content" rows="5" cols="50" required></textarea>
        <br><br>
        
        <input type="submit" value="Submit">
        <input type="button" value="Cancel" onclick="location.href='/articleList'">
    </form>
</body>
</html>