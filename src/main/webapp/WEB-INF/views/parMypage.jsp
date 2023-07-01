<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type="checkbox"]{
	width: 1px;
	height: 1px;
	overflow: hidden;
/*  	visibility: hidden; */
}
/*체크를 안 했을 때*/

.label::before{
	display: inline-block;
    content:"";
    width: 100px;
    height: 100px;
    margin: 5px;
    background-color: lightgray;
}

/*체크했을 때*/
input:checked + .label::before{
	background-color: yellow;
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
	* {
		text-align: center;
		}
</style>
</head>
<body>
	<h1>부모 마이페이지 진입</h1>
	
	<form action="" method="post" enctype="multipart/form-data">	
		<label>자녀사진</label><br>
		<label for="image">     
                <img class="profileimage" id="preview" src="${pageContext.request.contextPath}/image/profile/${parentsImg.fileName}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/image/profile/noprofile1.png?v=1';">
        </label>
        <br>
		<span>${parentsDetail.name} 님</span>
        <input type="file" name="file" id="image" style="display: none;" onchange="readURL(this)" >
        <br>
        <input type="hidden" value="<%= session.getAttribute("userId") %>" name="id"><br>
		
		<p>비밀번호 <button type="button" onclick="location.href='/changePassword'">수정</button></p><br>
		
		<label>전화번호</label><br>
		<input type="text" name="phoneNumber" value="${parentsDetail.phoneNumber}" disabled><br>
		
		<label>주소</label><br>
		<input type="text" name="adress" value="${parentsDetail.adress}"><br>
		
		<label>이메일주소</label><br>
		<input type="email" name="email" value="${parentsDetail.email}"><br>

		<label>자녀소개</label>
		<br>
		<p>${parentsDetail.CName}님
		<c:if test="${parentsDetail.CGender eq 'F'}">
			<span>여아</span>
		</c:if>
		<c:if test="${parentsDetail.CGender eq 'M'}">
			<span>남여</span>
		</c:if>
		<span>${2023 - fn:substring(parentsDetail.CAge, 0, 4)}세</span><br>
		<br>
		<textarea cols="50" rows="10" name="personality">${parentsDetail.personality}</textarea><br>
	</p>	
		
		<label>기타사항</label><br>
		<textarea cols="50" rows="10" name="etc">${parentsDetail.etc}</textarea><br>
	 <br><br><br>
	
		<button type="reset">되돌리기</button>
		<button type="submit">수정하기</button>
		
	</form>

	

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