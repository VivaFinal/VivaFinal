<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script src="/resources/join/join.js" type="text/javascript"></script>

<style type="text/css">

html{
	display:flex;
	height :100vh;
	justify-content: center;
	align-items: center;
/* 	background-color:#FFD0AF; */
}

input{ 
	border:2px solid; 
/*  	border-bottom: 2px solid; */
	border-radius: 5px;
 }

.select{
 	width: 420px;
 	margin: 15px;
}

/* 로그인창으로(뒤로가기)  */
.hre{
	position: fixed;
	bottom: 40px;
    text-decoration-line: none;
    margin-left:450px;
}
 
.select input[type=text]{
	width: 420px;
	height: 35px;

} 
.select input[type=password]{
	width: 420px;
	height: 35px;
} 
.select input[type=email]{
	width: 420px;
	height: 35px;
} 

#btn{
	background-color: black;
	color : white;
	border-radius: 7px;
	width: 430px;
	height: 35px;
}

.msg{
	color:red;
}

/* .userEmail{ */
/* 	width: 420px; */
/* 	height: 35px; */
/* } */

* {
    font-size: 16px;
    font-family: Consolas, sans-serif;
}
</style>

</head>
<body>

<form action="./join" method="post">

	<h3 style="text-align:center; font-size:30px; color:#E57733	;">Viva</h3><br>
	
	<div class="select">
		<label for="userId" >아이디</label><br>
		<input type="text"  id="userId" name="userId"  placeholder="6자 이상, 16자 이하의 영문자,숫자만 가능">
		<span id="userid_msg" class="msg"></span>
	</div>
		
	<div class="select">
		<label for="userPw">비밀번호</label>
		<input type="text"  id="userPw" name="userPw" placeholder="알파벳 대소문자, 숫자, 특수기호 조합으로 6~16자">
		<span id="userpw_msg" class="msg"></span>
	</div>
	
	<div class="select">
		<label for="userpw_check">비밀번호 재확인</label>
		<input type="text"  id="userpw_check" name="userpw_check" >
		<span id="userpwcheck_error" class="msg"></span>
	</div>
	
	<div class="select">
		<label for="userName">이름</label>
		<input type="text"  id="userName" name="userName">
		<span id="username_msg" class="msg"></span>
	</div>
	
	<div class="select">
		<label for="userBirth">생년월일</label>
			     <p><input type="date"></p>
		<span id="usergender_msg" class="msg"></span>
	</div>
	
	<div class="select">
		<label for="userNick">닉네임</label>
		<input type="text"  id="userbirth" name="userbirth">
		<span id="userbirth_msg" class="msg"></span>
	</div>
	
	<div class="select">
		<label for="userEmail">이메일</label>
		<input class="useremail" type="email"  id="userEmail" name="userEmail">
		<span id="useremail_msg" class="msg"></span>
	</div>
	
	<div class="select">
		<label for="userMobile">휴대전화</label>
		<input type="text"  id="userMobile" name="userMobile" pattern="[0-9]+" placeholder="ex)01099999999">
		<span id="usermobile_msg" class="msg"></span>
	</div>
	
	<div class="select">
		<button id="btn">가입하기</button>
	</div>
	
	<a href="./main" class="hre">뒤로가기</a>

</form>

</body>
</html>

