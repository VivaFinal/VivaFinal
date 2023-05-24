<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="text-center">
<c:if test="${empty login }">
<button onclick="location.href='./login'">로그인</button>
<button onclick="location.href='./join'">회원가입</button>
</c:if>
	
<c:if test="${not empty login and login}">
<button onclick="location.href='./login'">게시판</button>
<button onclick="location.href='./logout'">로그아웃</button>
</c:if>
</div>
	
</body>
</html>