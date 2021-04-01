<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input type="hidden" id="userSearchCnt" value="${userCnt}">

<c:forEach items="${userList}" var="user">
	<tr class="odd empinfo" data-emp_no="${user.emp_no }" >
		<td>${user.emp_id}</td>
		<td>${user.ko_nm}</td>
		<td>${user.eg_nm}</td>
		<td style="text-align: center;">${user.gender}</td>
		<td style="text-align: center;"><fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"/></td>
		<td style="text-align: center;">${user.per_pn}</td>
		<td>${user.per_email}</td>
		<td style="text-align: center;">${user.cd_ko_nm}</td>
	</tr>
</c:forEach>

####################

<li class="paginate_button previous" aria-controls="example" tabindex="0" id="example_previous">
	<a href="javascript:pagingUserAjax(1,${pageVo.pageSize });">&lt;&lt;</a></li>

<c:forEach begin="1" end="${pagination}" var="i">
	<c:choose>
		<c:when test="${pageVo.page == i}">
			<li class="paginate_button active" aria-controls="example" tabindex="0">
			<span>${i}</span></li>
<%-- 			<a href="#">${i}</a></li> --%>
		</c:when>
		<c:otherwise>
			<li class="paginate_button " aria-controls="example" tabindex="0">
				<a href="javascript:pagingUserAjax(${i }, ${pageVo.pageSize});">${i }</a></li>
		</c:otherwise>
	</c:choose>

</c:forEach>

<li class="paginate_button next" aria-controls="example" tabindex="0" id="example_next">
	<a href="javascript:pagingUserAjax(${pagination}, ${pageVo.pageSize});">&gt;&gt;</a></li>
	
	