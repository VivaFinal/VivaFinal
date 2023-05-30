<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" /> 

<script type="text/javascript">
$(document).ready(function() {
	$("btnList").click(function() {
		location.href="./list"
	})
	
	$("btnUpdate").click(function() {
		location.href="./update?boardNo=${viewBoard.boardNo}"
	})
})

</script>

<div class="container">

<h1>게시글 상세보기</h1>
<hr>

<table class="big">
<tr>
	<td class="small">글번호</td><td>${viewBoard.boardNo }</td>
</tr>
<tr>
<%-- 	<td class="table-info">아이디</td><td>${viewBoard.userId }</td>
	<td class="table-info">닉네임</td><td>${viewBoard.userNick }</td> --%>
</tr>
<tr>
	<td class="small">조회수</td><td>${viewBoard.boardHit }</td>
	<td class="small">작성일</td><td><fmt:formatDate value="${viewBoard.boardDate }" pattern="yyyy-MM-dd" /></td>
</tr>
<tr>
	<td class="small">제목</td><td>${viewBoard.boardTitle }</td>
</tr>
<tr>
	<td class="small">본문</td>
</tr>
<tr>
	<td>${viewBoard.boardContent }</td>
</tr>
</table>

<!-- 첨부파일 -->
<div class="file">
	<c:if test="${not empty boardFile }">
		<a href="./download?fileNo=${boardFile.fileNo }">${boardFile.originname }</a>
	</c:if>
</div>

<div>
	<button id="btnList">목록</button>
	
<%--  	<c:if test="${id eq viewBoard.userId }"> --%>
 		<button id="btnUpdate">수정</button>
<!-- 		<button id="btnDelete">삭제</button> -->
<%-- 	</c:if> --%>
</div>

</div>


<!-- 댓글 시작 -->

<!-- 댓글 끝 -->



<a href="./list"><button>목록으로</button></a>
