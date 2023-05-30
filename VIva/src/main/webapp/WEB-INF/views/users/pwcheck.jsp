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

.noline{
	 text-decoration-line: none;
}

</style>

</head>
<body>

<form action="" method="get">

	<h3 style="text-align:center; font-size:30px; color:#E57733	;">비밀번호 찾기</h3><br>
	
	<div class="select" style="text-align:center; font-size:20px;">비밀번호를 찾고자하는 아이디를 입력해주세요.</div>
	
	<div class="select">
		<label for="userid"></label>
		<input type="text"  id="userid" name="userid" class="name_bord2" placeholder="아이디">
	</div>
	
	<div class="select">
		<button id="btn">다음</button>
	</div>

			
		
	<div class="select" style=font-size:12px;>아이디를 찾으시겠습니까?
		<a href="./idcheck" class="noline">아이디 찾기 | </a>
		<a href="./login" class="noline">뒤로가기</a>
	</div>
	
</form>

</body>
</html>