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
	<h1>시니어 마이페이지 진입</h1>
	
	<form action="" method="post" enctype="multipart/form-data">	
		<p>${seniorDetail.name}님 만${2023 - fn:substring(seniorDetail.birthday, 0, 4)}세</p>
		<label>프로필사진</label><br>
		<label for="image">     
                <img class="profileimage" id="preview" src="${pageContext.request.contextPath}/image/profile/${seniorImg.fileName}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/image/profile/noprofile1.png?v=1';">
        </label>
        <input type="file" name="file" id="image" style="display: none;" onchange="readURL(this)">
        <br>
        <input type="hidden" value="<%= session.getAttribute("userId") %>" name="id"><br>
		
		<label>기존 비밀번호</label><br>
		<input type="password" name="password"><br>
		
		<label>변경할 비밀번호</label><br>
		<input type="password" name="password"><br>
		
		<label>비밀번호 재확인</label><br>
		<input type="password"><br>
		
		<label>전화번호</label><br>
		<input type="text" name="phoneNumber" value="${seniorDetail.phoneNumber}"><br>
		
		<label>주소</label><br>
		<input type="text" name="adress" value="${seniorDetail.adress}"><br>
		
		<label>이메일주소</label><br>
		<input type="email" name="email" value="${seniorDetail.email}"><br>

		<label>자기소개</label><br>
		<textarea cols="50" rows="10" name="info">${seniorDetail.info}</textarea><br>

		<label>희망지역</label><br>
		<input type="text" name="area" value="${seniorDetail.area}"><br>

		
		<p>스케줄 : </p>
		<c:forEach var="item" items="${seniorEnableSchedule}">
	
			<c:set var="code" value="${item.scheduleCode}"/>
			<c:set var="status" value="${item.status}"/>
			<c:set var="workStatus" value="${item.workStatus}"/>
	
			<input type="hidden" name="scheduleCode" value="${item.scheduleCode}">
			<input type="hidden" name="status" value="${item.status}">
			<input type="hidden" name="workStatus" value="N"
			<c:if test="${fn:contains(workStatus, 'Y')}">disabled</c:if>>
			<input type="checkbox" onclick="toggle()" id="${item.scheduleCode}" name="workStatus" value="Y" 
			<c:if test="${fn:contains(workStatus, 'Y')}">checked</c:if>
			<c:if test="${fn:contains(status, 'Y') && fn:contains(workStatus, 'N')}">disabled</c:if>>
			<label for="${item.scheduleCode}" class="label"></label>
	
			<c:if test="${fn:contains(code, '1')}"><span>월요일</span></c:if>
			<c:if test="${fn:contains(code, '2')}"><span>화요일</span></c:if>
			<c:if test="${fn:contains(code, '3')}"><span>수요일</span></c:if>
			<c:if test="${fn:contains(code, '4')}"><span>목요일</span></c:if>
			<c:if test="${fn:contains(code, '5')}"><span>금요일</span></c:if>
			<c:if test="${fn:contains(code, 'A')}"><span>오전</span></c:if>
			<c:if test="${fn:contains(code, 'B')}"><span>오후</span></c:if>
<%-- 			<c:if test="${fn:contains(workStatus, 'Y')}"><span>가능</span></c:if> --%>
<%-- 			<c:if test="${fn:contains(workStatus, 'N')}"><span>불가능</span></c:if> --%>

		</c:forEach>
		
		<button type="reset">되돌리기</button>
		<button type="submit">수정하기</button>
		
	</form>

	
	
	<script>
		function toggle(){
			let checkboxes = document.querySelectorAll('input[type=checkbox]');
			
			for (var i=0; i<checkboxes.length; i++){
				checkboxes[i].addEventListener('change', function(event)
		        {
		            if (event.target.checked) {
		                event.target.previousElementSibling.disabled = true;
		                event.target.previousElementSibling.previousElementSibling.value = "Y";
		            }else{
		                event.target.previousElementSibling.disabled = false;		            	
		                event.target.previousElementSibling.previousElementSibling.value = "N";
		            }
		        });
		    }
		};
		
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