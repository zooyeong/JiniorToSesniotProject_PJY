<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
   <title>footer</title>
    <style>
       footer {
    width: 120%;
    display: flex;
    align-items: center;
    position: absolute;
    z-index: 10;
    left: 50%;
    top: 550%;
    transform: translateX(-50%);
    min-height: 70px;
    background: #faf3e6;
    max-width: 96%;
    border-radius: 20px 20px 0 0; /* 수정된 부분 */
    transition: all 0.5s;
    justify-content: space-between;
    padding: 0 50px;
    border: 3px solid rgba(21, 71, 38, 0.15);
    border-bottom: none;
}
	.fontsize{
	font-size: 18px;}
    </style>
</head>
        <footer>
        <div>
            <img src="/resources/image/sns.PNG" alt="" style="border-radius: 15px; position: relative; margin-bottom: 20px;">
            <p class="fontsize">&nbsp; &nbsp; &nbsp;업체명 : 코코노아</p>
            <p class="fontsize">&nbsp; &nbsp; &nbsp;대표자 : 5조 &nbsp;</p>
            <p class="fontsize">&nbsp; &nbsp; &nbsp;사업자등록번호 : 111-11-11111 &nbsp;</p>
            <p class="fontsize">&nbsp; &nbsp; &nbsp;주소 : 충청남도 천안시 동남구 대흥동 134 휴먼교육센터 8층 &nbsp;</p>
            <p class="fontsize">&nbsp; &nbsp; &nbsp;전화번호 : &nbsp;041-561-1122<br><span style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(문의 시간 AM
                    9:00 ~ PM 8:00 / 점심시간 12:00~13:00)<br>
        </div>
        <iframe
            src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&amp;q=천안시+동남구+휴먼+교육센터"
            style="width: 400px; height: 250px;"></iframe>
        <div>
            <span style="padding: 20px;">이용약관</span><span style="padding: 20px;">개인정보처리방침</span>
        </div>
    </footer>
</html>