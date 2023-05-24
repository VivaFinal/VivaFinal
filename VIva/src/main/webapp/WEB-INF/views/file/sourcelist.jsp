<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sourcelist</title>
</head>
<body>

<h1>SourceList</h1>
<hr>
<table border="1">
	<tr>
		<th>Source_no</th>
		<th>Source_name</th>
		<th>BPM</th>
		<th>KEY</th>
		<th>Source_price</th>
		<th>Tag_no</th>
		<th>Pack_no</th>
		<th>User_no</th>
	</tr>
<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.sourceNo }</td>
		<td>${list.sourceName }</td>
		<td>${list.bpm }</td>
		<td>${list.key }</td>
		<td>${list.sourcePrice }</td>
		<td>${list.tagNo }</td>
		<td>${list.packNo }</td>
		<td>${list.userNo }</td>
	</tr>


</c:forEach>
</table>
	



</body>
</html>