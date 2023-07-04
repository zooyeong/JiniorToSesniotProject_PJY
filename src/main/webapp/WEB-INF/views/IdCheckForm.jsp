<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>아이디 중복 체크</title>

        <style type="text/css">
            #wrap {
                width: 490px;
                text-align: center;
                margin: 0 auto 0 auto;
            }

            #chk {
                text-align: center;
            }

            #cancelBtn {
                visibility: visible;
            }

            #useBtn {
                visibility: hidden;
            }
        </style>

    </head>

    <body>

        <div id="wrap">
            <br>
            <p style="font-size: small; color: gray;">아이디 중복체크</p>

            <br>
            <div id="chk">
                <form id="checkForm">
                <!-- 아이디 최소 8자~최대 16자 -->
                    <input type="text" name="idinput" id="userId" minlength="8" maxlength="20">
                    <input type="button" value="중복확인" onclick="idCheck()">
                </form>
                <div id="msg"></div>
                <br>
                <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
                <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
            </div>
</div>
            <script>
            console.log("opener", opener);

                var httpRequest = null;

                // httpRequest 객체 생성
                function getXMLHttpRequest() {
                    var httpRequest = null;

                    if (window.ActiveXObject) {
                        try {
                            httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
                        } catch (e) {
                            try {
                                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                            } catch (e2) { httpRequest = null; }
                        }
                    }
                    else if (window.XMLHttpRequest) {
                        httpRequest = new window.XMLHttpRequest();
                    }
                    return httpRequest;
                }
                // 회원가입창의 아이디 입력란의 값을 가져온다.
                function pValue() {
                    document.getElementById("userId").value = opener.document.userInfo.id.value;
                }
                // 아이디 중복체크
                function idCheck() {

                    var id = document.getElementById("userId").value;
                  

                    if (!id) {
                        alert("아이디를 입력하지 않았습니다.");
                        return false;
                    }
                    else if ((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")) {
                        alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
                        return false;
                    }
                    else if (id.length < 8 || id.length > 20) {
                    	  alert("아이디는 최소 8자 이상, 최대 20자 이내로 입력해주세요.");
                    	  return false;
                    }
                    else {
                        var param = "id=" + id
                        httpRequest = getXMLHttpRequest();
                        httpRequest.onreadystatechange = callback;
                        httpRequest.open("POST", "IdCheckAction", true);
                        httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                        httpRequest.send(param);
                    }
                }

                function callback() {
                	console.log('callback');
                	console.log(httpRequest);
                	console.log(httpRequest.readyState);
                    if (httpRequest.readyState == 4) {
                        // 결과값을 가져온다.
                        
                        var resultText = httpRequest.responseText; //응답이 넘어온 값
                        console.log(resultText);
                        
                        //무슨 값이면 중복,
                        //무슨 값이면 중복이 아니다
                        
                        if (resultText == 0) {  //중복이다
                            alert("사용할수없는 아이디입니다.");
                            document.getElementById("cancelBtn").style.visibility = 'visible';
                            document.getElementById("useBtn").style.visibility = 'hidden';
                            document.getElementById("msg").innerHTML = "";
                        }
                        else if (resultText == 1) {  //중복 아니다
                            document.getElementById("cancelBtn").style.visibility = 'hidden';
                            document.getElementById("useBtn").style.visibility = 'visible';
                            document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
                        }
                    }
                }

                // 사용하기 클릭 시 부모창으로 값 전달 
                function sendCheckValue() {
                    // 중복체크 결과인 idCheck 값을 전달한다.
                    opener.document.userInfo.idDuplication.value = "idCheck";
                    // 회원가입 화면의 ID입력란에 값을 전달
                    opener.document.userInfo.id.value = document.getElementById("userId").value;

                    if (opener != null) {
                        opener.chkForm = null;
                        self.close();
                    }
                }	
            </script>



    </body>

    </html>