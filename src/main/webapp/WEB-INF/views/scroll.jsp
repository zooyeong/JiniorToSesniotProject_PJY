<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자연가까이,네니아</title>
    
    <script src="http://nenia.kr/js/jquery-1.12.4.min.js?ver=191202"></script>

    <style>
        .main_4 {
        left: 20%;
            background: #FAF3E6;
            margin-top: -20px;     
            width:100%;
            height: 100vh;
            display: flex;
            align-items: center;
            position: relative;
        }

        .main_4 ul {
            display: flex;
            width: 100vw;
        }

        .main_4 li:first-child {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            min-width: 555px;
        }

        .main_4 li:first-child .top h1 {
            padding-bottom: 5px;
            color: #149473;
            font-weight: 600;
        }

        .main_4 li:first-child .top p {
            color: #154726;
            line-height: 1.3;
        }

        .main_4 li:first-child .top p span {
            font-weight: 700;
        }

        .main_4 li:first-child .bottom {
            padding-bottom: 50px;
        }

        .main_4 li:first-child .bottom p {
            color: #154726;
            padding-bottom: 12px;
            line-height: 1.6;
            padding-left: 2px;
            font-weight: 400;
            letter-spacing: 0px;
        }

        .main_4 li:first-child .bottom a {
            color: #149473;
            display: inline-flex;
            align-items: center;
            font-weight: 500;
            position: relative;
        }

        .main_4 li:first-child .bottom a::after {
            content: '';
            display: block;
            position: absolute;
            width: 0;
            height: 2px;
            background: #149473;
            bottom: -2px;
            transition-duration: 0.5s;
            margin-right: 25%;
            right: 0;
        }

        .main_4 li:first-child .bottom a:hover::after {
            width: 75%;
            left: 0;
        }

        .main_4 li:first-child .bottom a img {
            padding-left: 10px;
        }

        .main_4 li:not(:first-child) {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-right: 8%;
            min-width: 22%;
            justify-content: space-between;
        }

        .main_4 li:not(:first-child) .img_box {
            border-radius: 50px;
            overflow: hidden;
        }

        .main_4 li:not(:first-child) .img_box:hover img {
            transform: scale(1.1);
        }

        .main_4 li:not(:first-child) .img_box img {
            width: 100%;
            max-width: 420px;
            height: 250px;
            display: block;
            transition: all 0.5s;
        }

        .main_4 li:not(:first-child) figure {
            padding: 40px 0 35px;
        }

        .main_4 li:not(:first-child) a {
            display: inline-block;
            position: relative;
        }
    </style>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <div class="main_4"
                style="transform: translate3d(0px, 0px, 0px); inset: 0px auto auto 0px; margin: 0px; max-width: 934px; width: 934px; max-height: 913px; height: 913px; padding: 0px;">
                <div class="inner">
                    <ul class="wrap" style="transform: translate(0px, 0px);">
                        <li>
                            <div class="top">
                                <h1 class="font-6">Business</h1>
                                <p class="font-1">순수한 아이들의 <br><span>가장 가까운 안전을 <br>책임집니다.</span></p>
                            </div>
                            <div class="bottom">
                                <p class="font-6 nanum">코코노아는 주변 시니어들의 일자리와 어린이들의 안전을 생각하고있으며 <br>바쁜현대사회에서 자녀들이 더욱더 안전하게 성장할 수 있도록
                                  	하고 <br>더 나을 사회를 공유하고자 노력합니다.</p>
                                <!-- <a class="font-7" href="http://nenia.kr/page/12">더 알아보기 <img src="http://nenia.kr/theme/responsive_nenia/include/img/viewmore.png" alt=""></a> -->
                            </div>
                        </li>
                        <li>
                            <a href="" class="img_box">
                                <img src="/resources/image/hands.jpg" alt=""
                                    title="">
                            </a>
                            <figure class="logo"><img
                                    src="/resources/image/mainlogo.PNG" alt="">
                            </figure>
                            <a class="font-8" href=""></a>
                        </li>
                        <li>
                            <a href="" class="img_box">
                                <img src="/resources/image/등하원3.png" alt=""
                                    title="">
                            </a>
                            <figure class="logo"><img
                                    src="/resources/image/등하교돕기.png" alt="">
                            </figure>
                        </li>
                        <li>
                            <a href="" class="img_box">
                                <img src="/resources/image/책읽기.jpg" alt=""
                                    title="">
                            </a>
                            <figure class="logo"><img
                                    src="/resources/image/책읽기1.png" alt="">
                            </figure>
                            </li>
                        <li>
                            <a href="" class="img_box">
                                <img src="http://nenia.kr/theme/responsive_nenia/include/img/main4_img2.png" alt=""
                                    title="">
                            </a>
                            <figure class="logo"><img
                                    src="/resources/image/밥.png" alt="">
                            </figure>
                        </li>
                    </ul>
                </div>
            </div>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.8.0/gsap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.8.0/ScrollTrigger.min.js"></script>
        <script src="http://nenia.kr/theme/responsive_nenia/js/main.js"></script>
</html>