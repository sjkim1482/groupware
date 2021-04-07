<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<br>
<h1 style="text-align: center;">결재대기 문서함</h1><br>
<table class="table table-hover" cellspacing="0" width="100%" aria-describedby="example_info"	style="width: 100%;">
<thead>	
	<tr>
		<th>문서번호</th>
		<th>구분</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일자</th>
	</tr>
</thead>	
	<c:forEach items="${appList}" var="app">
		<tr class="appDetail" data-app_char="${app.app_char}">
			<td>${app.app_char}</td>
			<td>${app.app_det_title}</td>
			<td>${app.title}</td>
			<td>${app.ko_nm}</td>
			<td><fmt:formatDate value="${app.reg_dt}" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>

</table>

####################

<div class="row">
	<div style="text-align: center;">
		<div class="dataTables_paginate paging_simple_numbers" id="example_paginate">
			<ul id="pagination" class="pagination">
				<li class="paginate_button previous" aria-controls="example" tabindex="0" id="example_previous">
	<a href="javascript:pagingAppWaitAjax(1,${pageVo.pageSize });">&lt;&lt;</a></li>

<c:forEach begin="1" end="${pagination}" var="i">
	<c:choose>
		<c:when test="${pageVo.page == i}">
			<li class="paginate_button active" aria-controls="example" tabindex="0">
			<span>${i}</span></li>
<%-- 			<a href="#">${i}</a></li> --%>
		</c:when>
		<c:otherwise>
			<li class="paginate_button " aria-controls="example" tabindex="0">
				<a href="javascript:pagingAppWaitAjax(${i }, ${pageVo.pageSize});">${i }</a></li>
		</c:otherwise>
	</c:choose>

</c:forEach>

<li class="paginate_button next" aria-controls="example" tabindex="0" id="example_next">
	<a href="javascript:pagingAppWaitAjax(${pagination}, ${pageVo.pageSize});">&gt;&gt;</a></li>
			</ul>
		</div>
	</div>
</div>	



<%-- <a href="javascript:pagingAppProAjax(1,${pageVo.pageSize });">&lt;&lt;</a></li> --%>
<%-- <c:forEach begin="1" end="${pagination}" var="i"> --%>
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${pageVo.page == i}"> --%>
<!-- 			<li class="paginate_button previous active" aria-controls="example" tabindex="0"> -->
<%-- 			<span>${i}</span></li> --%>
<%-- <%-- 			<a href="#">${i}</a></li> --%>
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<!-- 			<li class="paginate_button " aria-controls="example" tabindex="0"> -->
<%-- 				<a href="javascript:pagingAppProAjax(${i }, ${pageVo.pageSize});">${i }</a></li> --%>
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>

<%-- </c:forEach> --%>
<%-- <li class="paginate_button next"><a href="javascript:pagingAppProAjax(${pagination}, ${pageVo.pageSize});">&gt;&gt;</a></li> --%>
