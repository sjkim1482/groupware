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
			<h3 class="panel-title">하위 	일감 등록페이지</h3>
			<div class="actions pull-right">
				<i class="fa fa-chevron-down"></i> <i class="fa fa-times"></i>
			</div>
		</div>
		<div class="panel-body" style="display: block; height: 800px; min-width: 500px;">
			<form action="/pms/registLowerPms" method="post" id="frm"
				class="form-horizontal form-border">
				<div class="form-group">
					<label class="col-sm-3 control-label">우선순위</label>
					<div class="col-sm-2">
						<select class=" col-md-8" name="pri_order" id="pri_order">
							<c:forEach items="${commcdPriList}" var="commcd" varStatus="loop">
								<option value="${commcd.comm_no}">${commcd.cd_ko_nm }</option>
							</c:forEach>
						</select>
					</div>
					<label class="col-sm-1 control-label">상태</label>
					<div class="col-sm-2">
						<select class=" col-md-8" name="sta_cd" id="sta_cd">
							<c:forEach items="${commcdList}" var="commcd" varStatus="loop">
								<option value="${commcd.comm_no}">${commcd.cd_ko_nm }</option>
							</c:forEach>
						</select> 
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label">시작일자</label>
					<div class="col-sm-2">
						<input type="date" id="s_dt" name="s_dt" class="form-control">
					</div>
					<label class="col-sm-1 control-label">종료일자</label>
					<div class="col-sm-2">
						<input type="date" id="e_dt" name="e_dt" class="form-control">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label">일감제목</label>
					<div class="col-sm-5">
						<input type="text" id="work_nm" name="work_nm" class="form-control">
					</div>
				</div>
			
				<div class="form-group">
					<label class="col-sm-3 control-label">일감내용</label>
					<div class="col-sm-5">
						<textarea id="summernote" name="cont" style="height: 100%;"></textarea>
						<!-- 			<textarea id="cont" name="cont" class="form-control"></textarea> -->
					</div>
				</div>
				
				
				<div class="form-group">
					<label class="col-sm-3 control-label">추정시간</label>
					<div class="col-sm-2">
						<input type="text" id="est_time" name="est_time" class="form-control">
					</div>
					<label class="col-sm-1 control-label">진척도</label>
					<div class="col-sm-2">
						<input type="text" id="prog" name="prog" class="form-control">
					</div>
				</div>
				

				<div class="form-group">
					<input type="hidden" id="attend_emp_no" name="attend_emp_no"	value="${S_USER.emp_no}"> 
					<input type="hidden" id="pms_no" name="pms_no" value="${pms_no}">
					<input type="hidden" id="work_no" name="work_no" value="0">
					<input type="hidden" id="higher_work_no" name="higher_work_no" value="${higher_work_no}">
				</div>
					<input type="submit" id="submit" class="btn btn-success btn-square" value="저장"/>
			</form>
		</div>
	</div>
</div>