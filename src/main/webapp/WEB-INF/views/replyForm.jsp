<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REPLY FORM</title>
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
	    min-height: 300px;
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
<h1 style="text-align: center"><span class="emphasis">답변하기</span></h1>
	<div id="container">
		<form action="" method="post" id="replyForm">
			<label for="id" class="label">작성자</label><br>
			<input type="text" id="id" name="id" value="${sessionScope.userId}" readonly="readonly"><br><br>
			
			<label for="title" class="label">제목</label><br>
			<input type="text" id="title" name="title" style="width: 100%" placeholder="제목을 입력하세요"><br><br>
			
			<label for="content" class="label">내용</label><br>
			<textarea id="content" name="content"></textarea>
			<div class="btnGroup">
				<input type="button" class="btn btn-secondary" value="취소" onclick="location.href='/boardList'">
<!-- 				<input type="submit" class="btn btn-success" value="완료"> -->
				<input type="button" id="complete" class="btn btn-success" value="완료">
			</div>
		</form>
	</div>
	<script>
		ClassicEditor
		    .create( document.querySelector( '#content' ))
		    .catch( error => {
		        console.error( error );
		    } );
	</script>
	<script>
		$('#complete').click(function() {
			let title = $('#title').val();
	        let content = ' ';
	        if (title.trim() === '') {
	        /* if (title.trim() === '' || content.trim() === '') { */
	        	Swal.fire({
	   			 title: '제목을 작성해주세요.',
	   			    text: '제목이 비어있습니다..',
	   			    icon: 'warning',
	   			    confirmButtonText: '확인',
	   			    });
	        } else {
	        	Swal.fire({
					title: '답변글을 작성하시겠습니까?',
	   			    text: '답변글 작성이 완료 됩니다.',
	   			    icon: 'question',
	   			    
	   			 	showCancelButton: true,
	   			    confirmButtonText: '확인',
	   			 	cancelButtonText: '취소',
	   			 	reverseButtons: true,
		        	 }).then(result => {
					    	if(result.isConfirmed) {
					    		$('#replyForm').submit();
					    	}
					    });
	        }
		});
	</script>
	<!-- 
	<h1 style="text-align: center;">답변하기</h1>
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
        <input type="button" value="Cancel" onclick="location.href='/boardList'">
    </form>
    <script>
    	function cancel(){
    		location.href="/boardList";
    	};
    	
    </script>
     -->
</body>
</html>