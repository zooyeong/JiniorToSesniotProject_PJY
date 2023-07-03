<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
	integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
	textarea{
		resize: none;
	}
	
	
	
	
	</style>

	
</head>
<body>

	<p>자기소개_선택사항입니다.</p>
	<textarea rows="20" cols="150" id="info" name="info"></textarea><br>
	<p>희망지역_선택사항입니다.</p>
	<input type="text" id="area" name="area" >
	
	<p>스케줄 : </p>
			<div id="snrTime" class="SnrTime" onsubmit="handleSubmit(event)">
				<h2>* 픽업시간</h2>
				<p>* 오전 09:00 ~ 12:00</p>
				<p>* 오후 14:00 ~ 18:00</p>
				
				<input type="hidden" name ="status" value =""> <br>
				<input type="hidden" name="workStatus" value="">	
								
				<input type="checkbox"  name="1A" value = "1A" >월요일 오전 <br>
				<input type="checkbox"  name="1B" value = "1B" >월요일 오후 <br>
				<input type="checkbox"  name="2A" value = "2A" >화요일 오전 <br>
				<input type="checkbox"  name="2B" value = "2B" >화요일 오후 <br>
				<input type="checkbox"  name="3A" value = "3A" >수요일 오전 <br>
				<input type="checkbox"  name="3B" value = "3B" >수요일 오후 <br>
				<input type="checkbox"  name="4A" value = "4A" >목요일 오전 <br>
				<input type="checkbox"  name="4B" value = "4B" >목요일 오후 <br>
				<input type="checkbox"  name="5A" value = "5A" >금요일 오전 <br>
				<input type="checkbox"  name="5B" value = "5B" >금요일 오후 <br>
																				
			</div>	
			

			
			
<!-- ---------------------------------------			 -->
<script>
function collectCheckedValues() {
  const allCheckboxes = document.querySelectorAll("input[type='checkbox']");
  const checkedValues = [];

  allCheckboxes.forEach((checkbox) => {
    if (checkbox.checked) {
      checkedValues.push({
        scheduleCode: checkbox.value,
        status: 'Y',
        workStatus: 'Y'
      });
    }
  });

  return checkedValues;
}

function handleSubmit(event) {
	  event.preventDefault();
	  const checkedValues = collectCheckedValues();

	  // 서버로 전송하는 로직
	}
</script>	
			
			
							
</body>
</html>