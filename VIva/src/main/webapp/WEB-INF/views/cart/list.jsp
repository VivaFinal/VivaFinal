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
#insufficientCredit {
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
선택 삭제, 선택 구매 구현함.
전체 선택에 따른 기능 구현과 음원페이지 이동 및 구매와 동시에 다운로드 기능 구현해야함.
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
								
								<!--  구매 클릭 시, 잔액 부족하면 뜨는 메시지 -->
								<!--  script 미완성 -->
<!-- 								<p id = 'insufficientCredit'>크레딧이 부족합니다!</p> -->
								
								<!--  구매 클릭 시, 잔액 부족하면 뜨는 메시지 -->
								<!--  script 미완성 -->
<!-- 								<p id = 'duplicatedItem'>이미 구매한 항목입니다!</p> -->
							
							<img data-source-no='${i.SOURCE_NO}' data-cart-no='${i.CART_NO}' class="buy-button" alt="구매" src="../resources/icon/plus-circle.svg" width="20">
						</div>
					</td>
					
					<td class="popup"><!--  8. 항목 삭제 -->

						<img data-cart-no='${i.CART_NO}' class="delete-button" alt="삭제" src="../resources/icon/X.png" width="20">

								<!--  삭제 완료 후 떴다 사라지는 메시지 -->
								<!--  html 미완성 -->
								<!--  script 미완성 -->
					</td>
					
				</tr><!--  첫번째 열 End -->
			</tbody><!--  항목들 END-->
			</c:forEach><!--  반복되는 항목들 end-->
			
		</table><!--  orderTable End-->
		
		<script>
		/*  json 배우면서 해보는 과정 (xhr 쓰면서) */
		//AJAX객체 변수
		//함수를 분리시키기 위해서 전역변수로 만들어서 처리하고자 함.
		//여러 함수에서 xmlHttp라는 XHR을 담을 변수를 같이 쓰기위해서 전역변수의 xmlHTTP를 만드는 것임.
// 		var xmlHttp = null;	
		
		
// 		$(document).on('click', '.buy-button', function() {
// 			console.log("buy-clicked()");
			
// 			//XHR객체 생성 
// 			xmlHttp = new XMLHttpRequest();
// 			console.log(xmlHttp); //null이라고 출력되면 잘못된거임.
// 			//readyState:0 :UNSENT - XHR객체를 생성만 한 단계를 표현한다 ( open() 호출 전 )
			
// 			var sourceNo = $(this).data('source-no');
// 			var cartNo = $(this).data('cart-no');
// 			var $cartItem = $(this).closest('.cart-item'); // .cart-item을 찾아서 저장
			
// 			console.log("cartNo : " , cartNo);
// 			console.log("sourceNo : " , sourceNo);
// 			console.log("cartItem : " , $cartItem);
// // 			console.log("cartItem : " + $cartItem);
// 			//+ 로 이으니깐 출력 결과가 n.fn.init~~ 이 아니라 [object object] 라고만 나온다. 이걸 프로토타입이라고 하는걸까..?
// 			//앞으로 console.log 를 쓸때는 그냥 콤마로 잇자!

			
// 			//AJAX 요청 전 설정
// 			//요청 URL				
// 			var url = "./buy";
			
// 			//요청 Method
// 			var method = "POST";
			
// 			//요청 Parameter -> 쿼리스트링 형식으로 보낼 것이기 때문에 =와 &을 넣어줘야함 
// 			var params = "sourceNo=" + sourceNo + "&cartNo=" + cartNo
			
			
// 			//open()와 send()의 매개변수로 넣을 데이터를 저장하는 변수 준비
// 			//변수가 제대로 저장되어있는지는 요청을 보내봐야 알 수 있음
			
			
// 			//서버의 응답 데이터 처리하기
// 			//	-> readyState가 변경될때 마다 호출되는 이벤트 리스너
// 			xmlHttp.onreadystatechange = callback;//사용자 생성 callback이라는 함수
// 			//단계별로 상태가 변경되기 때문에 0~4까지 총 4번 바뀜(0은 초기값이기 때문에 변경된다고 보지 않음)
// 			//그래서 callback함수에 넣었던 console.log("callback called")가 4회 출력됨
// 			//이는 open이전에만 호출해서 부르면 됨.. 아예 이전에 불러도 괜찮다는 것임.
			
			
// 			//AJAX 요청 준비 - open(method, url)을 시작하고 (0-XHR객체 생성) 끝나면 (1)준비 상태인 것임
// 			xmlHttp.open(method, url)
// 			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
			
// 			//AJAX 요청 보내기
// 			xmlHttp.send(params);

// 		});
		
		
// 		//응답 데이터를 처리하는 콜백함수
// 		//함수는 종속된것이 아니라면 꼭 함수끼리 분리시켜주는 것이 좋다.
// 		//이벤트 리스너는 특히 분리시켜줘야함.
// 		function callback() {
// 			console.log("callback called")
			
// 			if(xmlHttp.readyState == 4) {	//DONE, 응답 완료 상태
// 				console.log("DONE, 응답 받기 완료")
				
// 				//응답은 여기서 이미 와있고 응답된 데이터는 xmlHttp.responseText의 내부에 들어있다.
				
// 				console.log("-----응답 데이터(xmlHttp.responseText)---");
			
// 				console.log(xmlHttp.getAllResponseHeaders());
// 				console.log(xmlHttp.responseText);
				
// 				//응답 데이터를 div#resultLayout에 반영하기
// 				//응답 데이터를 resultLayout에 들어가 있는 값을 div의 innerHTML에 넣어준다.
// 				resultLayout.innerHTML = xmlHttp.responseText;
				
// 				//입력창 초기화
// 				num1.value ="";
// 				num2.value ="";
// 				oper.value ="add";
				
// 				//input#num1에 포커스 - 트리거 사용
// 				num1.focus();
// 			}
// 		}
		
		
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
					"cartNo" : cartNo,
					"sourceNo" : sourceNo
				},
				dataType : 'json',
				success: function(response) {
					console.log("ajax 성공");
					console.log(sourceNo);
							                    
					$cartItem.remove(); // $cartItem 변수를 사용하여 항목 제거
				},
				error: function() {
					console.log("AJAX 실패");
					console.error();
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