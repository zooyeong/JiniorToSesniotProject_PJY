<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<body>
	<h1>글을 수정해보자</h1>
	 <form action="" method="post">
	 	<label for="id">작성자:</label>
        <input type="text" id="id" name="id" value="${article.id}">
        <br>
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="${article.title}">
        <br><br>
        
        <label for="content">Content:</label>
        <textarea id="content" name="content" rows="5" cols="50" required>${article.content}</textarea>
        <br><br>
        
        <button type="submit">완료</button>
        <input type="button" value="Cancel" onclick="location.href='/articleList'">
    </form>
</body>
</html>