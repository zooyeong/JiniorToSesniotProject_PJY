<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.12/sweetalert2.all.js" integrity="sha512-7TfWz/1TEVLE2pG8KLC/suq4qgXocI+/sNKfX0yifGXBbSKPoA9wcQ2GDublV7SSCu90vnW1q7+TUXOYaCIshA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/38.1.0/classic/ckeditor.js"></script>
<style>
	@font-face {
		    font-family: 'omyu_pretty';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
	h1 {
		font-family: 'omyu_pretty';
		font-size: 60px;
	}
	#container {
		width: 100%;
		display: flex;
		justify-content: center;
	}
	.ck.ck-editor {
    	max-width: 100%;
	}
	.ck-editor__editable {
	    min-height: 500px;
	}
	.btnGroup {
		margin-top: 10px;
		text-align: center;
	}
	#id {
		border: 0 solid black;
	}
	.emphasis {
		text-emphasis: sesame #198754;
		-webkt-text-emphasis: sesame #198754; 
	}
	.label {
		font-family: 'omyu_pretty';
		font-size: 20px;
		color: #198754;
	}
</style>
</head>
<body>
	
	<h1 style="text-align: center"><span class="emphasis">문의글 수정</span>하기</h1>
	<div id="container">
		<form action="" method="post" id="modifyForm">
			<label for="id" class="label">작성자</label><br>
			<input type="text" id="id" name="id" value="${sessionScope.userId}" readonly="readonly"><br><br>
			
			<label for="title" class="label">제목</label><br>
			<input type="text" id="title" name="title" style="width: 100%" value="${article.title}"><br><br>
			
			<label for="content" class="label">내용</label><br>
			<textarea id="content" name="content">${article.content}</textarea>
			<div class="btnGroup">
				<input type="button" class="btn btn-secondary" value="취소" onclick="location.href='/viewArticle?articleNo=${article.articleNo}'">
				<input type="button" id="modify" class="btn btn-success" value="완료">
			</div>
		</form>
	</div>
	<script type="text/javascript">
		ClassicEditor
		    .create( document.querySelector( '#content' ))
		    .catch( error => {
		        console.error( error );
		    } );
		
		$('#modify').click(function() {
			let title = $('#title').val();
	        let content = ' ';
	        
	        if (title.trim() === '') {
	        	Swal.fire({
	   			 title: '제목을 작성해주세요.',
	   			    text: '제목이 비어있습니다..',
	   			    icon: 'warning',
	   			    confirmButtonText: '확인',
	   			    });
	        } else {
	        
		        Swal.fire({
		            title: '게시글을 수정하시겠습니까?',
		            text: '게시글 수정이 완료됩니다.',
		            icon: 'question',
		            
		            showCancelButton: true,
		            confirmButtonText: '확인',
		            cancelButtonText: '취소',
		            reverseButtons: true,
		            
		        }).then(result => {
		            if (result.isConfirmed) {
		                $('#modifyForm').submit();
		            }
		        });
	        }
	    });
	</script>
	
	<!-- 수정하기 전 코드 -->
	<!-- <script>
		$('#modify').click(function() {
	        Swal.fire({
	            title: '수정하시겠습니까?',
	            text: '게시글 수정을 완료합니다.',
	            icon: 'question',
	            
	            showCancelButton: true,
	            confirmButtonText: '확인',
	            cancelButtonText: '취소',
			    reverseButtons: true,
	        }).then(result => {
	            if (result.isConfirmed) {
	                $('#modifyForm').submit();
	            }
	        });
	    });
	</script> -->
</body>
</html>