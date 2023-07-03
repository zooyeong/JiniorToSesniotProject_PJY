<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신고하기</title>
</head>
<style>
*{
margin: 0 auto;
padding: 10px;
}

body{
background-color: #FAF3E6;}
.input1{
border: none;
  outline: none;
}
.div1{
background-color:#FAF3E6;
border-radius:12px;
text-align:center;
width: 600px;
height: 600px;
}
.div2{
background-color:white;
border: 1px solid black;
width: 250px;
height: 120px;
border-radius: 12px;
}
  .upline {
            width: 92%;
            text-align: center;
            background-color: lightgray;
   
        }
</style>
<body>
    <h1 style="text-align: center;">신고하기</h1>
    <img style="position: absolute; left: 58%; top:2%"  alt="" src="/resources/image/경고.png" width="50px" height="50px">
    
    <form action="/report/declaration" method="post">
    <div class="div1">
    	<div class="div2">
        <input type="hidden" name="parentId" value="${parentId}">
        <label style="font-size: 1.2rem; font-weight: 700;" for="reportedUserId">신고 대상 ID </label><br>
        <input class="input1" type="text" name="seniorId" value="${seniorId}" readonly="readonly"><br>
 
         <label  style="font-size: 1.2rem; font-weight: 700;" for="reportedUserName">신고 대상 이름 </label><br>
        <input class="input1" type="text" name="name" value="${name}" readonly="readonly">
        </div>
        <br><br>
        <label for="reportedReason" >신고 사유</label><br>
        <textarea style="border-radius:12px;" name="reportedReason" id="reportedReason" cols="50" rows="20" required  placeholder="신고사유는 6하원칙에 맞게 작성 부탁드립니다."></textarea><br>
        <button type="submit">신고</button>
        </div>
    </form>
    
</body>
</html>
