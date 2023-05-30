<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

//아이디 중복 검사
$(function(){
	
	$("#id_check").on("click", function(){
		
		var userName = $("#userName").val();
		var userEmail = $("#userEmail").val();
		
		//아이디 찾기시 이름과 이메일 존재여부 확인
		$.ajax({
			type:"get",
			url: " /users/checkIdPw",
			data : {
				"userName":userName,
				"userEmail":userEmail
			},
			success: function(result){
				
				console.log("ajax : " + result);
				//result가 DB에 이름과 닉네임 존재하면 success을 리턴
				if(result != "fail"){
// 					var userId=${userId};
					//이름과 이메일이 존재하므로 span 숨기기
					$(".name_email_input").css("display","none");
					alert('userId')
				}else{
					//이름과 이메일이 일치하지않으므로 span 띄우기
					$(".name_email_input").css("display","inline-block");
				}
				
			}
		})
	})
})

</script>

<style type="text/css">

html{
	display:flex;
	height :100vh;
	justify-content: center;
	align-items: center;
	background-color:#E27DFB; 
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

#id_check{
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

<form action="./idcheck" method="get">

	<h3 style="text-align:center; font-size:30px; color:#EB4646;">Viva</h3><br>
	
	<div class="select">
		<label for="userName" >이름</label>
		<input type="text" id="userName" name="userName">
	</div>
		
	<div class="select">
		<label for="userEmail">이메일</label>
		<input type="text" id="userEmail" name="userEmail">
		<span class="name_email_input">이름과 이메일이 일치하지않습니다</span>
	</div>
	
	<div class="select">
		<button id="id_check">아이디 찾기</button>
	</div>
	
	<div class="select" style=font-size:12px;>비밀번호를 찾으시겠습니까?
	<a href="./pwfind" class="noline">비밀번호 찾기 | </a>
	<a href="./login" class="noline">뒤로가기</a> 
	</div>


</form>

</body>
</html>