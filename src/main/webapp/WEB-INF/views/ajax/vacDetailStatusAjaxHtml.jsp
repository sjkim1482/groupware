<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
		<c:forEach items="${vacDetUsedlist}" var="vac" begin="0">
				<tr class="odd empinfo">
			
				<td>${vac.ko_nm}</td>
				<td>${vac.dept_nm}</td>
				<td><fmt:formatDate value="${vac.s_dt }" pattern="yyyy/MM/dd"/>  ~ <fmt:formatDate value="${vac.e_dt }" pattern="yyyy/MM/dd"/></td>
				<td>${vac.used_vac}</td>
				<td>${vac.cd_ko_nm }</td>
				</tr>
			
		</c:forEach>
		
		
####################

<li class="paginate_button previous" aria-controls="example" tabindex="0" id="example_previous">
	<a href="javascript:pagingVacAjax(1,${pageVo1.pageSize });">&lt;&lt;</a></li>

<c:forEach begin="1" end="${pagination1}" var="i">
	<c:choose>
		<c:when test="${pageVo1.page == i}">
			<li class="paginate_button active" aria-controls="example" tabindex="0">
			<span>${i}</span></li>
<%-- 			<a href="#">${i}</a></li> --%>
		</c:when>
		<c:otherwise>
			<li class="paginate_button " aria-controls="example" tabindex="0">
				<a href="javascript:pagingVacAjax(${i }, ${pageVo1.pageSize});">${i }</a></li>
		</c:otherwise>
	</c:choose>

</c:forEach>


<li class="paginate_button next" aria-controls="example" tabindex="0" id="example_next">
	<a href="javascript:pagingVacAjax(${pagination1 }, ${pageVo1.pageSize});">&gt;&gt;</a></li>
	

    