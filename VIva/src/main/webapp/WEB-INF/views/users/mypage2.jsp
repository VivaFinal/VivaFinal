<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"/>
<style type="text/css">
#grid{
	display: grid;
	grid-template-rows: 100px 1000px
}
#colgrid{
	display: grid;
	grid-template-columns: 300px 100px 100px 100px 100px 100px 100px
}
</style>

<div id="wrap">
	<div id="grid">
		<div id="colgrid">
			<div><h1>마이페이지</h1></div>
			<div><h5>회원정보</h5></div>
			<div><h5>내가 쓴글</h5></div>
			<div><h5>내 음원</h5></div>
			<div><h5>결제내역</h5></div>
			<div><h5>문의하기</h5></div>
		</div>	
		<div></div>	
	</div>
</div>




<c:import url="../layout/footer.jsp" />