<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="../layout/header.jsp"/>  
<style type="text/css">
.exchangeOk_wrap {
	width:1400px;
	margin : 0 auto;
}
#exchangeOk_ment {
	text-align: center;
	font-weight: 600;
}
#exchangeOk_ment img{	/*  상단 체크 */
	width : 100px;
	padding:15px;
}
#exchangeOk_ment div:first-child {
	    width: 100px;
    margin: 0 auto;
}

#exchangeOk_ment h2 {
	font-weight: 900;
}
.exchangeOk_wrap div:nth-child(2) {
	font-size: 23px;
    font-weight: 500;
    text-align: center; 
    margin-top: 30px;
}

.exchangeOk_chargeInfo {	/*  환전 완료된  정보 */
	font-size: 20px;
    margin: 0 auto;
    text-align: center;
	width: 619px;
    height: 454px;
    font-weight : 700;

	background: rgba(251, 251, 251, 0.5);
	mix-blend-mode: normal;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 10px;
	margin-top: 62px;
}

.exchangeOk_chargeInfo dl {
	display : flex;
	flex-direction : row;
	align-items: flex-start;
	overflow : hidden;
	width : 100%;
	padding : 10px 20px 10px;
	letter-spacing : -0.5px;
}

.exchangeOk_chargeInfo dt {
	width: 200px;
}

.price {
	font-weight : 900;
}
.chargeOk_redirect {
	position: absolute;
    left: 345px;
	top: 672px;
	width: 100%;
    text-align: left;
}

.chargeOk_redirect div {
	display : inline-block;
}

.exchangeOk_redirect div:first-child {
    margin: 0 auto;
    width: 330px;
    margin-top: 70px;
}

#chargeRedirect {
	box-sizing: border-box;
	width: 330px;
	height: 55px;
	background: #FFFFFF;
	border: 2px solid #BFBCBC;
	border-radius: 10px;
	font-weight: 700;
	font-size: 20px;
	line-height: 33px;
	align-items: center;
	text-align: center;
	letter-spacing: 0.29em;
	color: #918E8E;
}
#creditListRedirect {
	width: 330px;
	height: 55px;
	background: linear-gradient(197.94deg, #514C9C 5.28%, #653A99 16.47%, #683287 28.24%, #783487 40.56%, rgba(124, 45, 121, 0.95) 56.31%, #78377F 74.5%, #814A7D 83.79%, #8E4669 93.18%, #8E5D7A 99.18%);
	font-weight: 700;
	font-size: 20px;
	line-height: 33px;
	align-items: center;
	text-align: center;
	letter-spacing: 0.29em;
	color: #FFFFFF;
	border-radius: 10px;
	border: 2px solid rgba(129, 74, 125, 0.6);
}

</style>

<div class="FunctionTitle">
   Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>


<section class="exchangeOk_wrap">
	<div id="exchangeOk_ment">
		<div>
			<img alt="exchangeOk" src="/resources/icon/charge_ok_chk.svg">
		</div>
		
	<h2>환전 신청이 완료되었습니다.</h2>
	</div>
	
	
	<div>환전은 신청일로부터 주말, 공휴일 제외 3일 소요됩니다.</div>
	
	<div class="exchangeOk_chargeInfo">
		<dl>
			<dt>환전 받을 크레딧</dt>
			<dd>
				<span class="price">${info.exAmount}</span>
				<span class="price">Credit</span>
			</dd>
		</dl>
		<dl>
			<dt>실제 환전 금액</dt>
			<dd>
				<span class="price">${info.exAmount}</span>
				<span class="price">원</span>
			</dd>
		</dl>
		<dl>
			<dt>크레딧 잔액</dt>
			<dd>
				<span class="price">${headerCredit}</span>
				<span class="price">Credit</span>
			</dd>
		</dl>
		<dl>
			<dt>환전 받을 계좌</dt>
			<dd>
			
				<span><c:if test="${info.bank eq '35'}"><c:out value="경남은행" /></c:if></span>
				<span><c:if test="${info.bank eq '29'}"><c:out value="광주은행" /></c:if></span>
				<span><c:if test="${info.bank eq '7'}"><c:out value="국민은행" /></c:if></span>
				<span><c:if test="${info.bank eq '5'}"><c:out value="기업은행" /></c:if></span>
				<span><c:if test="${info.bank eq '15'}"><c:out value="농협중앙회" /></c:if></span>
				<span><c:if test="${info.bank eq '17'}"><c:out value="농협회원조합" /></c:if></span>
				<span><c:if test="${info.bank eq '25'}"><c:out value="대구은행" /></c:if></span>
				<span><c:if test="${info.bank eq '47'}"><c:out value="도이치은행" /></c:if></span>
				<span><c:if test="${info.bank eq '27'}"><c:out value="부산은행" /></c:if></span>
				<span><c:if test="${info.bank eq '3'}"><c:out value="산업은행" /></c:if></span>
				<span><c:if test="${info.bank eq '41'}"><c:out value="상호저축은행" /></c:if></span>
				<span><c:if test="${info.bank eq '37'}"><c:out value="새마을금고" /></c:if></span>
				<span><c:if test="${info.bank eq '11'}"><c:out value="수협중앙회" /></c:if></span>
				<span><c:if test="${info.bank eq '36'}"><c:out value="신한금융투자" /></c:if></span>
				<span><c:if test="${info.bank eq '60'}"><c:out value="신한은행" /></c:if></span>
				<span><c:if test="${info.bank eq '39'}"><c:out value="신협중앙회" /></c:if></span>
				<span><c:if test="${info.bank eq '9'}"><c:out value="외환은행" /></c:if></span>
				<span><c:if test="${info.bank eq '19'}"><c:out value="우리은행" /></c:if></span>
				<span><c:if test="${info.bank eq '56'}"><c:out value="우체국" /></c:if></span>
				<span><c:if test="${info.bank eq '33'}"><c:out value="전북은행" /></c:if></span>
				<span><c:if test="${info.bank eq '31'}"><c:out value="제주은행" /></c:if></span>
				<span><c:if test="${info.bank eq '68'}"><c:out value="카카오뱅크" /></c:if></span>
				<span><c:if test="${info.bank eq '67'}"><c:out value="케이뱅크" /></c:if></span>
				<span><c:if test="${info.bank eq '59'}"><c:out value="하나은행" /></c:if></span>
				<span><c:if test="${info.bank eq '23'}"><c:out value="한국씨티은행" /></c:if></span>
				<span><c:if test="${info.bank eq '45'}"><c:out value="HSBC은행" /></c:if></span>
				<span><c:if test="${info.bank eq '21'}"><c:out value="SC제일은행" /></c:if></span>
				<span>  </span><span>(${info.accNo})</span>
			</dd>
		</dl>
		<dl>
			<dt>예금주</dt>
			<dd>
				<span>${info.holder}</span>
			</dd>
		</dl>
		<dl>
			<dt>환전 신청 일자</dt>
			<dd>
				<span><fmt:formatDate pattern="yyyy년 MM월 dd일 hh:mm:ss" value="${info.exDate}" /></span>
			</dd>
		</dl>
	</div>
	
	<div class="exchangeOk_redirect">
		<div><button type="button" id="creditListRedirect" onClick="location.href='./list'">크레딧 내역 조회</button></div>
		
		<!--  크레딧 총계 계산하는 로직 넣기 전까지는 얘를 오픈하지 않도록...ㅠㅠㅠ -->
	<!-- 	<div><button type="button" id="exchangeRedirect" onClick="location.href='./exchange'">추가 환전하기</button></div> -->
	</div>
</section>

<c:import url ="../layout/footer.jsp"/> 