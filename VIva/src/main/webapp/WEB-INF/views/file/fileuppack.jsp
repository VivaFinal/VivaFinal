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
	#key{
	display: inline-block;
	width:60px;
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
	grid-template-rows: 40px 188px;
	margin-left: 0px;
	}
	
	#containerid{
	margin-left: 0px;
	}
	
	.tag{
/* 	grid-row:span 2; 그리드 합치기*/
	border: 1px solid #d3d3d3;
	border-radius: 10px;
	}

</style>

</head>

<body>
<div class=body>
<!-- container : div안에있는것들 다 가운데 -->
<div id="containerid" class="container" >
<h2> 자신만의 Pack으로 세상을 움직여주세요!</h2>
<hr>
<a class="source" href="/file/fileupsource">Source</a> 
<a class="pack" href="/file/fileuppack"> Pack</a> 


<br>



<form action="/file/fileuppack" method="post" enctype="multipart/form-data">


<div id="container" >
	<div class="item">
		<label>제목</label>
		<input type="text" id="title" name="title" class="form-control" placeholder="회원들에게 보일 제목을 써주세요!">
			Key
			<input type="text" id="key" name="key" class="form-control" placeholder="Key">
	</div>
	
	<div>
	<span style="font-size: 1.5em;">태그</span>
	
	</div>
	
	<div class="item">
	<label>설명</label>
	<textarea id="content" name="content" class="form-control" placeholder="음원에 대한 간략한 설명을 써주세요!" rows="7" style="width: 570px;"></textarea>
	</div>

	
	<div class=tag>
	
	
	</div>
</div> <!-- left -->



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
</div>

</body>
</html>