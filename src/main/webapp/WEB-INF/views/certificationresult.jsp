<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- certification.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Certification</title>
</head>
<style>
*{
text-align: center;}
</style>
<body>
    <%-- Other content --%>
    <div>
        <%-- Check if upload was successful and display appropriate message --%>
     
        <c:if test="${uploadSuccess}">
            <h1>인증 요청이 완료되었습니다 !</h1>
            <h1>관리자가 승인하면 시니어 활동을 진행할 수 있습니다.</h1>
        </c:if>
    </div>
    <%-- Other content --%>
</body>
</html>