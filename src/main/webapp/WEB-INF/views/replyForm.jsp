<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REPLY FORM</title>
</head>
<body>
	<h1>답변하기</h1>
	<form action="/reply" method="post">
	 	<label for="id">작성자:</label>
        <input type="text" id="id" name="id">
        <input type="hidden" id="parentNo" name="parentNo" value="${parentNo}">
        
        <br>
        <label for="title">Title:</label>
        <input type="text" id="title" name="title">
        <br><br>
        
        <label for="content">Content:</label>
        <textarea id="content" name="content" rows="5" cols="50" required></textarea>
        <br><br>
        
        <button type="submit">완료</button>
        <button type="button" onclick="cancel()">취소</button>
        <input type="submit" value="Submit">
        <input type="button" value="Cancel" onclick="location.href='/listPage'">
    </form>
    <script>
    	function cancel(){
    		location.href="/listPage";
    	};
    	
    </script>
</body>
</html>