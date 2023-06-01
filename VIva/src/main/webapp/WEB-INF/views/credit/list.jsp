<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="../layout/header.jsp"/>   

<style type="text/css">

#CreditStatus{
	width : 800px;
	text-align: -webkit-center;
    position: relative;
    font-size: 30px;
}

#MyCreditAmount {
	border : 1px solid gray;
    display: inline-block;
}
</style>



<div class="FunctionTitle">
   Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>
전체 내역 조회만 구현해놨음<br>
선택 삭제 및 충전/사용/수익/환전 에 따른 필터 구현해야함<br>
회원등급 : ${grade }

<div id="CreditStatus">
	<div id="MyCreditAmount">
		<span>보유한 크레딧 : 0000 </span>
		<a href="./charge"><button id="chargeCredit" class="charge-button">충전하기</button></a>
	</div>
	<!--  회원 등급 0 or 1인지에 따라 visible hidden 처리해줄 예정 -->
	<!--  회원 크레딧 확인 후 환전가능 금액인지에 따라 활성화 비활성화 처리해줄 예정 -->
	<a href="./exchange"><button id="exchangeCredit" class="exchange-button">환전하기</button></a>
</div>

<form>
	<div id="allCheck">	
		<input type="checkbox" name="allCheck" id="allCheck"><label for="allCheck">모두 선택</label>
	</div>
	<div id="delBtn">	
		<button type="button" class="selectDelete_btn">선택 삭제</button>
	</div>
	<div id="order">
		<table class="table">
		  <thead class="table-light">
		    <tr>
		    
		      <th scope="col">
		      	<div class="form-check">
				  <input class="form-check-input" type="checkbox" data-deal-no="${i.dealNo}" id="flexCheckDefault">
				  <label class="form-check-label" for="flexCheckDefault"></label>
				</div>
		      </th>
		      <th scope="col">사용일자</th>
		      <th scope="col">내역</th>
		      <th scope="col">금액</th>
		      <th scope="col">delete</th>
		    </tr>
		  </thead>
		  
		  <c:forEach var="i" items="${list}">

		  <tbody>
				<tr class="cart-item"><!--  첫번째 열 시작-->
					<td><!--  1. 체크박스 -->
						<div class="checkBox">
						  <input class="form-check-input" type="checkbox" name="chBox" data-deal-no="${i.dealNo}">
						</div>
				 	</td>
	
					<td><!--  2. 사용일자 -->
						<span>${i.dealDate}</span>
					</td>
					
					<td><!--  4. 내용 -->	  	  
						<c:if test="${i.dealCategory eq '1'}"><c:out value="크레딧 충전" /></c:if>
				  		<c:if test="${i.dealCategory eq '2'}"><c:out value="음원 구매" /></c:if>
						<c:if test="${i.dealCategory eq '3'}"><c:out value="음원 수익" /></c:if>
						<c:if test="${i.dealCategory eq '4'}"><c:out value="크레딧 환전" /></c:if>
					</td>
					
					<td><!--  5. 금액 -->
						<span>${i.amount} Credit</span>
					</td>
					
					<td class="popup"><!--  6. delete -->

						<img data-deal-no='${i.dealNo}' class="delete-button" alt="삭제" src="../resources/icon/X.png" width="20">

								<!--  삭제 완료 후 떴다 사라지는 메시지 -->
								<!--  html 미완성 -->
								<!--  script 미완성 -->
					</td>
					
				</tr><!--  첫번째 열 End -->
			</tbody><!--  항목들 END-->
			</c:forEach><!--  반복되는 항목들 end-->
			
		</table><!--  orderTable End-->
		
	</div>
</form>
<c:import url ="../layout/footer.jsp"/>