<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- <script src="/resources/join/join.js" type="text/javascript"></script> -->

<script type="text/javascript">

//1. 처음 포커스 벗어났을 경우 메시지 띄우기
$(function(){
	
 	//아이디에 포커스
	$("#userId").focus()
	
	//아이디를 입력하지 않고 넘어갈 경우(필수 정보입니다 띄우기)
	$("#userId").blur(function(){
		if($("#userId").val()==''){
			$("#userid_msg").html("필수정보입니다")
		}else{
			$("#userid_msg").html("")
		}
	})
	
	//비밀번호를 입력하지 않고 넘어갈 경우(필수 정보입니다 띄우기)
	$("#userPw").blur(function(){
		if($("#userPw").val()==''){
			$("#userpw_msg").html("필수정보입니다")
		}else{
			$("#userpw_msg").html("")
		}
	})
	
	//tab으로 다음칸으로 넘어갔을 경우  -- blur function
	////비밀번호입력과 비밀번호 재확인입력이 동일하지않을 경우 메시지
	$("#userpw_check").blur(function(){	
		
		if($("#userPw").val() != $("#userpw_check").val()){
			$("#userpwcheck_error").html("비밀번호가 일치하지않습니다")
		}else{
			$("#userpwcheck_error").html("비밀번호가 일치합니다")
		}
	})
	
	//비밀번호 재확인칸을 클릭했을 경우 -- click function
	//비밀번호입력과 비밀번호 재확인입력이 동일하지않을 경우 메시지
	$("#userpw_check").click(function(){	
		
		if($("#userPw").val() != $("#userpw_check").val()){
			$("#userpwcheck_error").html("비밀번호가 일치하지않습니다")
		}else{
			$("#userpwcheck_error").html("비밀번호가 일치합니다")
		}
	})
	
	
	//이름을 입력하지 않고 넘어갈 경우(필수 정보입니다 띄우기)
	$("#userName").blur(function(){
		if($("#userName").val()==''){
			$("#username_msg").html("필수정보입니다")
		}else{
			$("#username_msg").html("")
		}
	})
	
})
//----------------------------------------------------------------------------------------

//2. 버튼 클릭했을 경우 아이디,비밀번호,이름,생년월일 정규화가 맞지않으면 메시지 띄우기
$(function(){
	
	//유효성 검사 -- 버튼 눌렀을때 push 알람 띄우기
	$("form").submit(function(){
		
		//validate가 틀렸을경우 리턴값 false
		//validate - 아이디,비밀번호 : 정규화 
		if(!validate()){
			return false
		}
		
		return true;
	})
	
	//아이디 입력란 클릭시 밑에 메시지 없애기
	$("#userId").focus(function(){
		$("#userid_msg").html("")	
	})
	//비밀번호 입력란 클릭시 밑에 메시지 없애기
	$("#userPw").focus(function(){
		$("#userpw_msg").html("")	
	})
	//이름 입력란 클릭시 밑에 메시지 없애기
	$("#userName").focus(function(){
		$("#username_msg").html("")	
	})
})

//아이디,비밀번호,이름,생년월일 정규화가 틀렸을 경우 버튼푸시 실패
function validate(){

	//가입하기버튼 눌렀을 때 아이디 유효성검사
	if($('#userId').val()==''){
		$('#userid_msg').html("아이디를 입력해주세요")
		return false
	}
	
	//아이디 정규화
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	
	if(!idReg.test($("#userId").val())){
			$("#userid_msg").html("아이디는 6자 이상, 20자 이하의 영문자,숫자만 가능합니다!")
			return false
	}
	
	//가입하기버튼 눌렀을 때 비밀번호 유효성검사
	if($('#userPw').val()==''){
		$('#userpw_msg').html("비밀번호를 입력해주세요")
		return false
	}
	
	//비밀번호 정규화
    var pwReg =/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
		   
	if( !pwReg.test( $("#userPw").val() ) )  {
	      $("#userpw_msg").html("비밀번호는 알파벳 대소문자, 숫자, 특수기호 조합으로 8자 이상, 20자 이하로 작성하세요")
	      return false
	}
    
  	//가입하기버튼 눌렀을 때 이름 유효성검사
	if($('#userName').val()==''){
		$('#userName_msg').html("이름을 입력해주세요")
		return false
	}

  	//이름 정규화
  	var nameReg = /^[가-힣]{1,10}$/

	if( !nameReg.test( $("#userName").val() ) )  {
      $("#username_msg").html("이름은 10자이내 한글만 가능합니다!")
      return false
	}
  	return true;
  
}

//3. 버튼 클릭했을 경우 비밀번호와 비밀번호 재확인이 일치하지 않으면 메시지 띄우기
$(function(){
	
	//유효성 검사 -- 버튼 눌렀을때 push 알람 띄우기
	$("form").submit(function(){
		
		//validate가 틀렸을경우 리턴값 false
		//compare_check - 비밀번호,비밀번호재확인 일치 
		if(!compare_check()){
			return false
		}
		return true;
	})
})
//버튼을 클릭했을 경우 비밀번호와 비밀번호재확인이 일치하지않으면 버튼푸시 실패
//비밀번호와 비밀번호 재확인 입력 유효성검사
function compare_check(){
	
	//가입하기버튼 눌렀을 때 비밀번호 확인 유효성 검사
	if($("#userPw").val() != $("#userpw_check").val()){
		$("#userpwcheck_error").html("비밀번호가 일치하지않습니다")
		return false;
	}
	return true
}

//아이디 중복 검사
$(function(){
	
	$(".id_input").on("click", function(){
		
		var userId = $("#userId").val();
		var data = {userId : userId}

		if(userId == ''){
			$('#userid_msg').html("아이디를 입력해주세요")
			return
		}
		
		//회원가입시 아이디 중복검사
		$.ajax({
			type:"get",
			url: " /users/userIdChk",
			data : data,
			success: function(result){
				//
				if(result != "fail"){
					//중복아이디가 없어서 사용가능한 아이디입니다
					$(".id_input1").css("display","inline-block");
					//span input2는 안보이게
					$(".id_input2").css("display","none");
				}else{
					//중복아이디이므로 '아이디가 이미 존재합니다' 띄우기
					$(".id_input1").css("display","none");
					$(".id_input2").css("display","inline-block");
				}
				
			}
		})
		
	})
	
	//닉네임 중복 검사
	$(".nick_input").on("click", function(){
	// 		console.log("keyup 테스트");
	
		var userNick = $("#userNick").val();
		var data = {userNick : userNick}
		
		if(userNick == ''){
			$('#usernick_msg').html("닉네임을 입력해주세요")
			return
		}
		
		$.ajax({
			type:"get",
			url: " /users/userNickChk",
			data : data,
			success: function(result){
				//
				if(result != "fail"){
					//중복아이디가 없어서 사용가능한 닉네임입니다
					$(".nick_input1").css("display","inline-block");
					//span input2는 안보이게
					$(".nick_input2").css("display","none");
				}else{
					//중복닉네임이므로 '닉네임 이미 존재합니다' 띄우기
					$(".nick_input1").css("display","none");
					$(".nick_input2").css("display","inline-block");
				}
				
			}
		})
	})
})

$(function(){
	
	//회원가입시 이메일인증(ajax) 
	$('#mail-Check-Btn').click(function() {
		const email = $('#userEmail').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		var userEmail = $("#userEmail").val();
		
		if( userEmail == '' ) {
			$('#mail-check-warn').html("이메일을 입력해주세요")
			return
		}
		
		$.ajax({
			type : 'get',
			url : '/users/mailCheck?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	}); // end send email
	
	var isCertification = false;
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			isCertification = true;
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			isCertification = false;
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
			
		}
	
	});
	
    //이메일 입력란 클릭시 밑에 메시지 없애기
	$("#userEmail").focus(function(){
		$("#mail-check-warn").html("")	
	})
	
	//인증번호가 다르면 sumit 안되게
	 $('#btn').click(function() {
	     if(!isCertification){
	         alert('인증이 완료되지 않았습니다.');
	         return false;
	      }else{
	         return true;
	      }

	})
})	

</script>
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
 	width: 420px;
 	margin: 15px;
 	position: relative;
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

.msg, #mail-check-warn{
	color:red;
}

* {
    font-size: 16px;
    font-family: Consolas, sans-serif;
}

#chk_btn{
	padding:0px 0px 0px 0px;
}

/* 중복아이디 존재하지 않으면 */
.id_input1{
	color:green;
	display:none;
}

/* 중복아이디 존재한다면 */
.id_input2{
	color:red;
	display:none;
}
/* 중복닉네임 존재하지 않으면 */
.nick_input1{
	color:green;
	display:none;
}

/* 중복닉네임 존재한다면 */
.nick_input2{
	color:red;
	display:none;
}
/* 아이디중복확인 버튼 */
.id_input{
	position: absolute;
	top: 30px;
	right: -120px;
}
/* 이메일 @.com 뒤에꺼 버튼 */
.form-controll{
	position: absolute;
	top: 30px;
	right: -147px;
}
/* 닉네임중복확인 버튼 */
.nick_input{
	position: absolute;
	top: 27px;
	right: -145px;
}
.btn-btn-primary{
	position: absolute;
	top: 71px;
	right:101px;
}
.mail-check-input{
	margin-top:10px;
}

</style>

</head>
<body>

<form action="./join" method="post">

	<h3 style="text-align:center; font-size:30px; color:#E57733;">Viva</h3><br>
	
	<div class="select">
		<label for="userId" >아이디</label><br>
		<input type="text"  id="userId" name="userId"  placeholder="6자 이상, 20자 이하의 영문자,숫자만 가능">
		<span id="userid_msg" class="msg"></span>
		<button type="button" value="ID중복확인" class="id_input">ID중복확인</button>
		<span class="id_input1">사용 가능한 아이디입니다.</span>
		<span class="id_input2">아이디가 이미 존재합니다.</span>
	</div>
		
	<div class="select">
		<label for="userPw">비밀번호</label>
		<input type="text"  id="userPw" name="userPw" placeholder="알파벳 대소문자, 숫자, 특수기호 조합으로 8~20자">
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
		 <input type="date"  id="userBirth" name="userBirth" required="required">
<!-- 			<input type="text" name="userBirth" placeholder="YYYY/MM/DD" > -->
		<span id="userbirth_msg" class="msg"></span>
	</div>
	
	<div class="select">
		<label for="userNick">닉네임</label>
		<input type="text"  id="userNick" name="userNick" required="required">
		<span id="usernick_msg" class="msg"></span>
		<button type="button" value="닉네임중복확인" class="nick_input">닉네임중복확인</button>
		<span class="nick_input1">사용 가능한 닉네임입니다.</span>
		<span class="nick_input2">닉네임이 이미 존재합니다.</span>
	</div>
	
	<div class="select">
		<label for="userEmail">이메일</label>
		<input class="userEmail" type="text"  id="userEmail" name="userEmail" placeholder="이메일" required="required">
		<select class="form-controll" id="userEmail2" name="userEmail2">
			<option>@naver.com</option>
			<option>@daum.net</option>
			<option>@gmail.com</option>
			<option>@hanmail.com</option>
			<option>@yahoo.co.kr</option>
		</select>
		<div class="mail-check-box">
			<input class="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
		</div>
		
		<div class="input-group-addon">
			<button type="button" class="btn-btn-primary" id="mail-Check-Btn">인증코드전송</button>
		</div>
		
		<div>
			<span id="mail-check-warn" class="msg"></span>
		</div>
	</div>	
	
	<div class="select">
		<label for="userMobile">휴대전화</label>
		<input type="text"  id="userMobile" name="userMobile" pattern="[0-9]+" placeholder="ex)01099999999" required="required">
		<span id="usermobile_msg" class="msg"></span>
	</div>
	
	<div class="select">
		<button id="btn">가입하기</button>
	</div>
	
	<a href="./login" class="hre">뒤로가기</a>

</form>

</body>
</html>

