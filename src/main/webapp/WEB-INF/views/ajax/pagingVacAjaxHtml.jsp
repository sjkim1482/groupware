<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<c:choose>
		<c:when test="${S_USER.emp_no == 0 }">
		<c:forEach items="${vaclist }" var="vac" begin="0">
			<tr class="odd empinfo" style="cursor:pointer"
			onClick="window.open('/vacController/vacDetail?emp_no=${vac.emp_no}&emp_id=${vac.emp_id }','연차 상세조회',
			'width=1100, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
				<td>${vac.ko_nm} ${vac.cd_ko_nm }</td>
				<td>${vac.emp_id}</td>
				<td>${vac.dept_nm}</td>
				<td>${vac.hire_dt}</td>
				<td>${vac.retire_dt}</td>
				<td>${vac.work_year}</td>
				<td>${vac.total_mon_vac}</td>
				<td>${vac.total_vac}</td>
				<td>${vac.used_vac}</td>
				<td>${vac.remain_vac}</td>
			</tr>
		</c:forEach>	
		</c:when>
		<c:otherwise>
		<c:forEach items="${vacDetlist}" var="vac" begin="0">
				<tr class="odd empinfo">
				
				<td>${vac.ko_nm} ${vac.cd_ko_nm }</td>
				<td>${vac.emp_id}</td>
				<td>${vac.dept_nm}</td>
				<td>${vac.hire_dt}</td>
				<td>${vac.retire_dt}</td>
				<td>${vac.work_year}</td>
				<td>${vac.total_mon_vac}</td>
				<td>${vac.total_vac}</td>
				<td>${vac.used_vac}</td>
				<td>${vac.remain_vac}</td>
				</tr>
			</c:forEach>
		
		</c:otherwise>
	</c:choose>

####################

<c:choose>
	<c:when test="${S_USER.emp_no == 0 }"> 

<li class="paginate_button previous" aria-controls="example" tabindex="0" id="example_previous">
	<a href="javascript:pagingVacAjax(1,${pageVo.pageSize });">&lt;&lt;</a></li>

		<c:forEach begin="1" end="${pagination}" var="i">
			<c:choose>
				<c:when test="${pageVo.page == i}">
					<li class="paginate_button active" aria-controls="example" tabindex="0">
					<span>${i}</span></li>
		<%-- 			<a href="#">${i}</a></li> --%>
				</c:when>
				<c:otherwise>
					<li class="paginate_button " aria-controls="example" tabindex="0">
						<a href="javascript:pagingVacAjax(${i }, ${pageVo.pageSize});">${i }</a></li>
				</c:otherwise>
			</c:choose>
		
		</c:forEach>

	<li class="paginate_button next" aria-controls="example" tabindex="0" id="example_next">
	<a href="javascript:pagingVacAjax(${pagination } , ${pageVo.pageSize});">&gt;&gt;</a></li>
	
	</c:when>
	
	<c:otherwise>
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
				
				</c:otherwise>
		</c:choose>
	
	