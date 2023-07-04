<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- certification.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>인증 완료</title>
</head>
<style>
*{
text-align: center;
}
body{
background-color: #FAF3E6}
</style>
<body>
    <%-- Other content --%>
    <div style="width: 700px; height: 500px;  position: relative;left: 22%; top:200px; border-radius:  12px; background-color: white;">
        <%-- Check if upload was successful and display appropriate message --%>
     
        <c:if test="${uploadSuccess}">
            <h1>인증 요청이 완료되었습니다 !</h1>
            <h1>관리자가 승인하면 시니어 활동을 진행할 수 있습니다.</h1>
        </c:if>

    <a href="/main"><button style="margin-top: 150px;">메인으로가기</button></a>
        </div>
    <%-- Other content --%>
</body>
</html>