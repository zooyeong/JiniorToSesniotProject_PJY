<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<style>
	.container {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .inputForm {
        max-width: 400px;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
        background-color: #f5f5f5;
    }

    .inputForm label {
        font-weight: bold;
    }

    .inputForm input[type="text"],
    .inputForm textarea {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    .inputForm textarea {
        resize: vertical;
        height: 200px;
    }

    .inputForm input[type="submit"],
    .inputForm input[type="button"] {
        padding: 8px 16px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .inputForm input[type="submit"]:hover,
    .inputForm input[type="button"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
	<h1 style="text-align: center">문의하기</h1>
	 <form action="" method="post">
	 	<div class="container">
	 		<div class="inputForm">
			 	<label for="id">작성자</label><br>
		        <input type="text" id="id" name="id">
		        <br>
		        <label for="title">제목</label><br>
		        <input type="text" id="title" name="title"  style="width: 100%" placeholder="제목을 입력하세요">
		        <br><br>
		        
		        <label for="content">내용</label><br>
		        <textarea id="content" name="content" rows="30" cols="50" style="width: 100%" required placeholder="내용을 입력하세요"></textarea>
		        <br>
	        </div>
        </div>
        <div style="text-align: center">
	        <input type="submit" value="완료">
	        <input type="button" value="취소" onclick="location.href='/listPage'">
        </div>
    </form>
</body>
</html>