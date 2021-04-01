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
<link rel="shortcut icon" href="${cp}/assets/img/favicon.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${cp}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Font Icons -->
    <link rel="stylesheet" href="${cp}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${cp}/assets/css/simple-line-icons.css">
    <!-- CSS Animate -->
    <link rel="stylesheet" href="${cp}/assets/css/animate.css">
    <!-- Switchery -->
    <link rel="stylesheet" href="${cp}/assets/plugins/switchery/switchery.min.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="${cp}/assets/css/main.css">
    <!-- Vector Map  -->
    <link rel="stylesheet" href="${cp}/assets/plugins/jvectormap/css/jquery-jvectormap-1.2.2.css">
    <!-- ToDos  -->
    <link rel="stylesheet" href="${cp}/assets/plugins/todo/css/todos.css">
    <!-- Morris  -->
    <link rel="stylesheet" href="${cp}/assets/plugins/morris/css/morris.css">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <!-- Feature detection -->
    <script src="${cp}/assets/js/modernizr-2.6.2.min.js"></script>

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
	margin-right: 20%;
}
</style>
<div>
	<h1>일정 수정페이지</h1>
</div>
<form action="/scd/modifyCalendar" method="post" id="frm"
	class="form-horizontal form-border">
	<div class="form-group">
		<label class="col-sm-3 control-label">일정분류</label>
		<div class="col-sm-2">
			<select class=" col-md-8" name="scd_div_no" id="scd_div_no">
				<option value="1">개인</option>
				<option value="2">사내</option>
			</select>
		</div>
		<label class="col-sm-2 control-label">일정유형</label>
		<div class="col-sm-2">
			<select class=" col-md-8" name="sta_cd" id="sta_cd">
				<option value="400" selected="selected">출장</option>
				<option value="401">휴가</option>
				<option value="402">휴일</option>
				<option value="403">업무</option>
				<option value="404">프로젝트</option>
				<option value="405">미팅</option>
				<option value="406">개인</option>
				<option value="407">기타</option>
			</select> <input type="hidden" id="emp_no" name="emp_no"
				value="${S_USER.emp_no}"> <input type="hidden" id="dept_no"
				name="dept_no" value="${S_USER.dept_no}">
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-3 control-label">시작일자</label>
		<div class="col-sm-3">
			<input type="date" id="s_dt" name="s_dt2"
				value='<fmt:formatDate value="${scdVo.s_dt}" pattern="yyyy-MM-dd"/>'
				class="form-control">
		</div>
		<label class="col-sm-1 control-label">종료일자</label>
		<div class="col-sm-3">
			<input type="date" id="e_dt" name="e_dt2"
				value='<fmt:formatDate value="${scdVo.e_dt}" pattern="yyyy-MM-dd"/>'
				class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-3 control-label">장소</label>
		<div class="col-sm-7">
			<input type="text" id="plc" name="plc" value="${scdVo.plc}"
				class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-3 control-label">제목</label>
		<div class="col-sm-7">
			<input type="text" id="title" name="title" value="${scdVo.title}"
				class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-3 control-label">내용</label>
		<div class="col-sm-7">
			<textarea id="summernote" name="cont" style="height: 100%;">${scdVo.cont}</textarea>
			<!-- 			<textarea id="cont" name="cont" class="form-control"></textarea> -->
		</div>
	</div>

	<div class="form-group">
		<input type="hidden" id="emp_no" name="emp_no"
			value="${S_USER.emp_no}"> <input type="hidden" id="scd_no"
			name="scd_no" value="${scdVo.scd_no}"> <input type="hidden"
			id="dept_no" name="dept_no" value="${S_USER.dept_no}">
		<button type="submit" id="submit" class="btn btn-success btn-square">저장</button>
	</div>

</form>