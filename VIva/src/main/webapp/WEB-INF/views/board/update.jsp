<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"))
		
		$("form").submit
	})
})
</script>

<script type="text/javascript">
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})
	
	if( ${empty boardFile}) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	$("#deleteFile").click(function() {
		$("#originFile").toggleClass("through")
		$("#newFile").toggle();	
	})	
})
</script>

<div class="container">
<h1>글 수정</h1>
<hr>

<div class="box">

<form action="./update" method="post" enctype="multipart/form-data">

<input type="hidden" name="boardNo" value="${updateBoard.boardNo }">

<div class="big">
	<label class="middel" for="write">작성자</label>
	<input type="text" id="write" value="${updateBoard.userNick}" class="small" readonly="readonly">
</div>

<div class="big">
	<label class="middel" for"title">제목</label>
	<input type="text" id="title" name="boardTitle" class="small" value="${updateBoard.boardTitle }">
</div>

<div class="big">
	<label class="middel" for"content">본문</label>
	<input type="text" id="content" name="boardContent" class="small" value="${updateBoard.boardContent }">
</div>



<div class="buttons">
	<button class="button" id="btnUpdate">수정하기</button>
	<input type="reset" id="cancel" class="btn" value="취소">
</div>

</form>

</div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "content"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>

</div><!-- .container end -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
