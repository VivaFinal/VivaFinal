<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

<div class="FunctionTitle">
	Cart
</div>
<div class="FunctionTitleLine">
	<img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>

	<div id="titleArea">
		<div id="selectArea">	
			<button type="button" class="btn btn-secondary btn-sm">전체 선택</button>
		</div>
		<div id="selectArea">	
			<button type="button" class="btn btn-secondary btn-sm">선택 삭제</button>
		</div>
		</div>
	<div id="order">
		<table class="table">
		  <thead class="table-light">
		    <tr>
		    
		      <th scope="col">
		      	<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
				  <label class="form-check-label" for="flexCheckDefault"></label>
				</div>
		      </th>
		      <th scope="col">pack</th>
		      <th scope="col">Filename</th>
		      <th scope="col">credit</th>
		      <th scope="col">buy</th>
		      <th scope="col">  </th>
		    </tr>
		  </thead>
		  
		  <c:forEach var="i" items="${list}">
		  <tbody>
			<tr class="col_con"><!--  첫번째 열 시작-->
			
				<td><!--  1. 체크박스 -->
					<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					</div>
			 	</td>

				<td><!--  2. pack 및 소스 앨범아트 -->
					<div class="product_img">
						<img alt="이미지 없음" src="./buy${i.SOURCE_IMG_STOREDNAME }" width="50">
					</div>
				</td>
				<td><!--  3. 음원 title -->
					<span>${i.SOURCE_NAME}</span>
				</td>
				<td><!--  4. 금액 -->
					<span>${i.SOURCE_PRICE}</span>
				</td>
				<td><!--  5. 바로 구매 -->
					<img alt="구매" src="../../../resources/icon/buy icon.png" width="20">
				</td>
				<td><!--  6. 항목 삭제 -->
					<img alt="삭제" src="../../../resources/icon/X.png" width="20">
				</td>
			</tr><!--  첫번째 열 End -->
			</tbody>
			</c:forEach>
		</table><!--  orderTable End-->
	</div>
<c:import url ="../layout/footer.jsp"/>