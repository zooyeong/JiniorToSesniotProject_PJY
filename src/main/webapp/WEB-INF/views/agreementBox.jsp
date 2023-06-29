<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	.agreementBox{
		width: 900px;
		height: 100%;
	}
	.agreement {  /*이미지 고정, 텍스트 스크롤 */
		border: 1px solid black;
		overflow: scroll;
		width: 700px;
		height: 100px;
	}
</style>
</head>
<body>

	<div class="agreementBox">
	
	<div class="agreement">
		<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta a, obcaecati assumenda eaque ratione sint
			nesciunt voluptatibus odio, iusto eos repudiandae ea! Sunt, quod velit cupiditate numquam voluptate explicabo
			blanditiis. Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus cupiditate velit porro eius
			nulla, expedita cum quos laudantium consectetur assumenda officiis ea quo fugit aperiam debitis dolore sequi,
			itaque nam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta a, obcaecati assumenda eaque ratione sint
			nesciunt voluptatibus odio, iusto eos repudiandae ea! Sunt, quod velit cupiditate numquam voluptate explicabo
			blanditiis. Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus cupiditate velit porro eius
			</p>
	</div>
	<div class="first_agree">
	동의<input type="checkbox" id= "agree_code_01" name="agree_code_01" value="Y" checked>
	</div>
	<div class="agreement">
		<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta a, obcaecati assumenda eaque ratione sint
			nesciunt voluptatibus odio, iusto eos repudiandae ea! Sunt, quod velit cupiditate numquam voluptate explicabo
			blanditiis. Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus cupiditate velit porro eius
			nulla, expedita cum quos laudantium consectetur assumenda officiis ea quo fugit aperiam debitis dolore sequi,
			itaque nam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta a, obcaecati assumenda eaque ratione sint
			nesciunt voluptatibus odio, iusto eos repudiandae ea! Sunt, quod velit cupiditate numquam voluptate explicabo
			</p>
	</div>	
	<div class="second_agree">
	동의<input type="checkbox" id= "agree_code_02" name="agree_code_02" value="Y" checked>
	</div>	
	<div class="agreement">
		<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta a, obcaecati assumenda eaque ratione sint
			nesciunt voluptatibus odio, iusto eos repudiandae ea! Sunt, quod velit cupiditate numquam voluptate explicabo
			blanditiis. Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus cupiditate velit porro eius
			nulla, expedita cum quos laudantium consectetur assumenda officiis ea quo fugit aperiam debitis dolore sequi,
			itaque nam.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta a, obcaecati assumenda eaque ratione sint
			</p>
	</div>
		<div class="third_agree">
	동의<input type="radio" class= "agree_code_03" id="agree_code_03Y"  name="agree_code_03" value="Y" checked> 비동의<input type="radio" class= "agree_code_03" id="agree_code_03N" name="agree_code_03" value="N" >
	</div>
	</div>

</body>
</html>