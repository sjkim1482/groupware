<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<c:choose>
		<c:when test="${S_USER.emp_no == 0 }">
		<c:forEach items="${onofflist}" var="onoff">
			<tr class="odd empinfo" style="cursor:pointer"
			onClick="window.open('/empController/onoffDetail?emp_no=${onoff.emp_no}&emp_id=${onoff.emp_id }','근태 상세조회','width=1100, height=950, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;">
<%-- 				<td>${onoff.emp_no}</td> --%>
				<td>${onoff.ko_nm} ${onoff.cd_ko_nm }</td>
				<td>${onoff.emp_id}</td>
				<td>${onoff.dept_nm}</td>
				<td>${onoff.day}</td>
				<td>${onoff.eg_nm}</td>
				<td>${onoff.date}</td>
				<td>${onoff.attend_time}</td>
				<td>${onoff.offwork_time}</td>
				<td>${onoff.late}</td>
			</tr>
		</c:forEach>	
		</c:when>
		<c:otherwise>
		<c:forEach items="${onoffDetaillist}" var="onoff">
				<tr class="odd empinfo">
<%-- 					<td>${onoff.emp_no}</td> --%>
					<td>${onoff.ko_nm} ${onoff.cd_ko_nm }</td>
					<td>${onoff.emp_id}</td>
					<td>${onoff.dept_nm}</td>
					<td>${onoff.day}</td>
					<td>${onoff.eg_nm}</td>
					<td>${onoff.date}</td>
					<td>${onoff.attend_time}</td>
					<td>${onoff.offwork_time}</td>
					<td>${onoff.late}</td>
				</tr>
			</c:forEach>
		
		</c:otherwise>
	</c:choose>

####################

<c:choose>
	<c:when test="${S_USER.emp_no == 0 }"> 

<li class="paginate_button previous" aria-controls="example" tabindex="0" id="example_previous">
	<a href="javascript:pagingOnOffAjax(1,${pageVo.pageSize });">&lt;&lt;</a></li>

		<c:forEach begin="1" end="${pagination}" var="i">
			<c:choose>
				<c:when test="${pageVo.page == i}">
					<li class="paginate_button active" aria-controls="example" tabindex="0">
					<span>${i}</span></li>
		<%-- 			<a href="#">${i}</a></li> --%>
				</c:when>
				<c:otherwise>
					<li class="paginate_button " aria-controls="example" tabindex="0">
						<a href="javascript:pagingOnOffAjax(${i }, ${pageVo.pageSize});">${i }</a></li>
				</c:otherwise>
			</c:choose>
		
		</c:forEach>

	<li class="paginate_button next" aria-controls="example" tabindex="0" id="example_next">
	<a href="javascript:pagingOnOffAjax(${pagination } , ${pageVo.pageSize});">&gt;&gt;</a></li>
	
	</c:when>
	
	<c:otherwise>
		<li class="paginate_button previous" aria-controls="example" tabindex="0" id="example_previous">
			<a href="javascript:pagingOnOffAjax(1,${pageVo1.pageSize });">&lt;&lt;</a></li>

				<c:forEach begin="1" end="${pagination1}" var="i">
					<c:choose>
						<c:when test="${pageVo1.page == i}">
							<li class="paginate_button active" aria-controls="example" tabindex="0">
							<span>${i}</span></li>
				<%-- 			<a href="#">${i}</a></li> --%>
						</c:when>
						<c:otherwise>
							<li class="paginate_button " aria-controls="example" tabindex="0">
								<a href="javascript:pagingOnOffAjax(${i }, ${pageVo1.pageSize});">${i }</a></li>
						</c:otherwise>
					</c:choose>

				</c:forEach>
				
			<li class="paginate_button next" aria-controls="example" tabindex="0" id="example_next">
				<a href="javascript:pagingOnOffAjax(${pagination1 }, ${pageVo1.pageSize});">&gt;&gt;</a></li>
				
				</c:otherwise>
		</c:choose>
	
	