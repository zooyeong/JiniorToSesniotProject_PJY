<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내용 보기</title>
</head>
<body>
	<h1>view article page</h1>
	
	<div class="container">
		글번호<div class="article-no">${article.articleNo}</div>
	    <div class="author">${article.id}</div>
	    <div class="title">${article.title}</div>
	    <div class="date">${article.createdAt}</div>
	    <div class="content">${article.content}</div>
	    <div class="views">${article.views}</div>
	</div>
	
	<div>
		<a href="/listPage">리스트</a>		
		<a href="/modifyArticle?articleNo=${article.articleNo}">게시물 수정</a>		
		<a href="/deleteArticle?articleNo=${article.articleNo}">게시물 삭제</a>		
		<a href="/reply?parentNo=${article.articleNo}">답변하기</a>		
	</div>
	
</body>
</html>