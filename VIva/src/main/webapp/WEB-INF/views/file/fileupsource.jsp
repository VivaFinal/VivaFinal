<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpSource</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
	#source{
		color:grey;
		font-size: 1.5em;

	}
	
	#pack{
		color:grey;
		font-size: 1.5em;
		text-decoration: none;
	}
	


</style>

</head>

<body>
<h1>Source 업로드</h1>
<hr>

<!-- container : div안에있는것들 다 가운데 -->
<div class="container">
<h2> 자신만의 Source로 세상을 움직여주세요</h2>
<a href="/file/fileupsource"><button>Source</button></a>
<a href="/file/fileuppack"><button>Pack</button></a>


<div class="col-10 mx-auto">
<form action="./write" method="post" enctype="multipart/form-data">

<table class="table table-bordered">

<tr>
	<td class="table-info align-middle">제목</td>
	<td><input type="text" name="title" class="form-control" placeholder="회원들에게 보일 제목"></td>
</tr>

<tr>
	<td class="table-info" colspan="2">본문</td>
</tr>
<tr>
	<td colspan="2"><textarea id="content" name="content" class="form-control" placeholder="음원에 대한 간략한 설명을 써주세요!"></textarea>
</table>

<div class="mb-3">
첨부파일
<input type="file" name="file" class="form-control">
</div>

</form>
</div>
<div class="text-center">
	<button type="button" id="btnWrite" class="btn btn-info">작성</button>
	<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>
</div><!-- div.container -->


</body>
</html>