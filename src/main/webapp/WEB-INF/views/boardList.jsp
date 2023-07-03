<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.pd {
	align-items: center;
	padding: 110px 50px 110px 50px;
}
h1 {
	font-family: 'omyu_pretty';
	font-size: 60px;
}
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'omyu_pretty';
}
#tableContainer {
	width: 100%;
}
#table {
	width:100%;
	border-collapse: separate;
	border-spacing: 0;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	margin: 0 auto;
	font-size: 20px;
}
#table tr th {
	background: #198754;
	color: #fff;
	text-align: center;
	height: 50px;
	width: 15px;
	font-size: 20px;
	color: white;
}
.btn {
	margin-top: 15px;
}
.emphasis {
	text-emphasis: sesame #198754;
	-webkt-text-emphasis: sesame #198754; 
}
.title {
	color: #198754;
}

</style>
</head>
<body>
<%@ include file="header.jsp"  %>
<div class="pd">
	<h1 style="text-align: center"><span class="emphasis">문의게시판 </span>목록</h1>
	<div id="tableContainer">
		<div >
			<c:if test="${sessionScope.userId != 'admin' }">
				<button type="button" class="btn btn-secondary" style="margin-bottom: 10px;" onclick="location.href='/addNewArticle'">문의하기</button>
			</c:if>
		</div>
		
		<table id="table">
			<tr>
				<th class="table-secondary" style="width: 10%">NO</th>
				<th class="table-secondary" style="width: 35%">제목</th>
				<th class="table-secondary" style="width: 15%">작성자</th>
				<th class="table-secondary" style="width: 30%">작성일</th>
				<th class="table-secondary" style="width: 10%">조회수</th>
			</tr>
			<c:forEach var="item" items="${articleList}">
				<tr>
					<td>${item.articleNo}</td>
					<td style="text-align: left">
						<c:if test="${item.parentNo > 0}">
							&nbsp;&nbsp;&nbsp; RE: 
						</c:if>
						<a href="/viewArticle?articleNo=${item.articleNo}"><span class="title">${item.title}</span></a></td>
					<td>${item.id}</td>
					<td>${item.createdAt}</td>
					<td>${item.views}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div	 class="pageNum" style="text-align: center;">
	<c:if test="${prev}">
		<span><a href="/boardList?num=${startPageNum - 1}">
			<button class="btn btn-primary">이전</button>
		</a>
		</span>
	</c:if>
	
	<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
		<span> <c:if test="${select != num}">
				<a href="/boardList?num=${num}"><button type="button" class="btn btn-light">${num}</button></a>
			</c:if> <c:if test="${select == num}">
				<button type="button" class="btn btn-success"><b>${num}</b></button>
			</c:if>

		</span>
	</c:forEach>

	<c:if test="${next}">
		<span><a href="/boardList?num=${endPageNum + 1}">
				<button class="btn btn-ligth">다음</button>
			</a>
		</span>
	</c:if>
	</div>
</div>	
</body>
</html>