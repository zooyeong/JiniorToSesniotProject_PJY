<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sms_cf</title>
<style type="text/css">
input{
margin-bottom: 10px;

}

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>



</head>
<body>
	<div class="container"></div>
	
	<div id="contents">
			<br>
			휴대전화 : <input type="text" id="phoneNum" name="phoneNumber" placeholder="숫자만 입력해주세요" />
			<input type="button" id="send" value="전송" /><br>
			인증번호 : <input type="text" id="authNum">
			<input type="button" id="enterBtn" value="확인">
			<input type="text" id="checkAuth" name="checkAuth"  placeholder="인증번호 대조">
			<input type="text" name="smsPass" id="smsPass" placeholder="인증상태">

	</div>
	<script>
    $(document).ready(function() {
      $("#send").click(getPhoneNumber);
      $("#enterBtn").click(compareAuthNumber);
    });
    

    function getPhoneNumber() {
    	  var phoneNumber = $("#phoneNum").val();
    	  var regPhone= /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;
    	  
    	  
    	  if (phoneNumber === "" || phoneNumber === null) {
    	    alert("전화번호를 입력해주세요.");
    	  }
    	  if (regPhone.test(phoneNumber) != true) {
    		 
      	    alert("숫자만 입력 가능합니다.");
			return false;
      	  } 
    	  
    	  else {
    	    var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");
    	    if (con_test == true) {
    	      $.ajax({
    	        type :"post",
    	        url: "/sendSms",
    	        data: {
    	          "phoneNum": phoneNumber
    	        },
    	        success: function(response) {
    	            // 인증 번호를 체크 값에 저장합니다.
    	            $("#checkAuth").val(response.authNumber);
    	            console.log("전화번호를 전달했으며 성공적으로 난수가 생성되었습니다.");
    	            alert("인증번호를 발송하였습니다.");
    	          },
    	          error: function(request, status, error) {
    	            alert("다시 시도해주세요");
    	          }
    	        });
    	    }
    	  }
    	}

    function compareAuthNumber() {
	

 	
      var authNum = $("#authNum").val();
      var sysNum = $("#checkAuth").val();

      if (authNum == null || authNum == "") {
        alert("휴대폰으로 발송된 인증번호를 입력해주세요");
      } else {
        if (authNum.trim() == sysNum.trim()) {
          alert("인증 성공");
          //성공 이후에 어떻게 할것이냐~~~ 화면 이동? or 어디 요청을 다시? or 인증완료로 기록. 
          $("#smsPass").val(0);		  
        } else {
          alert("인증 실패");
          $("#smsPass").val(1);          
        }
      }
    }
  </script>
</body>
</html>
