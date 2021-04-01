<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="panel-body">
	<div role="grid" id="example_wrapper"
		class="dataTables_wrapper form-inline no-footer">
		<div class="row">
			<div class="col-xs-6">
				<div class="dataTables_length" id="example_length">
					<label><select name="example_length"
						aria-controls="example" class="form-control input-sm"><option
								value="10">10</option>
							<option value="25">25</option>
							<option value="50">50</option>
							<option value="100">100</option></select> records per page</label>
				</div>
			</div>
			<div class="col-xs-6">
				<div id="example_filter" class="dataTables_filter">
					<label>Search:<input type="search"
						class="form-control input-sm" aria-controls="example"></label>
				</div>
			</div>
		</div>
		<table id="example"
			class="table table-striped table-bordered dataTable no-footer"
			cellspacing="0" width="100%" aria-describedby="example_info"
			style="width: 100%;">
			<thead>
				<tr role="row">
					<th></th>
					<th>이름</th>
					<th>별명</th>
					<th>비밀번호</th>
				</tr>
			</thead>

			<tbody>
		
			<c:forEach items="${userList}" var="user">
				<tr class="odd">
					<td>${user.userid}</td>
					<td>${user.usernm}</td>
					<td>${user.alias}</td>
					<td>${user.pass}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<div class="col-xs-6">
				
			</div>
			<div style="text-align: center;">
				<div class="dataTables_paginate paging_simple_numbers"
					id="example_paginate">
					<ul class="pagination">
		
					
						<li class="paginate_button previous disabled"
							aria-controls="example" tabindex="0" id="example_previous"><a
							href="#">Previous</a></li>
						<c:forEach begin="1" end="${pagination}" var="i">
						<c:choose>
							<c:when test="${pageVo.page==i}">
								<li class="paginate_button active" aria-controls="example"
									tabindex="0"><a href="#">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="paginate_button " aria-controls="example" tabindex="0"><a
									href="${cp}/ddit/userList?page=${i}&pageSize=${pageVo.pageSize}">${i}</a></li>
							</c:otherwise>
						</c:choose>
						
						</c:forEach>
						<li class="paginate_button next" aria-controls="example"
							tabindex="0" id="example_next"><a href="#">Next</a></li>
						
					</ul>
				</div>
			</div>
		</div>
	</div>

</div>








