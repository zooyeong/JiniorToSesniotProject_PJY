<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>업로드 폼</title>
</head>
<style>
	* {
		text-align: center;
		box-sizing: border-box;
	}
	
	.snrid {
		border-radius: 12px;
	}
	#preview {
		position:relative;
		width: 450px;
		height: 450px;
		border: 2px solid black;
		border-radius: 12px;
		margin-top: 20px;
		cursor: pointer;
	}
	
	.certification{
 	 border: 0;
 	 outline: none;
 	 font-size: 20px;
 	 margin-top: 30px;
 	 background: black;
 	 color: white;
 	 padding: 10px;
 	 cursor: pointer;
 	 border-radius: 10px;
}
	.certification:hover {
  color: white;
  background: orange;
}
	
	

	
</style>
<body>

    <h1>마이 페이지</h1>
	
    <!-- 추가: 결과 메시지 표시 -->
    <c:if test="${not empty message}">
        <div>${message}</div>
    </c:if>
    <div class="snrid"><%= session.getAttribute("userId") %>님</div>
    
    <form method="post" action="/upload" enctype="multipart/form-data">
        <label for="image">     
                <img class="profileimage" id="preview" src="${pageContext.request.contextPath}/image/profile/${uploadedImageFileName}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/image/profile/noprofile1.png';">
        </label>
        <input type="file" name="file" id="image" style="display: none;" onchange="readURL(this)" required>
        <br><button class="certification" type="submit">프로필 사진 변경</button>
        <input type="hidden" value="<%= session.getAttribute("userId") %>" name="id">
    </form>
    <div>
     <form action="/certification/certification" method="get" >
        <button class="certification" type="submit">추가 인증하기</button>
    </form>
     </div>
     
     <div>
        <form action="/declaration" method="get">
            <button class="certification" type="submit">신고하기</button>
        </form>
    </div>
    <script>
        let image = document.getElementById('image');
        let preview = document.getElementById('preview');

        function readURL(image) {
            if (image.files && image.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                };
                reader.readAsDataURL(image.files[0]);
            } else {
                preview.src = "";
            }
        }
        
        // Open file selection dialog when the image is clicked
        preview.onclick = function() {
            image.value = null; // Reset the selected file
        };
    </script>

</body>
</html>