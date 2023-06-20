<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="../layout/header.jsp"/>   

<style type="text/css">

.admin_exchange_wrap {
	width : 1400px;
	margin : 0 auto;
}

.table  {
	width: 1400px;
	margin : 0 auto;
}
</style>

<div class="FunctionTitle">
   Admin Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>
<div id = "admin_exchange_wrap">
		<!--  테이블 내용 -->
	<div id="order">
		<table  class="table">

		  <!--  테이블 헤드라인 -->
		  <thead class="table-light">
		    <tr>
		      <th scope="col">
		      	<div class="form-check">
				  <input class="form-check-input" type="checkbox" id="flexCheckDefault" name="allCheck" >
				  <label class="form-check-label" for="flexCheckDefault"></label>
			  		
				</div>
		      </th>
		      <th scope="col">환전 신청 일자</th>
		      <th scope="col">회원 정보</th>
		      <th scope="col">환전 금액</th>
		      <th scope="col">은행</th>
		      <th scope="col">계좌번호</th>
		      <th scope="col">예금주</th>
		      <th scope="col">승인 관리자</th>
		      <th scope="col">승인여부</th>
		    </tr>
		  </thead>
		  
		  
		  <!--  테이블 데이터 -->
		  <c:forEach var="i" items="${list}">
		  <tbody>
				<tr class="deal-item"><!--  첫번째 열 시작-->
					<td><!--  1. 체크박스 -->
						<div class="checkBox">
						  <input class="form-check-input chBox" type="checkbox" name="chBox" data-deal-no="num">
						</div>
				 	</td>
					<td><!--  2. 환전신청일자 -->
						<span><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${i.EX_DATE }" /></span>
					</td>
					<td><!--  3. 회원정보 -->
						<span>${i.USER_ID }</span>
					</td>

					<td><!--  5. 신청 금액 -->
						 <fmt:formatNumber value="${i.EX_AMOUNT }" pattern="#,###,###" />
						<span>원</span>
					</td>
					<td><!--  6. 은행 -->
						<span><c:if test="${i.BANK eq '35'}"><c:out value="경남은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '29'}"><c:out value="광주은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '7'}"><c:out value="국민은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '5'}"><c:out value="기업은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '15'}"><c:out value="농협중앙회" /></c:if></span>
						<span><c:if test="${i.BANK eq '17'}"><c:out value="농협회원조합" /></c:if></span>
						<span><c:if test="${i.BANK eq '25'}"><c:out value="대구은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '47'}"><c:out value="도이치은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '27'}"><c:out value="부산은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '3'}"><c:out value="산업은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '41'}"><c:out value="상호저축은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '37'}"><c:out value="새마을금고" /></c:if></span>
						<span><c:if test="${i.BANK eq '11'}"><c:out value="수협중앙회" /></c:if></span>
						<span><c:if test="${i.BANK eq '36'}"><c:out value="신한금융투자" /></c:if></span>
						<span><c:if test="${i.BANK eq '60'}"><c:out value="신한은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '39'}"><c:out value="신협중앙회" /></c:if></span>
						<span><c:if test="${i.BANK eq '9'}"><c:out value="외환은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '19'}"><c:out value="우리은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '56'}"><c:out value="우체국" /></c:if></span>
						<span><c:if test="${i.BANK eq '33'}"><c:out value="전북은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '31'}"><c:out value="제주은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '68'}"><c:out value="카카오뱅크" /></c:if></span>
						<span><c:if test="${i.BANK eq '67'}"><c:out value="케이뱅크" /></c:if></span>
						<span><c:if test="${i.BANK eq '59'}"><c:out value="하나은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '23'}"><c:out value="한국씨티은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '45'}"><c:out value="HSBC은행" /></c:if></span>
						<span><c:if test="${i.BANK eq '21'}"><c:out value="SC제일은행" /></c:if></span>
					</td>
					<td><!--  7. 계좌번호 -->
						<span>${i.ACC_NO }</span>
				
					</td>
					<td><!--  8. 예금주 -->
						<span>${i.HOLDER }</span>
					</td>
					<td><!--  9. 관리자 -->
						<span>${adminId }</span>
					</td>
					<td><!--  10. 승인여부 -->
					<c:choose>
  							<c:when test="${i.ADM_TRANSFER eq 'Y' }">
	  							<div class="form-check form-switch">
								  <input onchange="selectCategoryType()" data-no="${i.EX_NO}" class="form-check-input" value='Y' name="exchangeCheck" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
								  <label class="form-check-label" for="flexSwitchCheckChecked">Checked switch checkbox input</label>
								</div>
  							</c:when>
  							<c:when test="${i.ADM_TRANSFER eq 'N' }">
	  							<div class="form-check form-switch">
		  							<input onchange="selectCategoryType()" data-no="${i.EX_NO}" class="form-check-input" value='N' name="exchangeCheck" type="checkbox" role="switch" id="flexSwitchCheckDefault">
		  							<label class="form-check-label" for="flexSwitchCheckDefault">환전 전</label>
								</div>
  							</c:when>
					</c:choose>
					</td>
					
				</tr><!--  첫번째 열 End -->
			</tbody><!--  항목들 END-->
			</c:forEach>
		</table><!--  orderTable End-->
	</div>

</div>

<c:import url ="../layout/footer.jsp"/>