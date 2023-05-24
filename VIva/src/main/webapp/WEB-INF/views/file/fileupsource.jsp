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
	
	#input{
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
	
	#file{
	width: 240px;
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
		<input type="text" id="input" name="sourceName" class="form-control" placeholder="Source Name을 써주세요!"> 
		<br>
		<label>Key</label>
		<input type="text" id="input" name="key" class="form-control" placeholder="Key를 입력해주세요!">
		<br>
		<label>BPM</label>
		<input type="text" id="input" name="bpm" class="form-control" placeholder="BPM를 입력해주세요!">
		<br>
		<label>Price</label>
		<input type="text" id="input" name="price" class="form-control" placeholder="Price" value="30Credit" disabled="disabled">
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
<input type="file" id="file" name="file" class="form-control">

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