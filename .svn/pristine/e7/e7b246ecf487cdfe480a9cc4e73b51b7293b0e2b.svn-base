<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="panel">
	<header class="panel-heading wht-bg">
		<h4 class="gen-case">
			${msgKind}
<!-- 			<form action="#" class="pull-right mail-src-position"> -->
<!-- 				<div class="input-append"> -->
<!-- 					<input type="text" class="form-control " placeholder="Search Mail"> -->
<!-- 				</div> -->
<!-- 			</form> -->
		</h4>
	</header>
	<div class="panel-body minimal" style="width: 100%; height: 650px;">
		
		<div class="table-responsive pull-left" style="width: 100%">
			<table class="table table-inbox table-hover" style="width: 100%">
				<tbody>
				
					<c:forEach items="${msgList}" var="msg" varStatus="status">
						
							<tr class="sent_msg_no unread" data-msg_no="${msg.msg_no}">
								<td>
									<img id="pictureViewImg" style="width: 50px; height: 50px;"	src="${cp }/empController/profile?emp_id=${msg.emp_id}" />
								</td>
								<td>${msg.dept_nm}</td>
								<td>${msg.cd_ko_nm}</td>
								<td>${msg.ko_nm}</td>
								<td class="message">${msg.title}</td>
								
								<td><fmt:formatDate value="${msg.reg_dt }" pattern="yyyy-MM-dd"/></td>
							</tr>
						
						
						
					</c:forEach>
					
					
				</tbody>
			</table>

		</div>
	</div>
	
	<div class="row">
	<div style="text-align: center;">
		<div class="dataTables_paginate paging_simple_numbers" id="example_paginate">
			<ul id="pagination" class="pagination">
				<li class="paginate_button previous" aria-controls="example" tabindex="0" id="example_previous">
	<a href="javascript:pagingSentMsgAjaxHtml(1,${pageVo.pageSize });">&lt;&lt;</a></li>

<c:forEach begin="1" end="${pagination}" var="i">
	<c:choose>
		<c:when test="${pageVo.page == i}">
			<li class="paginate_button active" aria-controls="example" tabindex="0">
			<span>${i}</span></li>
<%-- 			<a href="#">${i}</a></li> --%>
		</c:when>
		<c:otherwise>
			<li class="paginate_button " aria-controls="example" tabindex="0">
				<a href="javascript:pagingSentMsgAjaxHtml(${i }, ${pageVo.pageSize});">${i }</a></li>
		</c:otherwise>
	</c:choose>

</c:forEach>

<li class="paginate_button next" aria-controls="example" tabindex="0" id="example_next">
	<a href="javascript:pagingSentMsgAjaxHtml(${pagination}, ${pageVo.pageSize});">&gt;&gt;</a></li>
			</ul>
		</div>
	</div>
</div>	
</section>