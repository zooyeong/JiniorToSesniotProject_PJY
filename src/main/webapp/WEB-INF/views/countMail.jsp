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
	margin:0; 
	padding:0;
	box-sizing: border-box;
}
#bellContainer{
	width: 50px;
	height: 50px;
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
    border-radius: 50%;
}
#bell{
	width: 50px;
	height: 50px;
}
#mailContainer, #mailContainerEmpty{
	width: 400px;
	padding-left: 10px;
	height: 0;
	overflow: hidden;
	transition: all 1s ease;
}
.mailDiv{
	width: 320px;
    margin-left: 5px;
	margin-bottom: 20px;
	height: 100px;
	overflow: hidden;
}
.middleContainer{
	display: inline-flex;
}
.minibell, .mailDiv, .clickBtn{
	display: inline-block;
}
.minibell, .clickBtn{
	margin-top: 40px;
	width: 20px;
    height: 20px;
}
.clickBtn{
	cursor: pointer;
}
h4{
	border-bottom: 1px solid lightgray;
    margin: 20px 0;
}
.sendTime{
	font-size: 0.8rem;
	text-align: right;
}
.submitBtn{
	width: 50px;
    height: 25px;
    background-color: white;
    border-radius: 5px;
    border: 1px solid black;
}
#submitBtnContainer{
	text-align: center;
}
</style>
<script>
function emptyMail(){
	document.getElementById('emptyMail').style.display = 'block';
	document.getElementById('emptyMail').innerHTML = "새로운 알림이 없습니다.";
}
</script>
</head>
<body>
	<div id="bellContainer">
		<img src="resources/image/bell.png" id="bell" onclick="mailView()">
		<span id="count">${count}</span>
	</div>
	
	<c:if test="${userCode eq 'PAR'}">
		<div id="mailContainer">
			<h4>알림</h4>
			<c:forEach var="item" items="${mail}">
				<div class="middleContainer">
					<img src="resources/image/minibell.png" class="minibell">
					<div class="mailDiv">
						<p>보낸사람 : ${item.sendId}님</p>
						<p>${item.content}</p>
						<p class="sendTime">${item.sendTime}</p>
					</div>
					<img src="resources/image/downarrow.png" class="clickBtn" onclick="mailDivView(event)">
				</div>
			</c:forEach>
		</div>	
	</c:if>
	
	<c:if test="${userCode eq 'SNR'}">
		<div id="mailContainer">
			<h4>알림</h4>
			<form action="" method="post">
			<c:forEach var="item" items="${mail}">
				<div class="middleContainer">
					<img src="resources/image/minibell.png" class="minibell">
					<div class="mailDiv">
						<p>보낸사람 : ${item.sendId}님</p>
						<p>${item.content}</p>
						<div id="submitBtnContainer">
							<button type="submit" class="submitBtn" onclick="javascript: form.action='/acceptMail';">수락</button>
							<button type="submit" class="submitBtn" onclick="javascript: form.action='/refuseMail';">거절</button>
						</div>
						<p class="sendTime">${item.sendTime}</p>
						<input type="hidden" name="no" value="${item.no}">
						<input type="hidden" name="revId" value="${item.sendId}">
						<input type="hidden" name="sendId" value="${item.revId}">
						<input type="hidden" name="matchingNumber" value="${item.matchingNumber}">
					</div>
					<img src="resources/image/downarrow.png" class="clickBtn" onclick="mailDivView(event)">
				</div>
			</c:forEach>
			</form>
			<p id="emptyMail" style="display:none;"></p>
		</div>
	</c:if>
	<c:if test="${empty mail}">
		<script>
			emptyMail();
		</script>
	</c:if>
	

	<script>
		function mailView(){
			let mailContainer = document.getElementById('mailContainer');

			if(mailContainer.offsetHeight == 0){
				mailContainer.style.height = "500px";
				mailContainer.style.overflow = "scroll";
			}else{
				mailContainer.style.height = "0";
			}
		}
		
		function mailDivView(event){
			let mailDiv = event.target.previousElementSibling;
			if(mailDiv.offsetHeight == 100){
				mailDiv.style.height = "auto";
			}else{
				mailDiv.style.height = "100px";
			}
		}
			
	</script>
</body>
</html>