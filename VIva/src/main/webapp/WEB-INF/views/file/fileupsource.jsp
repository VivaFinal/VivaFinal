<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>


<title>FileUpPack</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$(function(){
	$("form").submit(function(){
		alert("form submitted")
		
		//이벤트 처리 중단 ->submit은 동작함
// 		return 
		
		//이벤트 처리 중단 ->submit도 중단한다
// 		return false

		//-----------------------------------
		//유효성 검증 결과에 따라 submit 중단
		if(!validate() ){
			
			console.log("submit 중단")
// 			alret(1)
			return false
		}
		
		//submit을 진행한다
		console.log("submit 진행")
		alret(2)
// 		$(this).submit()
	})
	
	//유효성 검증 에러 메시지 초기화
	
	$("#key").focus(function(){
		$("#key_msg").html("key는 C, F, Bb, Eb, Ab, Db, Gb, B, E, A, D, G로 입력해주세요!")
	})
	$("#bpm").focus(function(){
		$("#bpm_msg").html("BPM은 숫자 1~300까지 입력해주세요 !")
	})
	
// 	focus시 아무메세지도 출력 x 
	$("#sourceName").focus(function(){
		$("#sourceName_msg").html("")
	})
// 	아무것도 입력안할시 msg출력
	$("#sourceName").blur(function(){
		if($("#sourceName").val()==""){
			$("#sourceName_msg").html("SourceName은 필수 입력 항목입니다. Source Name을 입력해주세요!")
		}
	})
})

//input데이터의 유효성검증
function validate(){
	
	//id유효성 검증
	//아이디를 입력했는지 검증
	if($("#uid").val()==''){
// 		alert('아이디를 입력하세요')
		$("#uid_msg").html("필수 입력 항목입니다")
		
		return false
	}
	
	
	//password유효성 검증
	//패스워드를 입력하지 않았을때
	if($("#upw").val()==''){
		
		$("#upw_msg").html("필수 입력 항목입니다")
		
		return false
	}
	
	//패스워드 입력값 검증 

	var pwReg=/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*\-_+=])[a-zA-Z-0-9!@#$%^&*\-_+=].{8,32}$/
	
	if(!pwReg.test($("#upw").val())){
		$("#upw_msg").html("영문자 대/소문자 특수문자,숫자 포함 8~32자")
		return false;
	}
	//비밀번호 입력확인
	if($("#upw").val() !=$("#upw_check").val()){
		$("#upw_check_msg").html("비밀번호가 일치하지 않습니다")
		return false;
	}
	
	//유효성 검증성공(submit 수행)
	return true
	
}




</script>

<style type="text/css">
	.source{
		color:grey;
		font-size: 1.5em;
		margin-right: 10px;
	}
	
	.pack{
		color:grey;
		font-size: 1.5em;
		text-decoration: none;
	}
	.title{
	margin-top: 10px;
	margin-bottom: 10px;
	}
	
	#sourceName{
	display: inline-block;
	width: 480px;
	}
	#key{
	display: inline-block;
	width: 480px;
	margin-bottom: 10px;
	}
	#bpm{
	display: inline-block;
	width: 480px;
	margin-bottom: 10px;
	}
	#price{
	display: inline-block;
	width: 480px;
	margin-bottom: 10px;
	}
	
/* 	#KBP{ */
/* 	display: inline-block; */
/* 	width:60px; */
/* 	} */
	
	#content{
	display: inline-block;
	resize: none;
	}
	
	label{
	display: inline-block;
	width:50px;
	text-align: left;
	}
	
	#container{
	display: grid;
	grid-template-columns: 50% 50%;
	grid-template-rows: 250px 188px;
	margin-left: 0px;
/*  	grid-row:span 1;   */
	}
	
	#containerid{
	margin-left: 0px;
	}
	
	.preview{
/* 	grid-row:span 2; 그리드 합치기*/
	border: 1px solid #d3d3d3;
	border-radius: 10px;
	}
	
	.tag{
	display: inline-block;
	border: 1px solid #d3d3d3;
	border-radius: 10px;
	width: 480px;
	height: 230px;
	}
	
	#imgfile{
	width: 240px;
	}
	
	#file{
	width: 240px;
	}
	
	.msg{
	color:red;
	font-size: 0.7em;
	padding-left: 80px;
	}
</style>


</head>

<body>
<div class=body>
<!-- container : div안에있는것들 다 가운데 -->
<div id="containerid" class="container" >
<h2> 자신만의 Source로 세상을 움직여주세요!</h2>
<hr>
<a class="source" href="/file/fileupsource">Source</a> 
<a class="pack" href="/file/fileuppack"> Pack</a> 


<br>



<form action="/file/fileupsource" method="post" enctype="multipart/form-data">


<div id="container" >
	
	
	
	<div class="item">
	
		<label>Name</label>
		<input type="text" id="sourceName" name="sourceName" class="form-control" placeholder="Source Name을 써주세요!"> <br>
		<span id="sourceName_msg" class="msg"></span>
		<br>
		<label>Key</label>
		<input type="text" id="key" name="key" class="form-control" placeholder="Key를 입력해주세요!"><br>
		<span id="key_msg" class="msg"></span>
		<br>
		<label>BPM</label>
		<input type="text" id="bpm" name="bpm" class="form-control" placeholder="BPM를 입력해주세요!">
		<br>
		<label>Price</label>
		<input type="text" id="price" name="price" class="form-control" placeholder="Price" value="30Credit" disabled="disabled">
		<br>
	<label>Tag</label>
	<div class = tag>
	여기에 태그 들어온다 
	</div>
		
	</div>
	
	<div class=preview>
	
	
	</div>
	
</div> <!-- container -->



<!-- mb 마진바텀 -->
<div class="mb-5">
이미지파일
<input type="file" id="imgfile" name="imgfile" class="form-control">

음원파일 
<input type="file" id="file" name="file" class="form-control">
</div>



<div class="text-center">
	<button id="btnWrite" class="btn btn-outline-secondary">Upload</button>
	<button id="btnCancel" class="btn btn-outline-danger">Cancel</button>
</div>
</form>
</div>
</div>

</body>
</html>