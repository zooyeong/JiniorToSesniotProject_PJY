<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<h1 style="text-align: center">문의 게시판</h1>
	<table class="table">
		<tr>
			<th class="table-primary">글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="item" items="${articleList}">
			<tr>
				<td>${item.articleNo}</td>
				<td><a href="/viewArticle?articleNo=${item.articleNo}">${item.title}</a></td>
				<td>${item.id}</td>
				<td>${item.createdAt}</td>
				<td>${item.views}</td>
			</tr>
		</c:forEach>
	</table>
	<div style="text-align: center">
	<c:if test="${prev}">
		<span>[ <a href="/listPage?num=${startPageNum - 1}">이전</a>
			]
		</span>
	</c:if>

		<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
			<span> <c:if test="${select != num}">
					<a href="/listPage?num=${num}">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${next}">
		<span>[ <a href="/listPage?num=${endPageNum + 1}">다음</a>
			]
		</span>
	</c:if>
	</div>
	<%-- <div style="text-align: center">
		 <c:forEach begin="1" end="${pageNum}" var="num">
		    <span>
		     <a href="/listPage?num=${num}">${num}</a>
		  </span>
		 </c:forEach>
	</div> --%>

	<button type="button" onclick="location.href='/addNewArticle'">글쓰기</button>
</body>
</html>