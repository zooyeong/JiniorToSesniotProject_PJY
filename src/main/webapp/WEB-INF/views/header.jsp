<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>헤더</title>
    <link rel="stylesheet" href="http://nenia.kr/theme/responsive_nenia/css/default.css?ver=191202">
    <link rel="stylesheet" href="http://nenia.kr/theme/responsive_nenia/include/common.css?ver=191202">
</head>

<%
    String userId = (String) session.getAttribute("userId");
    String userCode = (String) session.getAttribute("userCode");
%>

<header class="header_t" id="header_t_id" style="top: 0px;">
    <div class="header_gnb">
        <ul class="main_menu">
            <li class="menu menu1 ">
                <a href="">회사소개</a>
            </li>
            <li class="menu menu2 ">
                <a href="">이용방법</a>
            </li>
            <li class="menu menu3 ">
                <a href="">시니어찾기</a>
            </li>
            <li class="menu menu4 ">
                <a href="">문의하기</a>
            </li>
        </ul>
    </div>

    <div class="header_logo">
        <a href="http://localhost:8080/main">
            <span style="font-size: 2rem; position: absolute; z-index: 2; right: 50%; top: 5px;">코코노아</span>
            <img src="/resources/image/rogo.png" alt="" title="" width="140" height="100"
                style="border-radius: 12px; clip-path: circle(50% at 50% 50%); z-index: 1;">
        </a>
    </div>

    <div class="header_btn">
        <% if (userId == null) { %>
            <a class="down_btn font-8" href="http://localhost:8080/sampleSession">
                <div class="a_bg"></div>
                <div class="label">로그인<img src="" alt=""></div>
            </a>
        <% } else { %>
            <div class="logged-in-user">
                <span>Welcome, <%= userId %></span>
            </div>
        <% } %>

        <% if (userId == null) { %>
            <a class="store_btn font-8" href="" target="_blank">
                <div class="a_bg"></div>
                <div class="label">회원가입</div>
            </a>
        <% } %>
    </div>
</header>
</html>
