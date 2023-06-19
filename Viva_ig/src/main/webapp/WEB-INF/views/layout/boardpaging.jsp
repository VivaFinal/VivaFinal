<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="paging">
	<ul class="pagination pagination-sm justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${page.curPage ne 1}">
		<li class="page-item"><a href="./list?categoryType=${categoryType}" class="page-link">&larr; 처음</a></li>
	</c:if>

	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
		<c:when test="${page.startPage ne 1}">
		    <c:choose>
				<c:when test="${empty keyword}">
					<li class="page-item"><a href="./list?curPage=${paging.startPage - paging.pageCount}&amp;categoryType=${categoryType}" class="page-link">&laquo;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a href="./list?curPage=${paging.startPage - paging.pageCount}&amp;categoryType=${categoryType}&amp;keyword=${keyword}" class="page-link">&laquo;</a></li>
				</c:otherwise>
			</c:choose>
		</c:when>
	

	<c:when test="${page.startPage eq 1}">
		<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
	</c:when>
	</c:choose>

	<c:if test="${paging.curPage > 1}">
		<li class="page-item"><a href="./list?curPage=${paging.curPage - 1}&amp;categoryType=${categoryType}&amp;keyword=${keyword}" class="page-link">&lt;</a></li>
	</c:if>

	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	<c:if test="${paging.curPage eq i}">
		<li class="page-item active"><a href="./list?curPage=${i}&amp;categoryType=${categoryType}&amp;keyword=${keyword}" class="page-link">${i}</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i}">
		<li class="page-item"><a href="./list?curPage=${i}&amp;categoryType=${categoryType}&amp;keyword=${keyword}" class="page-link">${i}</a></li>
	</c:if>
	</c:forEach>

	<c:if test="${paging.curPage < paging.totalPage}">
		<li class="page-item"><a href="./list?curPage=${paging.curPage + 1}&amp;categoryType=${categoryType}&amp;keyword=${keyword}" class="page-link">&gt;</a></li>
	</c:if>

	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage}">
		<li class="page-item"><a href="./list?curPage=${paging.startPage + paging.pageCount}&amp;categoryType=${categoryType}&amp;keyword=${keyword}" class="page-link">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage}">
	</c:when>
	</c:choose>

	<c:if test="${paging.curPage ne paging.totalPage}">
		<li class="page-item"><a href="./list?curPage=${paging.totalPage}&amp;categoryType=${categoryType}&amp;keyword=${keyword}" class="page-link">끝 &rarr;</a></li>
	</c:if>

	</ul>
</div>
