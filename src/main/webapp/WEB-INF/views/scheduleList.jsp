<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/scheduleList_css.css">
</head>
<body>
<%@ include file="header.jsp"%>
<div class="container">
	<h1>활동 예정 목록</h1>
	<c:forEach var="item" varStatus="varStatus" items="${matchingDetailDtoList}">
		<c:set var="code" value="${item.scheduleCode}"/>
		<form action="" method="post">
			<div class="scheduleContainer">
				<label for="image">     
                	<img class="profileimage" onclick=" window.open('/parentsDetailIn?id=${item.parId}', '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=250,left=250,width=1000,height=800')" id="preview" 
                	src="${pageContext.request.contextPath}/image/profile/${imageFileDto[varStatus.index].fileName}" width="300px;" onerror="this.onerror=null;this.src='/resources/image/no_profile.png'" style="clip-path: circle(35% at 50% 50%);">
        		</label>
				<h4 class="h4_date">일자 : ${fn:substring(item.day, 0, 10)}
				<c:if test="${fn:contains(code, 'A')}"><span>오전</span></c:if>
				<c:if test="${fn:contains(code, 'B')}"><span>오후</span></c:if></h4>
				<p>${parentsDetailDto[varStatus.index].name}님(${item.parId})의 어린이
					<span class="childName">${parentsDetailDto[varStatus.index].CName}</span></p>
				<p>픽업장소 : ${item.pickUpPlace}</p>
				<p>도착장소 : ${item.arrivePlace}</p>
				<input type="hidden" name="matchingNumber" value="${item.matchingNumber}">
				<input type="hidden" name="scheduleCode" value="${item.scheduleCode}">
				<input type="hidden" name="day" value="${item.day}">
				<input type="hidden" name="btnValue">
				<button type="button" class="sl_btn" onclick="completeCheck(this)" value="complete">완료</button>
				<button type="button" class="sl_btn" onclick="completeCheck(this)" value="cancel">취소</button>
			</div>
		</form>
	</c:forEach>
	<c:if test="${empty matchingDetailDtoList}">
		<p>새로운 스케줄이 없습니다.</p>
	</c:if>
</div>
	
	<script>
		function completeCheck(button){
			let today = new Date();
			let form = button.closest('form');
			let dateEl = form.querySelector('h4');
			let dateStr = dateEl.textContent.substr(5, 15);
			let date = new Date(dateStr);
			
			if(date > today){
				alert('해당 일정은 아직 예정일이 아닙니다.');
			}else{
				let result = confirm('진행하시겠습니까?');
				if(!result){
					return false;
				}
				alert('진행되었습니다.');
				let btnValue = form.querySelector('input[name="btnValue"]');
				btnValue.value = button.value;
				form.submit();
			}
		};
	</script>
</body>
</html>