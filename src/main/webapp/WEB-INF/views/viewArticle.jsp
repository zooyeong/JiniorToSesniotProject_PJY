<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내용 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.12/sweetalert2.all.js" integrity="sha512-7TfWz/1TEVLE2pG8KLC/suq4qgXocI+/sNKfX0yifGXBbSKPoA9wcQ2GDublV7SSCu90vnW1q7+TUXOYaCIshA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
	.btnGroup {
		text-align: right;
		margin-right: 190px;
		margin-top: 10px;
	}
</style>
</head>
<body>
	<h1 style="text-align: center">상세보기 페이지</h1>
	<div class="container">
		<table class="table table-bordered" style="width: 80%; margin: auto; text-align: center">
			<tr>
				<th>작성자</th>
				<td>${article.id}</td>
				<th>작성일</th>
				<td>${article.createdAt}</td>
				<th colspan="2">조회수</th>
				<td>${article.views}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="6" style="text-align: left;">${article.title}</td>
			</tr>
			<tr style="height: 400px">
							<th style="vertical-align: middle">내용</th>
				<td colspan="6" style="text-align: left;">${article.content}</td>
			</tr>
		</table>
	</div>
	<div class="btnGroup">
		<button type="button" class="btn btn-secondary" onclick="location.href='/boardList'">리스트</button>
		<c:if test="${sessionScope.userId == article.id}">
			<button type="button" class="btn btn-secondary" onclick="location.href='/modifyArticle?articleNo=${article.articleNo}'">수정</button>
			<%-- <button type="button" class="btn btn-secondary" onclick="location.href='/deleteArticle?articleNo=${article.articleNo}'">삭제</button> --%>
			<button type="button" class="btn btn-secondary" onclick="doDelete()">삭제</button>
		</c:if>
		<c:if test="${sessionScope.userId == 'admin' && article.parentNo == 0}">
			<button type="button" class="btn btn-secondary" onclick="location.href='/reply?parentNo=${article.articleNo}'">답변하기</button>
		</c:if>
	</div>
	<script>
	function doModify() {
		Swal.fire({
			 title: '게시글을 수정하시겠습니까?',
			    text: '수정을 완료합니다.',
			    icon: 'question',
			    
			    showCancelButton: true,
			    confirmButtonText: '확인',
			    cancelButtonText: '취소',
			    reverseButton: true,
			    }).then(result => {
			    	if(result.isConfirmed) {
			    		location.href='/deleteArticle?articleNo=${article.articleNo}';
			    	}
			    });
		}
		function doDelete() {
			Swal.fire({
				 title: '게시글을 삭제하시겠습니까?',
				    text: '삭제하면 되돌릴 수 없습니다.',
				    icon: 'warning',
				    
				    showCancelButton: true,
				    confirmButtonText: '확인',
				    cancelButtonText: '취소',
				    reverseButtons: true,
				    }).then(result => {
				    	if(result.isConfirmed) {
				    		Swal.fire({
				    			title: '삭제가 완료되었습니다.',
				    			text: '목록으로 돌아갑니다.',
				    			icon: 'success'
				    		}).then(result => {
				    			if(result.isConfirmed) {
				    				location.href='/deleteArticle?articleNo=${article.articleNo}';
				    			}
				    		})
				    		
				    	}
				    });
			}
	</script>
</body>
</html>