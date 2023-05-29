<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
//아이디 저장
// $(document).ready(function(){
// 		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
// 	    var key = getCookie("key");
// 	    $("#userId").val(key); 
	     
// 	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
// 	    if($("#userId").val() != ""){ 
// 	        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
// 	    }
	     
// 	    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
// 	        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
// 	            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
// 	        }else{ // ID 저장하기 체크 해제 시,
// 	            deleteCookie("key");
// 	        }
// 	    });
	     
// 	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
// 	    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
// 	        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
// 	            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
// 	        }
// 	    });

// 	// 쿠키 저장하기 
// 	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
// 	function setCookie(cookieName, value, exdays) {
// 		var exdate = new Date();
// 		exdate.setDate(exdate.getDate() + exdays);
// 		var cookieValue = escape(value)
// 				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
// 		document.cookie = cookieName + "=" + cookieValue;
// 	}

// 	// 쿠키 삭제
// 	function deleteCookie(cookieName) {
// 		var expireDate = new Date();
// 		expireDate.setDate(expireDate.getDate() - 1);
// 		document.cookie = cookieName + "= " + "; expires="
// 				+ expireDate.toGMTString();
// 	}
     
// 	// 쿠키 가져오기
// 	function getCookie(cookieName) {
// 		cookieName = cookieName + '=';
// 		var cookieData = document.cookie;
// 		var start = cookieData.indexOf(cookieName);
// 		var cookieValue = '';
// 		if (start != -1) { // 쿠키가 존재하면
// 			start += cookieName.length;
// 			var end = cookieData.indexOf(';', start);
// 			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
// 				end = cookieData.length;
//                 console.log("end위치  : " + end);
// 			cookieValue = cookieData.substring(start, end);
// 		}
// 		return unescape(cookieValue);
// 	}

//--------------------------------유효성검사-------------------------------
$(function(){
	
	//유효성 검사 -- 버튼 눌렀을때 push 알람 띄우기
	$("form").submit(function(){
		
		//validate가 틀렸을경우 리턴값 false
		//validate - 아이디,비밀번호 : 정규화 
		if(validate()){
			console.log("click") 
			return false
		}
		return true
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

//아이디,비밀번호 정규화가 틀렸을 경우 버튼푸시 실패
function validate(){

	//가입하기버튼 눌렀을 때 아이디 유효성검사
	if($('#userId').val()==''){
		$('#userid_msg').html("아이디를 입력해주세요")
		return true;
	}
	
	//가입하기버튼 눌렀을 때 비밀번호 유효성검사
	if($('#userPw').val()==''){
		$('#userpw_msg').html("비밀번호를 입력해주세요")
		return true;
	}
	return false;
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
/* 	background-color:#FFD0AF; */
	border-radius: 7px;
	
}

input{
/* 	border:none; */
	border-bottom: 1px solid;
}

.select{
 	width: 300px;
 	margin: 20px;
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
	width: 310px;
	height: 50px;
}

#kakao{
	width: 310px;
	height: 50px;
}

.noline{
	 text-decoration-line: none;
}
</style>

</head>
<body>

<form action="./login" method="post">

	<h3 style="text-align:center; font-size:30px; color:#E57733	;">Viva</h3><br>
	
	
	<div class="select">
	
		<label for="userId" ></label>
		<input type="text" class="boxcolor" id="userId" name="userId" value="${cookie.id.value}" placeholder="아이디">
		<span id="userid_msg" class="msg" style="color:red"></span>
	</div>
		
	<div class="select">
		<label for="userPw" ></label>
		<input type="password" class="boxcolor" id="userPw" name="userPw" placeholder="비밀번호">
		<span id="userpw_msg" class="msg" style="color:red"></span>
	
	</div>
	
	<div class="select">
		 <label for="rememberId"></label>
        <input type="checkbox" name="rememberId" id="rememberId" ${empty cookie.id.value ? "":"checked" }/>
		아이디 저장
	</div>
			
	<div class="select">
		<button id="btn">로그인</button>
	</div>
	
	<div class="select">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=709641586592b61e7e148fb086efd03f&redirect_uri=http://localhost:8888/users/kakaologin&response_type=code">
			<img id="kakao" src="/resources/img/kakao_login_medium_wide.png">
        </a>
   </div>
		
	<div class="select">
		<a href="./idfind" class="noline">아이디 찾기 | </a>
		<a href="./pwfind" class="noline">비밀번호 찾기 | </a>
		<a href="./join" class="noline">회원가입</a>
	</div>

</form>

</body>
</html>

