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
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@yaireo/tagify@3.1.0/dist/tagify.css" />
  <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify@3.1.0/dist/tagify.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//유효성 검증 에러 메시지 초기화
	
// 	key focus시 출력
	$("#key").focus(function(){
		$("#key_msg").html("key는 C, F, Bb, Eb, Ab, Db, Gb, B, E, A, D, G로 입력해주세요!")
	})
	$("#key").blur(function(){
			$("#key_msg").html("")
	})

// 	bpm focus시 출력
	$("#bpm").focus(function(){
		$("#bpm_msg").html("BPM은 숫자 1~300까지 입력해주세요!")
	})
// 	bpm focus안할시 msg출력
	$("#bpm").blur(function(){
			$("#bpm_msg").html("")
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

// function validate(){
	
// 	//패스워드 입력값 검증 

// 	var keyReg=/C,F,Bb,Eb,Ab,Db,Gb,B,E,A,D,G/
// 	var bpmReg=/^[0-9]+$/
	
// 	if(!keyReg.test($("#key").val())){
// 		$("#key_msg").html("key는 C, F, Bb, Eb, Ab, Db, Gb, B, E, A, D, G로 입력해주세요!")
// 		return false;
// 	}
	
	
// 	//BPM유효성검사
// 	if(!bpmReg.test($("#bpm").val())){
// 		$("#bpm_msg").html("ddddddddddddddddd")
// 	}
	
// 	//유효성 검증성공(submit 수행)
// 	return true
	
// }




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
	width: 505px;
	}
	#key{
	display: inline-block;
	width: 505px;
	}
	#bpm{
	display: inline-block;
	width: 505px;
	}
	#price{
	display: inline-block;
	width: 505px;
	}
	
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
	margin-left: 0px;
/*  	grid-row:span 1;   */
	}
	
	#containerid{
	margin-left: 0px;
	}
	
/*  	.preview{  */
/*  /* 	grid-row:span 2; 그리드 합치기 */ */
/*  	border: 1px solid #d3d3d3;  */
/*  	border-radius: 10px;  */
/*  	}  */
	
/* 	.tag{ */
/* 	display: inline-block; */
/* 	border: 1px solid #d3d3d3; */
/* 	border-radius: 10px; */
/* 	width: 505px; */
/* 	height: 230px; */
/* 	} */
	

	
	.imgfile{
	margin-left: 55px;
	}
	
	#file{
	width: 237px;
	}
	
	.msg{
	color:red;
	font-size: 0.7em;
	padding-left: 80px;
	}
	
	.inputfile{
	display: grid;
	grid-template-columns: 20% 20%;
	margin-left: 0px;
	}
	

	
/* ------------------------------------------------ */
	 .tagify{    
  width: 505px;
  max-width: 700px;
  border-radius: 10px;
}

/* 드롭다운아래에 나오는 애들  */
.tags-look .tagify__dropdown__item{
  display: inline-block;
  padding: .3em .5em;
  border: 1px solid #CCC;
  border-radius: 10px;
  background: #F3F3F3;
  margin: .2em;
  font-size: .85em;
  color: black;
  transition: 0s;
}



.tags-look .tagify__dropdown__item--active{
  color: #BB2649;
  border-radius: 10px;
  
}

/* 드롭다운의 whitelist(내가 설정한 애들) */
.tags-look .tagify__dropdown__item:hover{
  background: lightyellow;
  border-color: gold;
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
		<input type="text" id="bpm" name="bpm" class="form-control" placeholder="BPM를 입력해주세요!"><br>
		<span id="bpm_msg" class="msg"></span>
		<br>
		<label>Price</label>
		<input type="text" id="price" name="price" class="form-control" placeholder="Price" value="30 Credit" disabled="disabled"><br>
		<br>
	
		
	</div>
	
	
	<div class="tag">
	<label>장르</label>
	 <input name='genre' id="genre" class='some_class_name' placeholder='장르를 선택해주세요!'>
  <script>
  var input = document.querySelector('input[name="genre"]');

  var whitelist = ["Trap", "R&B", "Soul", "boombap", "Rock", "Jazz", "House", "Heavy Metal", "Funk", "Reggae", "Folk", "Electro", "House", "Disco", "Pop", "EDM", "Tropical House", "Drum and Bass", "Jungle"];

//initialize Tagify on the above input node reference
  var tagify = new Tagify(input, {
	 	enforceWhitelist: true, 	// 화이트리스트에서 허용된 태그만 사용가능
        whitelist:whitelist, 
        maxTags: 1,
        dropdown: {
          maxItems: 20, 			//드롭다운 메뉴에서 몇개정보 항목을 보여줄지  
          classname: "tags-look", 	//드롭다운 메뉴 엘리먼트 클래스이름 -> css선택자 
          enabled: 0,        		//단어 몇글자 입력했을때 추천 드롭다운 메뉴가 나타날지
          closeOnSelect: true,	//드롭다운 메뉴에서 태그 선택하면 자동으로 꺼지는지 안꺼지는지 
          hide:true
        }
      })
      
//   element.addEventListener(function(){
// 	    tagify.dropdown.hide.call(tagify);
// 	});
//   element.addEventListener(function(){
// 	    tagify.dropdown.hide(tagify)
// 	});
	

  </script>
  <label>악기</label>
  	 <input name='instrument' class='some_class_name' placeholder='악기를 선택해주세요!'>
  <script>
  var input = document.querySelector('input[name="instrument"]');

  var whitelist = ["Drum", "Vocal", "Synth", "Brass", "Woodwinds", "Guitar", "Bass", "String", "ABSET", "Piano"];

  var tagify = new Tagify(input, {
        whitelist:whitelist,
        maxTags: 10,
        dropdown: {
          maxItems: 20,          
          classname: "tags-look", 
          enabled: 0,            
          closeOnSelect: true   
        }
      })
  
//   악기를 선택했을때 이제 더이상 보이지 않게하기
   	if($('input[name="instrument"]').val()!=null){
   		$('input[name="instrument"]').set
	  
	  
  }
  </script>
  
    <label class="detail" style="width: 500px;">악기세부분류</label>
  	 <input name='detail' class='some_class_name' placeholder='세부악기를 선택해주세요!'>
  <script>
//   if($('input[name="instrument"]').val()=="Drum"){
	  
  var input = document.querySelector('input[name="detail"]');
  
  var whitelist = ["Kick","Snare","Hihat","Clap","Tom","Cymbal","Acoustic","808","Fills","Percussion","rimshot"];

  var tagify = new Tagify(input, {
        whitelist:whitelist,
        maxTags: 10,
        dropdown: {
          maxItems: 20,          
          classname: "tags-look", 
          enabled: 0,            
          closeOnSelect: true   
        }
      })
//   }

  </script>
  

  
    <label>분위기</label>
  	 <input name='scape' class='some_class_name' placeholder='분위기를 선택해주세요!'>
  <script>
  var input = document.querySelector('input[name="scape"]');

  var whitelist = ["Wet", "Dry", "Powerful", "Soul", "Beautiful"];

  var tagify = new Tagify(input, {
        whitelist:whitelist,
        maxTags: 10,
        dropdown: {
          maxItems: 20,          
          classname: "tags-look", 
          enabled: 0,            
          closeOnSelect: true   
        }
      })
  </script>
  
      <label>Fx</label>
  	 <input name='fx' class='some_class_name' placeholder='Fx를 선택해주세요!'>
  <script>
  var input = document.querySelector('input[name="fx"]');

  var whitelist = ["Ambience", "Transportation", "Science Fiction", "Animal"];

  var tagify = new Tagify(input, {
        whitelist:whitelist,
        maxTags: 10,
        dropdown: {
          maxItems: 20,          
          classname: "tags-look", 
          enabled: 0,            
          closeOnSelect: true   
        }
      })
  </script>
	
	
	</div>
	
</div> <!-- container -->



<!-- mb 마진바텀 -->
<div class="inputfile">
<div >
이미지파일
<input type="file" id="imgfile" name="imgfile" class="form-control" style="width: 237px;">
</div>
<div>
음원파일 
<input type="file" id="file" name="file" class="form-control">
</div>

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