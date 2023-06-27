<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Admin 페이지</h1>

	<button onclick="moveReportedListPage()">신고 내역 관리</button>
	<button onclick="moveSeniorCertificationRegisterPage()">시니어 등록 관리</button>
	<button onclick="moveMatchingLogListPage()">매칭 + 동행 이력 리스트</button>

	<script>
    function moveReportedListPage() {
      location.href ='reportedList';
    }  
    
    
    function moveSeniorCertificationRegisterPage() {
      location.href ='reportedList';
    }  
    
    
    function moveMatchingLogListPage() {
      location.href ='reportedList';
    }  
 	</script>
 	
</body>
</html>