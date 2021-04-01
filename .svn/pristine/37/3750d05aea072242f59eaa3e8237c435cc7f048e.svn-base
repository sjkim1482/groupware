<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script> 
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<meta charset='utf-8' />
<script>
 $(function() {
        $('#summernote').summernote({
        			height:300
        });
        
 })
</script>
<style>
#submit{
	float: right; 
	margin-right: 34%;
}
</style>
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">진행중인 프로젝트</h3>
			<div class="actions pull-right">
				<i class="fa fa-chevron-down"></i> <i class="fa fa-times"></i>
			</div>
		</div>
		<div class="panel-body" style="display: block; height: 800px;">
<form  action="/scd/registCalendar" method="post" id="frm" class="form-horizontal form-border" role="form">
	<div class="form-group">
		<label class="col-sm-3 control-label">일정분류</label>
		<div class="col-sm-2">
			<select class=" col-md-8" name="scd_div_no" id="scd_div_no" >
				<c:forEach items="${scdList}" var="scd_div" varStatus="loop">
					<option value="${scd_div.scd_div_no}">${scd_div.scd_div_nm }</option>
				</c:forEach>
			</select>
		</div>
		<label class="col-sm-1 control-label">일정유형</label>
		<div class="col-sm-2">
			<select class=" col-md-8" name="sta_cd" id="sta_cd">
				<c:forEach items="${commcdList}" var="commcd" varStatus="loop">
					<option value="${commcd.comm_no}">${commcd.cd_ko_nm }</option>
				</c:forEach>
			</select> 
			<input type="hidden" id="emp_no" name="emp_no" value="${S_USER.emp_no}">
			<input type="hidden" id="dept_no" name="dept_no" value="${S_USER.dept_no}">
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-3 control-label">시작일자</label>
		<div class="col-sm-2">
			<input type="date" id="s_dt" name="s_dt"  value='<fmt:formatDate value="${s_dt}" pattern="yyyy-MM-dd"/>' class="form-control">
		</div>
		<label class="col-sm-1 control-label">종료일자</label>
		<div class="col-sm-2">
			<input type="date" id="e_dt" name="e_dt" value='<fmt:formatDate value="${e_dt}" pattern="yyyy-MM-dd"/>' class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label">장소</label>
		<div class="col-sm-5">
			<input type="text" id="plc" name="plc" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label">제목</label>
		<div class="col-sm-5">
			<input type="text" id="title" name="title" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label">내용</label>
		<div class="col-sm-5">
			<textarea id="summernote" name="cont" style="height:100%;"></textarea>
<!-- 			<textarea id="cont" name="cont" class="form-control"></textarea> -->
		</div>
	</div>
	
	<div class="form-group">
		<input type="hidden" id="emp_no" name="emp_no" value="${S_USER.emp_no}">
		<input type="hidden" id="dept_no" name="dept_no" value="${S_USER.dept_no}">
		<button type="submit" id="submit" class="btn btn-success btn-square">저장</button>
		</div>
	
</form>
	</div>
	</div>
</div>
