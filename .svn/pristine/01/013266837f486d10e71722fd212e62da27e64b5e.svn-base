<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>

<script>
$(document).ready(function() {
    $('#example').dataTable();
});
	$(function(){
		$("#registProject").on("click",function(){
			$("#app_det_no").val("4");
			$("#app_div_no").val("3");
			$("#pmsfrm").submit();
			
		})
		$(".pms").on("click",function(){
			//this : 클릭 이벤트가 발생한 element
			//data- 속성명 data-userid, 속성명은 대소문자 무시하고 소문자로 인식
			//data-userId ==>data-userid
			var pms_no = $(this).data("pms_no");
			$("#pms_no").val(pms_no);
			console.log(pms_no);
			$("#frm").submit();
		});
	})
</script>
 
<style>
#registProject{
	float: right;
}
.odd2{
 text-align: center;
}
</style>

<%@include file="/WEB-INF/views/common/common_lib.jsp"%>

<form action="${cp}/app/registApp" id="pmsfrm" method="get">
	<input type="hidden" name="emp_no" value="${S_USER.emp_no}">
	<input type="hidden" id="app_div_no" name="app_div_no">
	<input type="hidden" id="app_det_no" name="app_det_no">
</form>


<form action="${cp}/pms/pmsView" id="frm" method="get">
	<input type="hidden" id="pms_no" name="pms_no"  >
</form>

<c:choose>
<c:when test="${S_USER.emp_no == 0}">

<div class="col-md-12"  style=" height:280px;">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">승인 대기중인 프로젝트</h3>
			<div class="actions pull-right">
				<i class="fa fa-times"></i>
			</div>
		</div>
		<div class="panel-body" style="display: block; min-width: 100px; height:175px; overflow:auto;">
			<c:forEach items="${appPmsList}" var="appPms" varStatus="loop" >
				<div style="float: left; width: 200px; height:150px; margin-right:22px; margin-bottom:20px; border:2px solid #66CDAA;">	
						<label>글번호</label> <strong>${loop.count}</strong><br>
						<label>전자결재 일련번호</label> ${appPms.app_char}<br>
						<label>제목</label> ${appPms.title}<br>
						<label>작성자</label> ${appPms.ko_nm}<br>
						<label>시작일</label> <fmt:formatDate value="${appPms.s_dt}"
									pattern="yyyy-MM-dd" /><br>
						<label>종료일</label> <fmt:formatDate value="${appPms.e_dt}"
											pattern="yyyy-MM-dd" /><br>
				</div>	
			</c:forEach>
		
		
		</div>
	</div>
</div>

<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">진행중인 프로젝트</h3>
		</div>
		
		<div class="panel-body" style="display: block; min-height: 300px;">
			<form class="form-horizontal" role="form">
				<table id="example22"
					class="table table-striped table-bordered dataTable no-footer"
					cellspacing="0" width="100%" aria-describedby="example_info"
					style="width: 100%;">
					<thead>
						<tr  role="row" style="text-align: center;">
							<th style="text-align: center;">글번호</th>
							<th style="text-align: center;">기안 일자</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">프로젝트 시작날짜</th>
							<th style="text-align: center;">프로젝트 종료날짜</th>
							<th style="text-align: center;">작성자</th>
							<th style="text-align: center;">부서</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${selectAllList}" var="pms" varStatus="loop">
							<tr class="odd odd2">
								<td>${loop.count}</td>
								<td><fmt:formatDate value="${pms.reg_dt}"
										pattern="yyyy-MM-dd" /></td>
								<td style="text-align: left;"  class="pms" data-pms_no="${pms.pms_no}">${pms.pms_nm}</td>
								<td><fmt:formatDate value="${pms.s_dt}"
										pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${pms.e_dt}"
										pattern="yyyy-MM-dd" /></td>
								<td>${pms.ko_nm}</td>
								<td>${pms.dept_nm}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="row">
					<div style="text-align: center;">
						<div class="dataTables_paginate paging_simple_numbers"
							id="example_paginate">
							<ul class="pagination">
								<li class="paginate_button previous"><a
									href="${cp }/pms/main?page=1&pageSize=${pageSize}&attend_emp_no=${S_USER.emp_no}">Previous</a></li>
								<c:forEach begin="1" end="${pagination}" var="i">
									<c:choose>
										<c:when test="${pageVo.page==i}">
											<li class="paginate_button active"><a
												href="${cp }/pms/main?page=${pageVo.page }&pageSize=${pageSize}&attend_emp_no=${S_USER.emp_no}">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="paginate_button " aria-controls="example"
												tabindex="0"><a
												href="${cp }/pms/main?page=${i }&pageSize=${pageSize}&attend_emp_no=${S_USER.emp_no}">${i}</a></li>
										</c:otherwise>
									</c:choose>

								</c:forEach>
								<li class="paginate_button next" aria-controls="example"
									tabindex="0" id="example_next"><a
									href="${cp }/pms/main?page=${pagination}&pageSize=${pageSize}&attend_emp_no=${S_USER.emp_no}">Next</a></li>

							</ul>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</c:when>

<c:otherwise>
<input type="button" class="btn btn-primary btn-square" style="margin-right: 15px;" id="registProject"  value="프로젝트 기안작성">
<br>


<div class="col-md-12"  style="height:280px; ">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">승인 대기중인 프로젝트</h3>
		</div>
		
		<div class="panel-body" style="display: block; min-width: 100px; height:220px; overflow:auto;">
			<c:forEach items="${appPmsempList}" var="appPms" varStatus="loop" >
				<div style="float: left; width: 200px; min-height:170px; margin-right:22px; margin-bottom:10px; margin-top:10px; border:2px solid #66CDAA;">	
					<label>글번호          </label> <strong>${loop.count}</strong><br>
					<label>전자결재 일련번호</label> ${appPms.app_char}<br>
					<label>제목</label> ${appPms.title}<br>
					<label>작성자</label> ${appPms.ko_nm}<br>
					<label>시작일</label> <fmt:formatDate value="${appPms.s_dt}" pattern="yyyy-MM-dd" /><br>
					<label>종료일</label> <fmt:formatDate value="${appPms.e_dt}" pattern="yyyy-MM-dd" /><br>
				</div>	
			</c:forEach>
		</div>
	</div>
</div>
<br><br>
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">진행중인 프로젝트</h3>
		</div>
		<div class="panel-body" style="display: block; min-height: 300px;">
			<form class="form-horizontal" role="form">
				<table id="example"
					class="table table-striped table-bordered dataTable no-footer"
					cellspacing="0" width="100%" aria-describedby="example_info"
					style="width: 100%;">
					<thead>
						<tr  role="row" style="text-align: center;">
							<th style="text-align: center;">글번호</th>
							<th style="text-align: center;">기안 일자</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">프로젝트 시작날짜</th>
							<th style="text-align: center;">프로젝트 종료날짜</th>
							<th style="text-align: center;">작성자</th>
							<th style="text-align: center;">부서</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${pmsList}" var="pms" varStatus="loop">
							<tr class="odd odd2">
								<td>${loop.count}</td>
								<td><fmt:formatDate value="${pms.reg_dt}" pattern="yyyy-MM-dd" /></td>
								<td style="text-align: left;" class="pms" data-pms_no="${pms.pms_no}">${pms.pms_nm}</td>
								<td><fmt:formatDate value="${pms.s_dt}" pattern="yyyy-MM-dd" /></td> 
								<td><fmt:formatDate value="${pms.e_dt}" pattern="yyyy-MM-dd" /></td> 
								<td>${pms.ko_nm}</td>
								<td>${pms.dept_nm}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>
</c:otherwise>
</c:choose>

