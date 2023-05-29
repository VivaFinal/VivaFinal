<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>   

<style type="text/css">
#explain{ 
  position: absolute; 
  opacity: 0;
  width: 100px;
  padding: 8px; 
   -webkit-border-radius: 8px; 
   -moz-border-radius: 8px; 
   border-radius: 8px; 
  background: #333333b0;
  color: #fff;
  font-size: 14px; 
  margin-top: 33px;
  display : float;
} 
.source_price {
  width: 200px;
  margin: 100px auto;
  background: #333333b0;
  text-align: center;
}
.source_price div {
  position: relative;
  display: inline-block;
}
.source_price:hover #explain{ 
  opacity: 1; 
  
  
}

#explain:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: ' ';
  border-bottom-color: #333333b0;
}

/* Popup container - can be anything you want */
.popup {
  position: relative;
  display: inline-block;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* The actual popup */
.popup .popuptext {
  visibility: hidden;
  width: 200px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 8px 0;
  position: absolute;
  z-index: 1;
  bottom: 125%;
  left: 50%;
  margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
  visibility: visible;
  -webkit-animation: fadeIn 1s;
  animation: fadeIn 1s;
}
/* Add animation (fade in the popup) */

@-webkit-keyframes fadeIn {
  from {opacity: 0;} 
  to {opacity: 1;}
}

@keyframes fadeIn {
  from {opacity: 0;}
  to {opacity:1 ;}
}
</style>

<div class="FunctionTitle">
	Cart
</div>
<div class="FunctionTitleLine">
	<img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>
${list }
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
				  <input class="form-check-input" type="checkbox" data-cartNum="${i.CART_NO}" id="flexCheckDefault">
				  <label class="form-check-label" for="flexCheckDefault"></label>
				</div>
		      </th>
		      <th scope="col">pack</th>
		      <th scope="col">Filename</th>
		      <th scope="col">Time</th>
		      <th scope="col">Key</th>
		      <th scope="col">Bpm</th>
		      <th scope="col">buy</th>
		      <th scope="col">delete</th>
		    </tr>
		  </thead>
		  
		  <c:forEach var="i" items="${list}">
		  <tbody>
				<tr class="cart-item"><!--  첫번째 열 시작-->
					<td><!--  1. 체크박스 -->
						<div class="checkBox">
						  <input class="form-check-input" type="checkbox" name="chBox" data-cart-no='${i.CART_NO}'>
						</div>
				 	</td>
	
					<td><!--  2. pack 및 소스 앨범아트 -->
						<div class="product_img">
<%-- 							<img alt="이미지 없음" src="./buyafterdownload${i.SOURCE_IMG_STOREDNAME }" width="50"> --%>
						</div>
					</td>
					
					<td><!--  3. 음원 title -->
						<span id="source_title">${i.SOURCE_NAME}</span>
					</td>
					
					<td><!--  4. Time -->
						<span class="timespace"></span>
					</td>
					
					<td><!--  5. Key -->
						<span>${i.KEY}</span>
					</td>
					
					<td><!--  6. Bpm -->
						<span>${i.BPM}</span>
					</td>
					
					<td class="source_price"><!--  7. 바로 구매 -->
						<div>
							<!--  마우스 호버 시, 메시지 뜨는거-->
							<p id = 'explain'>${i.SOURCE_PRICE } credit</p> 
							<img data-source-no='${i.SOURCE_NO}' data-cart-no='${i.CART_NO}' class="buy-button" alt="구매" src="../resources/icon/plus-circle.svg" width="20">
						</div>
					</td>
					
					<td class="popup"><!--  8. 항목 삭제 -->
						<img data-cart-no='${i.CART_NO}' class="delete-button" alt="삭제" src="../resources/icon/X.png" width="20">
<%-- 						<span class="popuptext" id="myPopup${i.CART_NO}">항목이 삭제되었습니다.</span> --%>
<!--  항목 삭제를 누르고 ajax 로 성공 데이터를 받았을 때 popuptext 가 뜨게 하고 싶으나 자꾸 실패~ ㅎㅎㅎ ㅠㅠㅠ -->
					</td>
					
					</tr><!--  첫번째 열 End -->
			</tbody><!--  항목들 END-->
			</c:forEach>
			
		</table><!--  orderTable End-->
		
		<script>
		/*  장바구니 항목 구매 시 ajax 구현 */
		$(document).on('click', '.buy-button', function() {
			var sourceNo = $(this).data('source-no');
			var cartNo = $(this).data('cart-no');
			var $cartItem = $(this).closest('.cart-item'); // .cart-item을 찾아서 저장
			
			console.log(cartNo);
			console.log(sourceNo);
			console.log($cartItem);
			
										 
			$.ajax({
				url: "/cart/buy",
				type: "POST",
				data: {
					cartNo : cartNo,
					sourceNo : sourceNo
				},
				dataType : 'json',
				success: function(response) {
					console.log("ajax 성공");
					console.log(sourceNo);
							                    
					$cartItem.remove(); // $cartItem 변수를 사용하여 항목 제거
				},
				error: function() {
					console.log("AJAX 실패")
				}
			});
		});
		
		
		/*  장바구니 항목 삭제 시 ajax 구현 */
		$(document).on('click', '.delete-button', function() {
			var cartNo = $(this).data('cart-no');
			var $cartItem = $(this).closest('.cart-item'); // .cart-item을 찾아서 저장
			console.log(cartNo);
			console.log($cartItem);
			
										 
			$.ajax({
				url: "/cart/delete",
				type: "GET",
				data: { cartNo: cartNo },
				success: function(response) {
					console.log("ajax 성공");
					console.log(cartNo);
							                    
					$cartItem.remove(); // $cartItem 변수를 사용하여 항목 제거
				},
				error: function() {
					console.log("AJAX 실패")
				}
			});
		});
		/*  하지만 전체 선택 및 부분 선택하여 삭제하는 기능은 미정 ... 수정해야함 !*/						
		</script>

	</div>
</form>
<c:import url ="../layout/footer.jsp"/>