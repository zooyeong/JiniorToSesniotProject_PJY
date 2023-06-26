<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- certification.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Certification</title>
</head>
<body>
    <%-- Other content --%>
    <div>
        <%-- Check if upload was successful and display appropriate message --%>
        <c:if test="${uploadSuccess}">
            <p>Upload successful!</p>
        </c:if>
        <c:if test="${not uploadSuccess}">
            <p>Upload failed!</p>
        </c:if>
    </div>
    <%-- Other content --%>
</body>
</html>