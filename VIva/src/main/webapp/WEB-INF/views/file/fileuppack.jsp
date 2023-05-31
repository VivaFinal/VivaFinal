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
	
	$(document).ready(function() {
		$("#cancel").click(function() {
			history.go(-1)
		})

		//form이 있는데 굳이 또 쓰는이유를 잘모르겠어용
// 		$("#btnWrite").click(function() {
// 			submitContents($("#btnWrite"))
			
// 			$("form").submit();
// 		})
	})
	
		
// 	focus시 아무메세지도 출력 x 
	$("#title").focus(function(){
		$("#title_msg").html("")
	})
// 	아무것도 입력안할시 msg출력
	$("#title").blur(function(){
		if($("#title").val()==""){
			$("#title_msg").html("Pack Title은 필수 입력 항목입니다. Pack Title을 입력해주세요!")
		}
	})
	
	// 	focus시 아무메세지도 출력 x 
	$("#content").focus(function(){
		$("#content_msg").html("")
	})
// 	아무것도 입력안할시 msg출력
	$("#content").blur(function(){
		if($("#content").val()==""){
			$("#content_msg").html("Pack 에 대한 설명은 필수 입력 항목입니다.Pack 설명을 입력해주세요!")
		}
	})
})
</script>

<style type="text/css">

	.guide{
	font-size: 1.0em;
	color: red;
	}
	.source{
		color:grey;
		font-size: 1.5em;
		text-decoration: none;
		margin-right: 10px;
	}
	
	.pack{
		color:grey;
		font-size: 1.5em;
	}
	.title{
	margin-top: 10px;
	margin-bottom: 10px;
	}	
	#title{
	display: inline-block;
	width: 480px;
	}
	
	#content{
	display: inline-block;
 	resize: none; 
	width: 480px;
	}
	
	#sourceName{
	display: inline-block;
	width: 400px;
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
	#sourceTime{
	display: inline-block;
	width: 505px;
	}
	
	
	
	label{
	display: inline-block;
	width:50px;
	text-align: left;
	}
	
	#container{
	display: grid;
	grid-template-columns: 50% 50%;
	width: 1200px;
	margin-left: 0px;
	}
	
	#containerid{
	margin-left: 0px;
	width: 1200px;
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
 	grid-template-columns: 22% 22%; 
 	margin-left: 50px; 
 	width: 1140px;
 	} 
	

	
/* ------------------------------------------------ */
	 .tagify{    
  width: 400px;
  border-radius: 10px;
  margin-right: 0px;
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
<h2> 자신만의 Pack으로 세상을 움직여주세요!</h2>
<div class="guide">
Pack을 올리기전에 <a href="/file/guide">가이드</a>를 확인해주세요!
</div>
<hr>
<a class="source" href="/file/fileupsource">Source</a> 
<a class="pack" href="/file/fileuppack"> Pack</a> 


<br>



<form action="/file/fileupsource" method="post" enctype="multipart/form-data">


<div id="container" >
	
	
		<div class="item">
		<label>제목</label>
		<input type="text" id="title" name="title" class="form-control" placeholder="회원들에게 보일 제목을 써주세요!"><br>
		<span id="title_msg" class="msg"></span>
	<br>
	
	<label>설명</label>
	<textarea id="content" name="content" class="form-control" placeholder="음원에 대한 간략한 설명을 써주세요!" rows="7"></textarea><br>
	<span id="content_msg" class="msg"></span>
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
	
	
	</div>
	
	
	<div class="tag">
  <label>장르</label>
  	 <input name='genre' class='some_class_name' placeholder='장르를 선택해주세요!' >
  <script>
  var input = document.querySelector('input[name="genre"]');

  var whitelist = ["Trap", "R&B", "Soul", "boombap", "Rock", "Jazz", "House", "Heavy Metal", "Funk", "Reggae", "Folk", "Electro", "House", "Disco", "Pop", "EDM", "Tropical House", "Drum and Bass", "Jungle"];
 
  tagify = new Tagify (input, {
      whitelist:whitelist,
      maxTags: 1,
      dropdown: {
        maxItems: 20,          
        classname: "tags-look", 
        enabled: 0,            
        closeOnSelect: true   
      }
    })


  
  </script>
 
  
  
  <label>악기</label>
  	 <input name='instrument' class='some_class_name' placeholder='악기를 선택해주세요!'>
  <script>
  var input = document.querySelector('input[name="instrument"]');

  var whitelist = ["Drum", "Vocal", "Synth", "Brass", "Woodwinds", "Guitar", "Bass", "String", "ABSET", "Piano"];

  var tagify = new Tagify(input, {
        whitelist:whitelist,
        maxTags: 1,
        dropdown: {
          maxItems: 20,          
          classname: "tags-look", 
          enabled: 0,            
          closeOnSelect: true   
        }
      })
  
  </script>
  
    <label class="detail" style="width: 500px;">악기세부분류</label>
  	 <input name='detail' class='some_class_name' placeholder='세부악기를 선택해주세요!'>
  <script>
//   if($('input[name="instrument"]').val()=="Drum"){
	  
  var input = document.querySelector('input[name="detail"]');
  
  var whitelist = ["Kick","Snare","Hihat","Clap","Tom","Cymbal","Acoustic","808","Fills","Percussion","rimshot"];

  var tagify = new Tagify(input, {
        whitelist:whitelist,
        maxTags: 1,
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
        maxTags: 1,
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
        maxTags: 1,
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







<div class="text-center"  style="margin-top: 90px;">
	<button id="btnWrite" class="btn btn-outline-secondary">Upload</button>
	<input type="reset" id="cancel" class="btn btn-outline-danger" value="cancel">
</div>
</form>
</div>
</div>

</body>
</html>