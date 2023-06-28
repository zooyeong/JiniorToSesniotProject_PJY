<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내용 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<h1 style="text-align: center">상세보기 페이지</h1>
	<div class="container">
		<table class="table table-bordered" style="width: 80%; margin: auto; text-align: center">
			<tr>
				<th>제목</th>
				<td>${article.title}</td>
				<th>작성자</th>
				<td>${article.id}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${article.createdAt}</td>
				<th>조회수</th>
				<td>${article.views}</td>
			</tr>
			<tr style="height: 200px">
				<th style="vertical-align: middle">내용</th>
				<td colspan="3" style="text-align: left;">${article.content}</td>
			</tr>
		</table>
	</div>
	<div>
		<button type="button" onclick="location.href='/listPage'">리스트</button>
		<a href="/listPage">리스트</a>		
		<a href="/modifyArticle?articleNo=${article.articleNo}">게시물 수정</a>		
		<a href="/deleteArticle?articleNo=${article.articleNo}">게시물 삭제</a>		
		<a href="/reply?parentNo=${article.articleNo}">답변하기</a>		
	</div>
	
</body>
</html>
