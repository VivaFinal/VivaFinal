<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">

.head {
	text-align: center; 
}
.body {
	text-align: center; 
}


</style>


<div class="head">
<h1>게시글 목록</h1>
</div>

<a href="./write"><button>글 작성</button></a>

<div class="body">
<table>
<thead>
<tr>
	<th>게시글 번호</th>
	<select name="category">
		<option value="자유">자유</option>
		<option value="공지">공지</option>
	</select>
	<th>게시글 제목</th>
	<th>닉네임</th>
	<th>조회수</th>
	<th>게시글 작성일</th>
</tr>
</thead>

<tbody>
<c:forEach var="boardList" items="${boardList}">
<tr>
	<td>${boardList.boardNo }</td>
	<td>${boardList.categoryType }</td>
	<td><a href="./view?boardNo=${boardList.boardNo }">${boardList.boardTitle }</a></td>
	<td>${boardList.userNick }
	<td>${boardList.boardHit }</td>
	<td><fmt:formatDate value="${boardList.boardDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
