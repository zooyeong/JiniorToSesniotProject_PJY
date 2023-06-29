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
#mailContainer{
	width: 50px;
	height: 50px;
	background-color: yellow;
	border-radius: 5px;
	position: relative;
}
#count{
	position: absolute;
    right: -5px;
    top: -5px;
    width: 20px;
    height: 20px;
    background-color: red;
    text-align: center;
    color: white;
}
</style>
</head>
<body>
	<div id="mailContainer"><span id="count">${count}</span></div>
	
</body>
</html>