<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



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
	width: 394px;
	}
	
	#content{
	display: inline-block;
	resize: none;
	width: 500px;
	}
	
	label{
	display: inline-block;
	width:50px;
	text-align: left;
	}
	
	.right{
	width: 500px;
	height: 400px;
	border: 1px solid red;
	}
	


</style>

</head>

<body>

<!-- container : div안에있는것들 다 가운데 -->
<div class="container">
<h2> 자신만의 Source로 세상을 움직여주세요!</h2>
<hr>
<a class="source" href="/file/fileupsource">Source</a> 
<a class="pack" href="/file/fileuppack"> Pack</a> 


<br>



<form action="/file/fileuppack" method="post" enctype="multipart/form-data">

<div style="display: inline-block; width: 600px;" >
	<div class="title">
		<label>제목</label>
		<input type="text" id="title" name="title" class="form-control" placeholder="회원들에게 보일 제목을 써주세요!"> 
			Key
			<button 
			 		class="btn btn-outline-secondary dropdown-toggle" 
			 		type="button" data-bs-toggle="dropdown" 
			 		aria-expanded="false">Key
			 	</button>
			 	<ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="#">C</a></li>
				    <li><a class="dropdown-item" href="#">F</a></li>
				    <li><a class="dropdown-item" href="#">Bb</a></li>
				    <li><a class="dropdown-item" href="#">Eb</a></li>
				    <li><a class="dropdown-item" href="#">Ab</a></li>
				    <li><a class="dropdown-item" href="#">Db</a></li>
				    <li><a class="dropdown-item" href="#">Gb</a></li>
				    <li><a class="dropdown-item" href="#">B</a></li>
				    <li><a class="dropdown-item" href="#">E</a></li>
				    <li><a class="dropdown-item" href="#">A</a></li>
				    <li><a class="dropdown-item" href="#">D</a></li>
				    <li><a class="dropdown-item" href="#">G</a></li>
			  	</ul>
	</div>
	<label>설명</label>
	<textarea id="content" name="content" class="form-control" placeholder="음원에 대한 간략한 설명을 써주세요!" rows="7"></textarea>
</div>

<div class="right" style="width: 200px; height: 30px; float: right;"  >




</div>






<!-- mb 마진바텀 -->
<div class="mb-5">
첨부파일
<input type="file" name="file" class="form-control">
</div>



<div class="text-center">
	<button type="button" id="btnWrite" class="btn btn-info">Upload</button>
	<button type="button" id="btnCancel" class="btn btn-danger">Cancel</button>
</div>
</form>
</div>

</body>
</html>