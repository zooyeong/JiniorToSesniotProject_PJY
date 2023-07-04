<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부모상세페이지</title>
<style>
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
*{
	font-family: 'omyu_pretty';
	margin:0; 
	padding:0;
	box-sizing: border-box;
}
.maintext{
	font-size: 3rem;
	position: relative;
	left: 38%;
}
.profileimage1{
	width: 500px;
	height: 400px;
	border-radius: 12px;
	position: relative;
	left: 30%;
}
.profile1{
	width: 450px;
	position: relative;
	margin-top: 20px;
	left: 32%;
	text-align: left;
	font-size: 20px;
}
.smallcontainer{
	width: 500px;
	height: 100%;
	background-color:#F1F1F1;
	position: relative;
	left: 30%;
	border-radius: 12px;
	padding: 24px;
 }
.profileinfo{
	color: #9BACBA;
	font-size: 17px;
}
.infomation{
	width: 100%;
	height:100px;
	border-radius: 10px;
	background: white;
	margin-bottom: 14px;
	padding: 10px;
}
.infotext{
	font-size: 25px;
}
</style>
</head>
<body>
<div class="container">
	<p class="maintext">${parentsDetail.name}님 상세페이지</p>
	
	<img class="profileimage1" src="${pageContext.request.contextPath}/image/profile/${parentsImg.fileName}" onerror="this.onerror=null;this.src='/resources/image/no_profile.png';"/>
	
	<div class="profile1">
		<p>${parentsDetail.name}
		<c:if test="${parentsDetail.gender eq 'F'}">
			<span class="profileinfo">여성</span>
		</c:if>
		<c:if test="${parentsDetail.gender eq 'M'}">
			<span class="profileinfo">남성</span>
		</c:if>
		<span class="profileinfo">${2023 - fn:substring(parentsDetail.birthday, 0, 4)}세</span><br>
		</p>
	</div>
	
	<div class="smallcontainer">
		<span class="infotext">자녀소개</span>
		<div class="infomation">
			<p class="infomationtext">자녀이름 ${parentsDetail.CName}</p>
			<p class="infomationtext">자녀나이 ${2023 - fn:substring(parentsDetail.birthyear, 0, 4)}살</p>
		</div>
		
		<span class="infotext">자녀성격</span>
		<div class="infomation">
			<p class="infomationtext">${parentsDetail.personality}</p>
		</div>
		
		<span class="infotext">기타사항</span>
		<div class="infomation">
			<p class="infomationtext">${parentsDetail.etc}</p>
		</div>
	</div>
</div>

</body>
</html>