<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<style type="text/css">

.head {
	font-family:"typeFont";
	 src: url('../../resources/font/BalooBhaina2-VariableFont_wght.ttf')
	text-align: center; 
}

.body {
	font-family:"typeFont";
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
	<th>게시글 제목</th>
	<th>카테고리</th>
	<th>작성자 닉네임</th>
	<th>조회수</th>
	<th>게시글 작성일</th>
</tr>
</thead>

<c:forEach var="list" items="${list}">
<tbody>
<tr>
	<td>${list.boardNo }</td>
	<td>${list.boardTitle }</td>
	<td>${list.categoryType }</td>
	<td>${list.userNick }</td>
	<td>${list.boardHit }</td>
	<td>${list.boardDate }</td>
</tr>
</tbody>
</c:forEach>
</table>
</div>

</body>
</html>