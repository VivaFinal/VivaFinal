<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

$(function(){
	
	//유효성 검사 -- 버튼 눌렀을때 push 알람 띄우기
	$("form").submit(function(){
		
		//validate가 틀렸을경우 리턴값 false
		//validate - 아이디,비밀번호 : 정규화 
		if(!validate()){
			return false
		}
	})
	
	//아이디 입력란 클릭시 밑에 메시지 없애기
	$("#userId").focus(function(){
		$("#userid_msg").html("")	
	})
	//비밀번호 입력란 클릭시 밑에 메시지 없애기
	$("#userPw").focus(function(){
		$("#userpw_msg").html("")	
	})
	
})

//아이디,비밀번호 공백인 경우 버튼푸시 실패
function validate(){

	//로그인버튼 눌렀을 때 아이디 유효성검사
	if($('#userId').val()==''){
		$('#userid_msg').html("아이디를 입력해주세요")
		return false
	//로그인버튼 눌렀을 때 비밀번호 유효성검사
	if($('#userId').val()==''){
		$('#userid_msg').html("아이디를 입력해주세요")
		return false
	}

</script>

<style type="text/css">


html{
	display:flex;
	height :100vh;
	justify-content: center;
	align-items: center;
/* 	background-color:#FFD0AF; */
}

.boxcolor{
	background-color:#FFD0AF;
	border-radius: 7px;
	
}

input{
/* 	border:none; */
	border-bottom: 1px solid;
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

<form action="./login" method="post">

	<h3 style="text-align:center; font-size:30px; color:#E57733	;">로그인 화면</h3><br>
	
	
	<div class="select">
	
		<label for="userId" ></label>
		<input type="text" class="boxcolor" id="userId" name="userId"  placeholder="아이디">
		<span id="userid_msg" class="msg" style="color:red"></span>
	</div>
		
	<div class="select">
		<label for="userPw" ></label>
		<input type="password" class="boxcolor" id="userPw" name="userPw" placeholder="비밀번호">
		<span id="userpw_msg" class="msg" style="color:red"></span>
	
	</div>
	
	<div class="select">
		<input type="checkbox" value="1">아이디 저장
		<span id="login_error" class="msg" style="color:red"></span>
	</div>
			
	<div class="select">
		<button id="btn">로그인</button>
	</div>
		
	<div class="select">
		<a href="./idfind" class="noline">아이디 찾기 | </a>
		<a href="./pwfind" class="noline">비밀번호 찾기 | </a>
		<a href="./join" class="noline">회원가입</a>
	</div>

</form>

</body>
</html>

