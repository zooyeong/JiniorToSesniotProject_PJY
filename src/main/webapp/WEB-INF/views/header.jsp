<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>헤더</title>
<link rel="stylesheet" href="http://nenia.kr/theme/responsive_nenia/css/default.css?ver=191202">
<link rel="stylesheet" href="http://nenia.kr/theme/responsive_nenia/include/common.css?ver=191202">

<style>
header{
max-height: 130px;
}
.black-box {
border-radius:12px;
position: absolute;
top: 80px;
left: 891px;
width: 190px;
height: 100px;
background-color: #FAF3E6;
z-index: 11;
display: none;
overflow: hidden;
opacity: 0;
transform: translateY(-10px);
transition: opacity 0.3s ease, transform 0.3s ease;
}

.white-box {
text-align:center;
width: 190px;
height: 50px;
background-color: white;
margin-bottom: 0px;
opacity: 0;
transform: translateY(-10px);
transition: opacity 0.3s ease, transform 0.3s ease;
}

.white-box:hover {
background-color: lightgray;
transition: background-color 0.1s ease;
}

.black-box.show {
display: block;
opacity: 1;
transform: translateY(0);
}

.black-box.show .white-box {
opacity: 1;
transform: translateY(0);
transition-delay: 0.2s;
}
.idbox{
text-align:center;
position:absolute;
right:130px;
bottom:25px;
color:white;
width: 190px;
height: 40px;
background-color: #154726;
border-radius: 1000px;
}

.idbox1{
text-align:center;
position:absolute;
top:-3px;
color:white;
width: 100px;
height: 33px;
background-color: #154726;
border-radius: 1000px;
transition: all 0.3s ease;
}
.idbox1:hover {
transform: scale(1.1); /* 약간 커지도록 스케일 변환 설정 */
}
.header_logo{
position: relative;

}

</style>
</head>

<%
String userId = (String) session.getAttribute("userId");
String userCode = (String) session.getAttribute("userCode");
%>

<header class="header_t" id="header_t_id" style="top: 0px;">
<div class="header_gnb">
<c:if test="${userId != 'admin' || userId == null}">
<ul class="main_menu">
<li class="menu menu1">
<a href="" style="font-size: 1.3rem;">회사소개</a>
</li>
<li class="menu menu2">
<a href="" style="font-size: 1.3rem;">이용방법</a>
</li>
<c:if test="${userCode == 'SNR'}">
<li class="menu menu3">
<a href="/scheduleList" style="font-size: 1.3rem;">매칭현황</a>
</li>
</c:if>
<c:if test="${userCode == 'PAR'}">
<li class="menu menu3">
<a href="/seniorDetail" style="font-size: 1.3rem;">시니어찾기</a>
</li>
</c:if>
<li class="menu menu4">
<a href="boardList" style="font-size: 1.3rem;">문의하기</a>
</li>
</ul>
</c:if>
</div>


<div class="header_logo">
<a href="http://localhost:8080/main">
<span style="font-size: 2rem; position: absolute; z-index: 2; right: 55%; top: 5px;">코코노아</span>
<img src="/resources/image/rogo.png" alt="" title="" width="140" height="100"
style="border-radius: 12px; z-index: 1;">
</a>
</div>


<div class="header_btn">
<% if (userId == null) { %>
<a class="down_btn font-8" href="/logInForm">
<div class="a_bg"></div>
<div class="label">로그인<img src="" alt=""></div>
</a>

<% } else { %>
<div class="abdabd" style="position: relative; right: 90%; top: 10px;">
<%@include file = "countMail.jsp" %>
</div>
<div class="userIdhover">

<div class="idbox">
<p style="font-size: 1.4rem; position: relative; top:5px;" onclick="toggleMenu()"><%= userId %>&nbsp;님 </p>

<% } %>


<% if (userId == null) { %>
<div class="store_btn font-8" >
<a class="store_btn font-8" href="/signUpType" >
<div class="idbox1">
<div class="label" style="position: relative; top: 50%;">회원가입</div>
</div>
</a>
</div>
<% } %>
</div>

<div class="black-box" id="blackBox">
<% if(userCode != null) {%>
<% if (userCode.equals("SNR")) { %>
<a href="/snrMypage"><div class="white-box"><br>마이페이지</div></a>
<% } %>
<% if (userCode.equals("PAR")) { %>
<a href="/parMypage"><div class="white-box"><br>마이페이지</div></a>
<% } %>
<% } %>
<a href="#" onclick="logout()"><div class="white-box"><br>로그아웃</div> </a>
<% if (userId == null) { %>
<div class="store_btn font-8">
<a class="store_btn font-8" href="" >
<div class="idbox1">
<div class="label" style="position: relative; top: 50%;">회원가입</div>
</div>
</a>
</div>
<% } %>
</div>

<div class="black-box" id="blackBox">
<% if(userCode != null) {%>
<% if (userCode.equals("SNR")) { %>
<a href="/snrMypage"><div class="white-box"><br>마이페이지</div></a>
<% } %>
<% if (userCode.equals("PAR")) { %>
<a href="/parMypage"><div class="white-box"><br>마이페이지</div></a>
<% } %>
<% } %>
<a href="#" onclick="logout()"><div class="white-box"><br>로그아웃</div> </a>

</div>
</div>


<script>
function toggleMenu() {
var blackBox = document.getElementById('blackBox');
blackBox.classList.toggle('show');
}


function logout() {
// Server-side logout request and other necessary tasks
// ...


// Invalidate the session and redirect
location.href = "/logoutproc";
}
function toggleMenu() {
var blackBox = document.getElementById('blackBox');
blackBox.classList.toggle('show');


// Toggle the visibility of the black box
if (blackBox.classList.contains('show')) {
blackBox.style.display = 'block';
} else {
blackBox.style.display = 'none';
}
}
</script>
</header>
</html>