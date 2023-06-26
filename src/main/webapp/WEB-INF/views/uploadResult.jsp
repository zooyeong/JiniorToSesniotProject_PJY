<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload Result</title>
</head>
<body>
    <h1>Upload Result</h1>
    <p>${message}</p>
   
   <img src="${pageContext.request.contextPath}/image/profile/${uploadedImageFileName}" alt="Uploaded Image" >
   
  
</body>
</html>
