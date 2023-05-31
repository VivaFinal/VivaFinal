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

input{ 
	border:2px solid; 
	border-radius: 5px;
 }

.select{
 	width: 300px;
 	margin: 35px;
 	position: relative;
}

.select input[type=text]{
	width: 300px;
	height: 35px;

} 
.select input[type=password]{
	width: 300px;
	height: 35px;

} 

#pw_check{
	background-color: black;
	color : white;
	border-radius: 7px;
	width: 300px;
	height: 35px;
}

.noline{
	 text-decoration-line: none;
}

/* 이메일 @.com 뒤에꺼 버튼 */
.form-controll{
	position: absolute;
	top: 31px;
 	right:  -133px; 
}

.btn-btn-primary{
	position: absolute;
	top: 71px;
	right:43px;
}

.mail-check-input{
	margin-top:10px;
}

</style>

<script type="text/javascript">


//비밀번호찾기 이메일인증(ajax) 
$(function(){
		
	var isCertification = false;
	$('#mail-Check-Btn').click(function() {
		const email = $('#userEmail').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
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
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
		}
	});
	
	// 인증번호가 다르면 sumit 안되게
    $('#pw_check').click(function() {
       if(!isCertification){
          alert('인증이 완료되지 않았습니다.');
          return false;
       }else{
          return true;
       }
    })
    
    //비밀번호 찾기를 눌렀을 때 ajax를 이용하여 DB에 아이디, 이메일이 존재하면 pwchange 페이지로 넘기기
	$("#pw_check").on("click", function(){
		
		var userId = $("#userId").val();
		var userEmail = $("#userEmail").val();
		
		console.log(userId)
		console.log(userEmail)
		
		//비밀번호 찾기시 아이디과 이메일 존재여부 확인
		$.ajax({
			type:"get",
			url: " /users/checkIdEmail",
			data : {
				"userId":userId,
				"userEmail":userEmail
			},
			dataType : "json",
			success:function(res){
				
				//result가 DB에 이름과 닉네임 존재하면 success을 리턴
				if(res.result == true){
// 					alert("당신의 아이디는 : "+res.userId)
					location.href="./pwchange"
				}
			}, error: function() {
				console.log("ajax 실패")
				alert("아이디, 이메일이 일치하지않습니다")
				location.href="./pwcheck"
			}
		})
	})
})	

// function valid(){
// 	//이메일칸에 이메일을 적지않으면 본인인증 클릭 불가
// 		if($('#userEmail').val()==''){
// 			return false;
// 		}
// 	return true;
// }
</script>

</head>
<body>

	<h3 style="text-align:center; font-size:30px; color:#E57733	;">Viva</h3><br>
	
	<div class="select">
		<label for="userid">아이디</label>
		<input type="text"  id="userid" name="userid" class="name_bord2">
	</div>
	
	<div class="select">
		<label for="userEmail">이메일</label>
		<input class="userEmail" type="text"  id="userEmail" name="userEmail">
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
			<button type="button" class="btn-btn-primary" id="mail-Check-Btn">본인인증</button>
		</div>
		
		<div>
			<span id="mail-check-warn" class="msg"></span>
		</div>
	</div>
	
	<div class="select">
		<button id="pw_check" class="auth">비밀번호 찾기</button>
	</div>
		
	<div class="select" style=font-size:12px;>아이디를 찾으시겠습니까?
		<a href="./idcheck" class="noline">아이디 찾기 | </a>
		<a href="./login" class="noline">뒤로가기</a>
	</div>
</body>
</html>