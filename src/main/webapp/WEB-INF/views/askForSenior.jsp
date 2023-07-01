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
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
*{
	font-family: 'omyu_pretty';
	margin: 5px 0; 
	padding: 0;
	box-sizing: border-box;
}
h1{
	text-align: center;
}
#ask_for_wrapper{
	text-align: center;
	background-color: #F1F1F1;
    width: 500px;
    margin: 0 auto;
    padding-top: 1px;
}
span, label{
	font-size: 1.2rem;
}
input[type="text"], input[type="date"]{
	padding-left: 5px;
	width: 150px;
	height: 30px;
}
input[type="button"]{
    width: 70px;
    height: 30px;
}
.data_wrapper{
	background-color: white;
	border-radius: 10px;
	width: 450px;
	margin: 25px;
    padding: 10px;
}
.postcode{
    margin-left: 80px;
    margin-right: 8px
}
button{
    width: 150px;
    height: 40px;
    font-size: 1.2rem;
    margin-bottom: 25px;
}
</style>
</head>
<body>
	<h1>도우미 신청하기</h1>
	<div id="ask_for_wrapper">
		
		<form name="registerForm" action="" method="post">
			
			<div class="data_wrapper">
				<h2>신청기간</h2>
				<label>시작일</label>
				<input type="date" id="startDate" name="startDate">
				<br>
				<label>종료일</label>
				<input type="date" id="endDate" name="endDate">
			</div>
			
			<div class="data_wrapper">
				<h2>* 픽업시간</h2>
				<p>* 오전 09:00 ~ 12:00</p>
				<p>* 오후 14:00 ~ 18:00</p>
				<c:forEach var="item" items="${seniorEnableSchedule}">
			
					<c:set var="code" value="${item.scheduleCode}"/>
					<c:set var="status" value="${item.status}"/>
					<c:set var="workStatus" value="${item.workStatus}"/>
			
					<input type="checkbox" id="${item.scheduleCode}" onclick="dateCheck()" name="scheduleCode" value="${item.scheduleCode}" 
					<c:if test="${fn:contains(workStatus, 'N')}">disabled</c:if>>
					<label for="${item.scheduleCode}" class="label"></label>
			
					<c:if test="${fn:contains(code, '1')}"><span>월요일</span></c:if>
					<c:if test="${fn:contains(code, '2')}"><span>화요일</span></c:if>
					<c:if test="${fn:contains(code, '3')}"><span>수요일</span></c:if>
					<c:if test="${fn:contains(code, '4')}"><span>목요일</span></c:if>
					<c:if test="${fn:contains(code, '5')}"><span>금요일</span></c:if>
					<c:if test="${fn:contains(code, 'A')}"><span>오전</span></c:if>
					<c:if test="${fn:contains(code, 'B')}"><span>오후</span></c:if><br>
		
				</c:forEach>
			</div>
			
			<div class="data_wrapper">
				<h2>픽업지역</h2>
				<input type="text" class="postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode(event)" value="우편번호 찾기"><br>
				<input type="text" id="pickAddress" name="pickUpPlace" placeholder="주소"><br>
				<input type="text" name="pickUpPlace" placeholder="상세주소"><br>
				<input type="text" name="pickUpPlace" placeholder="참고항목"><br>
			</div>
			
			<div class="data_wrapper">
				<h2>도착지역</h2>
				<input type="text" class="postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode(event)" value="우편번호 찾기"><br>
				<input type="text" id="arrAddress" name="arrivePlace" placeholder="주소"><br>
				<input type="text" name="arrivePlace" placeholder="상세주소"><br>
				<input type="text" name="arrivePlace" placeholder="참고항목"><br>
			</div>
			<button type="button" onclick="submitCheck()">신청하기</button>
		</form>
		<input type="hidden" id="userId" value="${userId}">
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		let sDate = new Date();
		let eDate = new Date();
		
		sDate.setDate(sDate.getDate() + 1); 
		eDate.setDate(eDate.getDate() + 30); //한달이내 접수
		
		let minStr = sDate.toISOString().split('T')[0];
		let maxStr = eDate.toISOString().split('T')[0];
		
		let startDate = document.getElementById('startDate');
		let endDate = document.getElementById('endDate');
		startDate.setAttribute("min", minStr);
		startDate.setAttribute("max", maxStr);
		startDate.value = minStr;
		endDate.setAttribute("min", minStr);
		endDate.value = minStr;
		
		/* 우편번호 찾기 */
		function sample6_execDaumPostcode(event) {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    event.target.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.value = extraAddr;
	                
	                } else {
	                	event.target.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                event.target.previousElementSibling.value = data.zonecode;
	                event.target.nextElementSibling.nextElementSibling.value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                event.target.nextElementSibling.nextElementSibling.nextElementSibling.focus();
	            }
	        }).open();
	    }
		
		function submitCheck(){
			
			let userId = document.getElementById('userId').value;
			if(userId == ""){
				alert('로그인 후 신청이 가능합니다.');
				return false;
			}
				
			let count = 0;
			let checkboxes = document.getElementsByName('scheduleCode');
			
			for(let i=0; i<checkboxes.length; i++){
				if(checkboxes[i].checked){
					count++;
				}
			}
			
			if(count == 0){
				alert('신청할 요일을 선택해주세요.');
				return false;
			}else{
				let result = dateCheck();
				if(result == false){
					return false;
				}
			}
			
			let pickAddress = document.getElementById('pickAddress').value;
			let arrAddress = document.getElementById('arrAddress').value;
			let expA = /천안/;
			let expB = /아산/;
			
			if( pickAddress == '' ){
				alert('출발지를 입력해주세요.');
				return false;
			}else if( arrAddress == '' ){
				alert('도착지를 입력해주세요.');
				return false;
			}else if( !( (expA.test(pickAddress) || expB.test(pickAddress) )
				&& (expA.test(arrAddress) || expB.test(arrAddress)) ) ){
				alert('신청은 천안·아산 지역만 가능합니다.');
				return false;
			}
			
				
			let result = confirm("이 정보로 신청하시겠습니까?");
			let form = document.registerForm;
			
			if(result){
				form.submit();	
			}			
		}
		
		function dateCheck(){
			let startDate = new Date(document.getElementById('startDate').value);
			let endDate = new Date(document.getElementById('endDate').value);
			
			let checkboxes = document.getElementsByName('scheduleCode');
			for(let i=0; i<checkboxes.length; i++){
				if(checkboxes[i].checked){
					let code = checkboxes[i].value;
					let dayOfWeek = Number(code.charAt(0));
					
					if(!isDayOfWeekInRange(startDate, endDate, dayOfWeek)){
						alert("체크한 요일이 기간에 해당되지 않습니다!");
						checkboxes[i].checked = false;
						return false;
					}
				}
			}
		}
		
		function isDayOfWeekInRange(startDate, endDate, dayOfWeek){
			let currentDate = new Date(startDate);
			
			while(currentDate <= endDate){
				if(currentDate.getDay() === dayOfWeek){
					return true;
				}
				currentDate.setDate(currentDate.getDate() +1);
			}
			return false;
		}
		
	</script>
</body>
</html>