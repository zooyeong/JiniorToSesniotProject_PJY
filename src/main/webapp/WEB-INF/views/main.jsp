<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코코노아</title>
<script src="http://nenia.kr/js/jquery-1.12.4.min.js?ver=191202"></script>
<link rel="stylesheet" href="/resources/css/main_css.css">

</head>
<%@ include file = "header.jsp" %>
<body class="container">
    <div class="main1">
        <div class="inner">
            <h1 style="">항상 옆에서, <span style="color: #FAF3E6; font-size: 2.5rem;" >코코노아</span></h1><br>
            <p class="font-2" style="width: 350px;">우리곁을 지켜주는 어른들이 있습니다. <br>그들과 함께여서 <br> 나는 행복합니다.</p>
        </div>
    </div>
    <div class="mainup">
        <img src="/resources/image/zzzz.jpg" alt="" width="500" height="500"
            style="position: absolute; border-radius: 12px; top: 100px; left: 48%;">
            <c:if test="${userId == null}">
        <div style="position: relative; left:60%; top: 80%; width: 200px;"> 		
        <a href="/logInForm"><button class="w-btn-neon2"
                type="button">동행하러가기</button></a></div>
            	</c:if>
                <c:if test="${userCode == 'PAR'}">
                <div style="position: relative; left:60%; top: 80%; width: 200px;">
                <a href="/seniorDetail"><button class="w-btn-neon2"
                type="button">신청하러가기</button></a></div>
                </c:if>
                <c:if test="${userCode == 'SNR'}">
                <div style="position: relative; left:60%; top: 80%; width: 200px;">
                <a href="/snrMypage"><button class="w-btn-neon2"
                type="button">등록하기</button></a></div>
                </c:if>
        <div class="inner2">

            <h2>About US</h2>
            <br><br><br><br><br><br><br><br><br>
            <p style="font-size: 2.3rem;">더욱 안전한 서비스를<br>제공하고자 노력합니다.</p>
            <br><br><br><br><br><br><br><br>
            <p style="font-size: 1.8rem;">'미래의 안전'에 어떻게 기여할 수 있을까?</p>
            <p style="font-size: 1.8rem;">당신도 할 수 있습니다.</p>
        </div>



    </div>
    <div class="main2"></div>
	<div style="; width: 100%; height:900px; position: absolute; top: 1700px; z-index:-1;">123123
	<%@include file = "scroll.jsp" %>
	
	</div>
        
    <script src="https://code.jquery.com/jquery-3.7.0.js" 
		integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
		crossorigin="anonymous">
</script>
     

    <script>
        var mainup = document.querySelector('.mainup');
        var scrollCount = 0;

        window.addEventListener('scroll', function () {
            console.log(scrollY);
            scrollCount = window.pageYOffset;

            var maxHeight = document.documentElement.scrollHeight - window.innerHeight;

            if (scrollCount <= maxHeight * 0.1) {
                var widthPercentage = (scrollCount / (maxHeight * 0.2)) * 10 + 80;
                var heightPercentage = (scrollCount / (maxHeight * 0.2)) * 100 + 500;
                mainup.style.width = widthPercentage + '%';
                mainup.style.height = heightPercentage + 'px';
            }

            if (scrollCount >= maxHeight * 0.1) {
                mainup.style.width = '100%';
                mainup.style.height = '800px'; // 원하는 최대 높이 값으로 수정해주세요
            }
        });
    </script>
    
    <%@include file = "footer.jsp" %>
</body>

</html>
