<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">


html{
	display:flex;
	height :100vh;
	justify-content: center;
	align-items: center;
	background-color:#FFD0AF;
}

.name_bord{
	border:none;
	border-bottom: 2px solid;
	background-color:#FFD0AF;
}

 .name_bord2{
 	border-radius: 10px;
 } 

.select{
 	width: 300px;
 	margin: 35px;
 	
}

.select input[type=text]{
	width: 300px;
	height: 35px;

} 
.select input[type=password]{
	width: 300px;
	height: 35px;

} 

#btn{
	background-color: black;
	color : white;
	border-radius: 7px;
	width: 300px;
	height: 35px;
}

#btn2{
	margin-left:130px;
}

.noline{
	 text-decoration-line: none;
}
</style>

</head>
<body>

<form action="./idfind" method="get">

	<h3 style="text-align:center; font-size:30px; color:#E57733	;">아이디 찾기</h3><br>
	
	<div class="select">
		<label for="userName" ></label>
	이름	: <input type="text" id="userName" name="userName" class="name_bord">
	</div>
		
	<div class="select">
		<label for="userMobile"></label>
		<input type="text" id="userMobile" name="userMobile" class="name_bord">
	</div>
	
	<div class="select">
		<button id="btn">인증번호받기</button>
	</div>

	<div class="select">
		<label for="user_number_check"></label>
		<input type="text"  id="user_number_check" name="user_number_check" class="name_bord2" placeholder="인증번호 6자리 숫자입력">
	</div>

	<div class="select">
		<button id="btn2">확인</button>
	</div>
	
	<div class="select" style=font-size:12px;>비밀번호를 찾으시겠습니까?
	<a href="./pwfind" class="noline">비밀번호 찾기 | </a>
	<a href="./login" class="noline">뒤로가기</a> 
	</div>


</form>

</body>
</html>