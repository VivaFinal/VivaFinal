<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"/>
<style type="text/css">
#grid{
	display: grid;
	grid-template-rows: 80px
}
#colgrid{
	display: grid;
	grid-template-columns: 300px 200px 200px 200px 200px 200px 
}
 #colgrid2{ 
 	display: grid;
 	grid-template-columns: 250px 800px 250px 
 }
 
 #colgrid3{
 	display:grid;
 	grid-template-columns: 400px 400px
 }
 
.items{
	padding: 1rem 0;
	padding-bottom: 0px;
	border-bottom: 1px solid #ccc;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    min-height: 5rem;
    font-size:20px;
}

a {
  text-decoration-line: none;
  color:black;
}
#wrap{
	padding-left: 16px;
}
.contentMiddle{
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
}
.contentSmall{
	font-size:20px;
}
</style>

<div id="wrap">
	<div id="grid">
		<div id="colgrid">
			<div class="items"><h1>마이페이지</h1></div>
			<div class="items"><a href="">회원정보</a></div>
			<div class="items"><a href="">내가 쓴글</a></div>
			<div class="items"><a href="">내 음원</a></div>
			<div class="items"><a href="">결제내역</a></div>
			<div class="items"><a href="">문의하기</a></div>
		</div>	
		
		<div id="colgrid2">
			<div class="contentSide"></div>		
			<div class="contentMiddle">
				<div id="colgrid3">
					<div class="contentSmall">프로필</div>
					<div class="contentSmall">프로필 사진</div>
					<div class="contentSmall">아이디</div>
					<div class="contentSmall">이름</div>
					<div class="contentSmall">닉네임</div>
					<div class="contentSmall">생일</div>
					<div class="contentSmall">이메일</div>
					<div class="contentSmall">연락처</div>
				</div>
			</div>		
			<div class="contentSide"></div>		
		</div>
		
	</div>
</div>


<c:import url="../layout/footer.jsp" />