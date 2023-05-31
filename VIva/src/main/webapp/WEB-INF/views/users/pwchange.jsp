<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">


html{
	display:flex;
	height :100vh;
	justify-content: center;
	align-items: center;
	background-color:#FFD0AF;
}

input{ 
	border:2px solid; 
	border-radius: 5px;
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

.noline{
	 text-decoration-line: none;
}
</style>

</head>
<body>

<form action="./pwchange" method="post">
	<h3 style="text-align:center; font-size:30px; color:#E57733	;">Viva</h3><br>

	<div class="select">
		<label for="userPw">변경할 비밀번호</label>
		<input type="text"  id="userPw" name="userPw">
		<span id="userpw_msg" class="msg"></span>
	</div>
	
	<div class="select">
		<label for="userPwCheck">비밀번호 재확인</label>
		<input type="text"  id="userPwCheck" name="userPwCheck">
		<span id="userpwcheck_msg" class="msg"></span>
	</div>
	
	<div class="select">
		<button id="btn">변경하기</button>
	</div>
	
	<div class="select" style=font-size:12px;>아이디를 찾으시겠습니까?
		<a href="./idcheck" class="noline">아이디 찾기 | </a>
		<a href="./login" class="noline">뒤로가기</a>
	</div>
	
</form>
</body>
</html>