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
.scheduleDiv{
	width: 100px;
	height: 150px;
	background-color: lightgray;
	margin: 5px;
	display: inline-block;
	border-radius: 5px;
}
#scheduleContainer{
	width: 450px;
	overflow: auto;
	white-space: nowrap;
	background-color: white;
    border-radius: 10px;	
}
.maintext{
	font-size: 3rem;
	position: relative;
	left: 32%;
}
.declaration1{
	position: absolute;
	left: 66%;
	bottom: 94%;
	border:none;
	background: white;
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
.profilestar{
	font-size: 20px;
	color: #FF7000;
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
#btnContainer{
	text-align: center;
}
#btn{
	width: 150px;
	height: 40px;
	font-size: 1.2rem;
}
.weekday{
	margin-left: 75px;
}
.timeContainer{
	height: 150px;
	line-height: 150px;
	margin: 5px;
	float: left;
}
</style>
</head>
<body>
<div class="container">
	<span class="maintext">${seniorDetail.name}시니어 상세페이지</span>
	<form id="declarationForm" action="/declaration" method="post" target="_blank">
    <input type="hidden" name="reportedUserId" value="${seniorid}" />
    <input type="hidden" name="reportedUserName" value="${seniorDetail.name}" />
    <button class="declaration1" type="submit">
        <img src="/resources/image/신고.jpg" width="30px" height="30px" style="margin-top: 10px border-radius: 12px; ">
    </button>
</form>
	
	<img class="profileimage1" src="${pageContext.request.contextPath}/image/profile/${parentsImg.fileName}"/>
	
	<div class="profile1">
	<p>${seniorDetail.name}
		<c:if test="${seniorDetail.gender eq 'F'}">
			<span class="profileinfo">여성</span>
		</c:if>
		<c:if test="${seniorDetail.gender eq 'M'}">
			<span class="profileinfo">남성</span>
		</c:if>
		<span class="profileinfo">${2023 - fn:substring(seniorDetail.birthday, 0, 4)}세</span><br>
		<span class="profilestar">★★★★★</span>
		
</p>

</div>
<div class="smallcontainer">
	<span class="infotext">자기소개</span>
	<div class="infomation">
		<p class="infomationtext">${seniorDetail.info}</p>
	</div>
	<span class="infotext">활동지역</span>
	<div class="infomation">
	<p class="infomationtext">${seniorDetail.area}</p>
	</div>
	<span class="infotext">도우미 가능 시간</span>
	<div id="scheduleContainer">
		<span class="weekday" style="margin-left: 150px;">월요일</span>
		<span class="weekday">화요일</span>
		<span class="weekday">수요일</span>
		<span class="weekday">목요일</span>
		<span class="weekday">금요일</span><br>
		

		
		<div class="timeContainer">
			<p>오전(09:00~12:00)<p>
		</div>
		<c:forEach var="item" items="${seniorEnableSchedule}">
			<c:set var="code" value="${item.scheduleCode}"/>
			<c:set var="status" value="${item.workStatus}"/>
			<div class="scheduleDiv" id="${item.scheduleCode}" style="
				<c:if test="${fn:contains(status, 'Y')}">background-color:#01b399;</c:if>
				<c:if test="${fn:contains(code, 'B')}">display:none;</c:if>	
			">
			</div>
		</c:forEach>
		
		<br>
		<div class="timeContainer">
			<p>오후(14:00~18:00)</p>
		</div>
		<c:forEach var="item" items="${seniorEnableSchedule}">
			<c:set var="code" value="${item.scheduleCode}"/>
			<c:set var="status" value="${item.workStatus}"/>
			<div class="scheduleDiv" id="${item.scheduleCode}" style="
				<c:if test="${fn:contains(status, 'Y')}">background-color:#01b399;</c:if>
				<c:if test="${fn:contains(code, 'A')}">display:none;</c:if>	
			">
			</div>
		</c:forEach>
	</div>
	<br>
	<div id="btnContainer">
		<button type="button" id="btn" onclick="location.href='/askForSenior?id=${seniorDetail.id}'">도우미 신청하기</button>
	</div>
	</div>
</div>
	<script>
    // Open the declaration pop-up when the form is submitted
    document.getElementById("declarationForm").addEventListener("submit", function(e) {
        e.preventDefault(); // Prevent the default form submission

        var seniorId = "${seniorDetail.id}";
        var name = "${seniorDetail.name}";
        var popupUrl = "/declaration?id=" + seniorId +"&name="+ name; 
        var popupWidth = 800;
        var popupHeight = 800;
        var screenWidth = window.screen.availWidth;
        var screenHeight = window.screen.availHeight;
        var left = (screenWidth - popupWidth) / 2;
        var top = (screenHeight - popupHeight) / 2;
        var windowFeatures = "width=" + popupWidth + ",height=" + popupHeight + ",left=" + left + ",top=" + top;

        window.open(popupUrl, "_blank", windowFeatures); // Open the declaration pop-up
    });
</script>
</body>
</html>