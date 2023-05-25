<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}


$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})

	
	$("#btnWrite").click(function() {
		submitContents($("#btnWrite"))
		
		$("form").submit();
	})
})
</script>


<style type="text/css">

.container {
	font-family: "typeFont"; 
    src: url('../../resources/font/BalooBhaina2-VariableFont_wght.ttf') 
	text-align: center; 
}

</style>


<div class="container">
<h1>글 작성</h1>
<hr>
<div class="box">

<form action="./write" method="post" enctype="multipart/form-data">

<div class="form-group">
	<label class="form-label" for="write">작성자 닉네임</label>
	<input type="text" id="write" name="nick" value="${userNick }" class="form-control">
</div>

<div class="form-group">
	<label class="form-label" for="title">제목</label>
	<input type="text" id="title" name="title" class="form-control">
</div>

<div class="form-group">
	<label class="form-label" for="content">본문</label>
	<input type="text" id="content" name="content" class="form-control">
</div>

<div class="form-group">
	<label class="form-label" for="file">첨부파일</label>
	<input type="file" id="file" name="file" class="form-control">
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>

</form>

</div>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />