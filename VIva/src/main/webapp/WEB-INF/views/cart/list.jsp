<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="../layout/header.jsp"/>   

<script type="text/javascript">

</script>


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
         <tr class="col_con"><!--  첫번째 열 시작-->
         
            <td><!--  1. 체크박스 -->
               <div class="checkBox">
                 <input class="form-check-input" type="checkbox" name="chBox" data-cartNum="${i.CART_NO}">
               </div>
             </td>

            <td><!--  2. pack 및 소스 앨범아트 -->
               <div class="product_img">
                  <img alt="이미지 없음" src="./buy${i.SOURCE_IMG_STOREDNAME }" width="50">
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
            
            <td><!--  7. 바로 구매 -->
               <a href="./delete?cartNo=${i.CART_NO}">
               <img value="${i.SOURCE_NO}" alt="구매" src="../resources/icon/plus-circle.svg" width="20">
               </a>
            </td>
            
            <td><!--  8. 항목 삭제 -->
            <div class="cart-item">
               
               <img data-cart-no='${i.CART_NO}' class="delete-button" alt="삭제" src="../resources/icon/X.png" width="20">
               
            </div>
               
            </td>
         
         </tr><!--  첫번째 열 End -->
         </tbody>
         </c:forEach>
      </table><!--  orderTable End-->
                  <script>
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
                                console.log("성공");
                                console.log(cartNo);
                                $cartItem.remove(); // $cartItem 변수를 사용하여 항목 제거
                            },
                            error: function() {
                           console.log("AJAX 실패")
                     }
                        });
                    });
                </script>
   </div>
</form>
<c:import url ="../layout/footer.jsp"/>