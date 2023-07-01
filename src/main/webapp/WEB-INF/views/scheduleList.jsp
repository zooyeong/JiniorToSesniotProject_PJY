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
*{
	text-align: center;
}
.scheduleContainer{
	border: 1px solid black;
	border-radius: 8px;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<h1>시니어 스케줄 리스트</h1>
	<c:forEach var="item" varStatus="varStatus" items="${matchingDetailDtoList}">
		<c:set var="code" value="${item.scheduleCode}"/>
		<form action="" method="post">
			<div class="scheduleContainer">
				<p>${parentsDetailDto[varStatus.index].name}님(${item.parId})의 어린이
					${parentsDetailDto[varStatus.index].CName}</p>
				<label for="image">     
                	<img class="profileimage" onclick="location.href='parentsDetailIn?id=${item.parId}'" id="preview" 
                	src="${pageContext.request.contextPath}/image/profile/${imageFileDto[varStatus.index].fileName}" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/image/profile/noprofile1.png?v=1';" style="clip-path: circle(50% at 50% 50%);">
        		</label>
				<p>${fn:substring(item.day, 0, 10)}</p>
				<c:if test="${fn:contains(code, 'A')}"><span>오전</span></c:if>
				<c:if test="${fn:contains(code, 'B')}"><span>오후</span></c:if>
				<p>픽업장소 : ${item.pickUpPlace}</p>
				<p>도착장소 : ${item.arrivePlace}</p>
				<input type="hidden" name="matchingNumber" value="${item.matchingNumber}">
				<input type="hidden" name="scheduleCode" value="${item.scheduleCode}">
				<input type="hidden" name="day" value="${item.day}">
				<input type="hidden" name="btnValue">
				<button type="button" onclick="completeCheck(this)" value="complete">완료</button>
				<button type="button" onclick="completeCheck(this)" value="cancel">취소</button>
			</div>
		</form>
	</c:forEach>
	<c:if test="${empty matchingDetailDtoList}">
		<p>새로운 스케줄이 없습니다.</p>
	</c:if>
	
	<script>
		function completeCheck(button){
			let today = new Date();
			let form = button.closest('form');
			let dateEl = form.querySelector('p:nth-child(2)');
			let dateStr = dateEl.textContent;
			let date = new Date(dateStr);
			
			if(date > today){
				alert('해당 일정은 아직 예정일이 아닙니다.');
			}else{
				let btnValue = form.querySelector('input[name="btnValue"]');
				btnValue.value = button.value;
				form.submit();
			}
		};
	</script>
</body>
</html>