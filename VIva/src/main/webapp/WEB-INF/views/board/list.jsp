<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
table {
	width: 77%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}
th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}

</style>



<div class="top">
<h1>FREE BOARD</h1>
</div>


<div class="head">
<table>
<thead>
<tr>
	<th>게시글 번호</th>
	<th>카테고리
		<select name="category">
			<option value="자유">자유</option>
			<option value="공지">공지</option>
		</select>
	</th>
	<th>게시글 제목</th>
	<th>닉네임</th>
	<th>조회수</th>
	<th>게시글 작성일</th>
</tr>
</thead>
</div>

<div class="body">
<tbody>
<c:forEach var="boardList" items="${boardList}">
<tr>
	<td>${boardList.boardNo }</td>
	<td>${boardList.categoryType }</td>
	<td><a href="./view?boardNo=${boardList.boardNo }">${boardList.boardTitle }</a></td>
	<td>${boardList. }</td>
	<td>${boardList.boardHit }</td>
	<td><fmt:formatDate value="${boardList.boardDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</tbody>
</div>
</table>

<a href="./write"><button>게시글 작성하기</button></a>
<span class="float-end mb-3">total : ${paging.totalCount }</span>

<c:import url="/WEB-INF/views/layout/paging.jsp" />


<c:import url="/WEB-INF/views/layout/footer.jsp" />


