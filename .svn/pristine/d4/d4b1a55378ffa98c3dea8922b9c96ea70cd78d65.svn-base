<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("#searchType").val("${searchType}");
	$("#perPageNum").val("${pageSize}");
	$("#searchBtn").on("click",function(){
		var type = $("#searchType").val();
		console.log(type);
		var pageSize = $("#perPageNum").val();
		console.log(pageSize);
		var keywords = $("#keywords").val();
		console.log(keywords);
		var emp_no = $("#emp_no").val();
		console.log(emp_no);
		location.href="${cp}/scd/searchCalendar?type="+type+"&page=1&pageSize="+pageSize+"&keywords="+keywords+"&emp_no="+emp_no;
	})
	$(".scd").on("click",function(){
		//this : 클릭 이벤트가 발생한 element
		//data- 속성명 data-userid, 속성명은 대소문자 무시하고 소문자로 인식
		//data-userId ==>data-userid
		var scd_no = $(this).data("scdno");
		$("#scd_no").val(scd_no);
		console.log(scd_no);
		 window.open("${cp}/scd/calendarView?scd_no="+scd_no, "PopupWin", "width=1000,height=600");
// 		$("#frm").submit();
	});
})
</script>
<input type="hidden" id="emp_no" name="emp_no" value="${S_USER.emp_no}">

<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">일정 검색 리스트</h3>
			<div class="actions pull-right">
				<i class="fa fa-chevron-down"></i> <i class="fa fa-times"></i>
			</div>
		</div>
		<div class="panel-body" style="display: block; min-height: 400px;">
<div class="panel-body">
	<div role="grid" id="example_wrapper"
		class="dataTables_wrapper form-inline no-footer">
		<div class="row">
			<div class="col-xs-8">
			총 ${scdCnt } 건
			</div>
			
			<div class="" id="keyword">	
				<!-- sort num -->
				<select aria-controls="example" class="form-control input-sm"name="perPageNum"
					id="perPageNum">
					<option value="">정렬개수</option>
					<option value="3">3개씩</option>
					<option value="5">5개씩</option>
					<option value="7">7개씩</option>
				</select>
				<!-- search bar -->
				<select aria-controls="example" class="form-control input-sm" name="searchType"
					id="searchType">
					<option value="">검색구분</option>
					<option value="u">작성자</option>
					<option value="t">제목</option>
					<option value="s">상태코드</option>
					<option value="d">일정타입</option>
				</select> 
				<input class="form-control" type="text" name="keyword"
			id="keywords" placeholder="검색어를 입력하세요." value=""> 
			<span class="input-group-append">
			<button class="btn btn-primary" type="button" id="searchBtn"
				data-card-widget="search">
				<i class="fa fa-fw fa-search"></i>
			</button>
		</span>
				<!-- end : search bar -->
			</div>
		</div>
		<table id="example"
			class="table table-striped table-bordered dataTable no-footer"
			cellspacing="0" width="100%" aria-describedby="example_info"
			style="width: 100%;">
			<thead>
				<tr role="row">
					<th class="col-xs-1">글번호</th>
					<th class="col-xs-1">일정구분</th>
					<th class="col-xs-4">제목</th>
					<th class="col-xs-2">일정 시작날짜</th>
					<th class="col-xs-2">일정 종료날짜</th>
					<th class="col-xs-1">작성자</th>
					<th class="col-xs-1">상태코드</th>
				</tr>
			</thead>

			<tbody>
		
			<c:forEach items="${scdList}" var="scd" varStatus="loop">
						<tr class="odd">
							<td>${loop.count}</td>
							<td>${scd.scd_div_nm}</td>
							<td  class="scd" data-scdno="${scd.scd_no}">${scd.title}</td>
							<td><fmt:formatDate value="${scd.s_dt}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${scd.e_dt}" pattern="yyyy-MM-dd"/></td>
							<td>${scd.ko_nm}</td>
							<td>${scd.cd_ko_nm}</td>
						</tr>
			</c:forEach>
			</tbody>
		</table>
		<form id="frm" action="${cp }/scd/calendarView" method="get" >
			<input type="hidden" name="scd_no"  id="scd_no" >
		</form>
		<div class="row">
			<div style="text-align: center;">
				<div class="dataTables_paginate paging_simple_numbers"
					id="example_paginate">
					<ul class="pagination">
						<li class="paginate_button previous"
							>
							<a href="${cp }/scd/searchCalendar?page=1&pageSize=${pageVo.pageSize}&type=${param.type}&keywords=${param.keywords}&emp_no=${emp_no}">Previous</a></li>
						<c:forEach begin="1" end="${pagination}" var="i">
						<c:choose>
							<c:when test="${pageVo.page==i}">
								<li class="paginate_button active">
									<a href="${cp }/scd/searchCalendar?page=${pageVo.page }&pageSize=${pageVo.pageSize}&type=${param.type}&keywords=${param.keywords}&emp_no=${emp_no}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="paginate_button " aria-controls="example" tabindex="0">
								<a href="${cp }/scd/searchCalendar?page=${i }&pageSize=${pageVo.pageSize}&type=${param.type}&keywords=${param.keywords}&emp_no=${emp_no}">${i}</a></li>
							</c:otherwise>
						</c:choose>
						
						</c:forEach>
						<li class="paginate_button next" aria-controls="example"
							tabindex="0" id="example_next"><a href="${cp }/scd/searchCalendar?page=${pagination}&pageSize=${pageVo.pageSize}&type=${param.type}&keywords=${param.keywords}&emp_no=${emp_no}">Next</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</div>
		</div>
	</div>
</div>







