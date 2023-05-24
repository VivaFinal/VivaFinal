<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">

.head, .body {
	 font-family: "typeFont"; 
    src: url('../../resources/font/BalooBhaina2-VariableFont_wght.ttf') 
	text-align: center; 
}

</style>

</head>
<body>

<div class="head">
<h1>게시글 목록</h1>
</div>

<a href="./write"><button>글 작성</button></a>

<div class="body">
<table>
<thead>
<tr>
	<th>게시글 번호</th>
	<th>카테고리</th>
	<th>게시글 제목</th>
	<th>조회수</th>
	<th>게시글 작성일</th>
</tr>
</thead>

<tbody>
<c:forEach var="boardList" items="${boardList}">
<tr>
	<td>${boardList.boardNo }</td>
	<td>${boardList.categoryType }</td>
	<td>${boardList.boardTitle }</td>
	<td>${boardList.boardHit }</td>
	<td>${boardList.boardDate }</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>

</body>
</html>