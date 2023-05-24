<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.pl{
    width: 200px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 12px 13px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}

.pl:focus{
    border: 1px solid #9B51E0;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 10px;
}


</style>
</head>
<body>

<div style="margin: 0 auto;">

<div class="title" style="width: 40%; height: 200px; border: 1px solid blue; float: left; display: inline-block;">
		<label>제목</label>
		<input type="text" id="title" name="title" class="form-control" placeholder="회원들에게 보일 제목을 써주세요!"> 
		 <label for="Key">Key</label>
		  <select name="key" id="" class="pl">
		 		<option value="0" selected>Key</option>
		      <option value="a">a</option>
		      <option value="b">b</option>
		      <option value="c">c</option>
		      <option value="d">d</option>
		      <option value="e">e</option>
		      <option value="f">f</option>
		      <option value="h">h</option>
		
		  </select>

	<div>
	<label>설명</label>
<!-- 	<input type="text" id="content" name="content" class="form-control" placeholder="음원에 대한 간략한 설명을 써주세요!"  > -->
	<textarea id="content" name="content" class="form-control" placeholder="음원에 대한 간략한 설명을 써주세요!" rows="7"></textarea>
	</div>
	</div>
	
	<!-- col-lg-4는 textarea의 크기  -->
	
	

<div style="width: 40%; height: 200px; border: 1px solid blue; float: left; display: inline-block; ">

ㅂㅂ
</div>
</div>
</body>
</html>