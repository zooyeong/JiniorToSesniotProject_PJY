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
}
.scheduleDiv{
	width: 100px;
	height: 100px;
	background-color: lightgray;
	margin: 5px;
	display: inline-block;
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
 }
 .profileinfo{
 color: #9BACBA;
 font-size: 17px;
 }
 .profilestar{
 font-size: 20px;
 color: #FF7000;
 }
 .infomation1{
 position:relative;
 top:20px;
 left:22px;
 width: 450px;
 height:100px;
 border-radius: 10px;
 background: white;
 margin-bottom: 14px;
 }
  .infomation2{
 position:relative;
 top:20px;
 left:22px;
 width: 450px;
 height:100px;
 border-radius: 10px;
 background: white;
 }
 .infomationtext{
 position: relative;
 top: 10px;
 left: 5px;
 }
  .infomationtext1{
 position: relative;
 top: 10px;
 left: 5px;
 }
 .infotext{
 font-size: 25px;
 position: relative;
 top: 20px;
 left: 24px;
 }
  .infotext1{
 font-size: 25px;
 position: relative;
 top: 20px;
 left: 24px;
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
        <img src="/resources/image/경고.png" width="30px" height="30px" style="margin-top: 10px border-radius: 12px; ">
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
		<span class="profileinfo">만${2023 - fn:substring(seniorDetail.birthday, 0, 4)}세</span><br>
		<span class="profilestar">★★★★★</span>
		
</p>

</div>
<div class="smallcontainer">
	<span class="infotext">자기소개</span>
	<div class="infomation1">
		<p class="infomationtext">${seniorDetail.info}</p>
	</div>
	<span class="infotext1">활동지역</span>
	<div class="infomation2">
	<p class="infomationtext1">${seniorDetail.area}</p>
	</div>
	<p>스케줄 : </p>
	<c:forEach var="item" items="${seniorEnableSchedule}">
	
		<c:set var="code" value="${item.scheduleCode}"/>
		<c:set var="status" value="${item.workStatus}"/>
		
		<div class="scheduleDiv" style="
			<c:if test="${fn:contains(status, 'Y')}">background-color:yellow;</c:if>
		">
		</div>
				
		
		<c:if test="${fn:contains(code, '1')}"><span>월요일</span></c:if>
		<c:if test="${fn:contains(code, '2')}"><span>화요일</span></c:if>
		<c:if test="${fn:contains(code, '3')}"><span>수요일</span></c:if>
		<c:if test="${fn:contains(code, '4')}"><span>목요일</span></c:if>
		<c:if test="${fn:contains(code, '5')}"><span>금요일</span></c:if>
		<c:if test="${fn:contains(code, 'A')}"><span>오전</span></c:if>
		<c:if test="${fn:contains(code, 'B')}"><span>오후</span></c:if>
<%-- 		<c:if test="${fn:contains(status, 'Y')}"><span>가능</span></c:if> --%>
<%-- 		<c:if test="${fn:contains(status, 'N')}"><span>불가능</span></c:if> --%>
		
	</c:forEach>
<%-- 	<p>${seniorDetail.picture}</p> --%>
	<br>
	<button type="button" onclick="location.href='/askForSenior?id=${seniorDetail.id}'">도우미 신청하기</button>
	<button type="button">채팅하기</button>
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