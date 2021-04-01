<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/regular_expression.js"></script>

<script>
	$(function(){
		//비밀번호 정규식
		$('#pass').keyup(function(){
			if(!passwordcheck()){ return false; }
		})
		//비밀번호 일치여부
		$('#pass2').keyup(function(){
			if(!passwordcheck()){ return false; }
		})
	})
</script>


	<%@ include file="../../../common/include.jsp" %>

		<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">상세정보</h3>
					<div class="actions pull-right">
						<i class="fa fa-chevron-down"></i> <i class="fa fa-times"></i>
					</div>
				</div>
				
				<div class="panel-body" style="height: 600px;">
					<div class="card">
						<div class="register-card-body" style="margin: 3px;">
							<form role="form" class="form-horizontal" id="frm">
								<input type="hidden" name="emp_no" value="${detailUser.emp_no }" />
							</form>
					
					<form method="post" enctype="multipart/form-data" id="profilForm" action="${cp}/empController/modifyEmp?emp_no=${detailUSer.emp_no}" style="margin-left: 500px;">
								<input type="hidden" name="emp_no" value="${detailUser.emp_no }" />
							
							<div class="input-group" style="float: left;">
								<div class="mailbox-attachments clearfix" style="text-align: center; width: 100%;">
									<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 200px; width: 150px; margin: 0 auto;">
											<img id="pictureViewImg" style="width: 100%; height: 100%;"	src="${cp }/empController/profile?emp_id=${detailUser.emp_id }" />
									</div>
								</div>
							</div>
							
							<div class="form-group row" >
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> 사원번호 </label>
								<div class="col-sm-2 input-group input-group-sm">
									<span class="input-group-append-sm">${detailUser.emp_no}</span>
								</div>

								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> 사원id </label>
								<div class="col-sm-2 input-group input-group-sm">
									<span class="input-group-append-sm">${detailUser.emp_id}</span>
								</div>
								
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> 
									password <br><span id="passCk"></span></label>
								<div class="col-sm-2 input-group input-group-sm">
									<input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호를 입력해주세요.(영대소문자 + 특수기호)"/>
								</div>
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> 
									password확인 <br> <span id="passwordCk"></span> </label>
								<div class="col-sm-2 input-group input-group-sm">
									<input type="password" class="form-control" id="pass2" name="pass2" placeholder="비밀번호를 재입력해주세요."/>
									
								</div>
								
							
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 부서이름 </label>
								<div class="col-sm-1 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm">${detailUser.dept_nm}</span>
								</div>
								
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 급여 </label>
								<div class="col-sm-2 input-group input-group-sm">
									<span class="input-group-append-sm">${detailUser.sal}</span>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 한글이름 </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm">${detailUser.ko_nm}</span>
								</div>

								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 영문이름 </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">${detailUser.eg_nm}</span>
								</div>
								
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 생년월일 </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm"><fmt:formatDate value="${detailUser.birth }" pattern="yyyy.MM.dd"/></span>
								</div>
							
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 성별 </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">${detailUser.gender}</span>
								</div>
								
								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 개인ph </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm">${detailUser.per_pn}</span>
<%-- 									<input type="text" id="per_pn" name="per_pn" value="${detailUser.per_pn}"> --%>
								</div>

								<label class="col-sm-1 control-label" for="inputWarning1" style="font-size: 0.9em;"> 부서ph </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">${detailUser.dept_pn}</span>
								</div>
							
								<label class="col-sm-1 control-label" style="font-size: 0.9em;"> email </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm">${detailUser.per_email}</span>
								</div>

								<label class="col-sm-1 control-label" style="font-size: 0.9em;"> d_email </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">${detailUser.dept_email}</span>
<%-- 									<input type="email" id="dept_email" name="dept_email" value="${detailUser.dept_email}"> --%>
								</div>
							
								<label class="col-sm-1 control-label" style="font-size: 0.9em;"> 주소 </label>
								<div class="col-sm-10 input-group input-group-sm">
									<span class="input-group-append-sm">${detailUser.zipcode} / ${detailUser.addr1} , ${detailUser.addr2} </span>
								</div>

								<label class="col-sm-1 control-label" style="font-size: 0.9em;"> 입사일자 </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm"><fmt:formatDate value="${detailUser.hire_dt}" pattern="yyyy-MM-dd"/></span>
								</div>
									
								<label class="col-sm-1 control-label" style="font-size: 0.9em;"> 퇴사일자 </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm"><fmt:formatDate value="${detailUser.retire_dt}" pattern="yyyy-MM-dd"/></span>
								</div><br>
								
								<label class="col-sm-1 control-label" style="font-size: 0.9em;"> 재직상태 </label>
								<div class="col-sm-3 input-group input-group-sm" style="float: left;">
									<span class="input-group-append-sm">${detailUser.serve_nm}</span>
								</div>

								<label class="col-sm-1 control-label" style="font-size: 0.9em;"> 직급 </label>
								<div class="col-sm-3 input-group input-group-sm">
									<span class="input-group-append-sm">${detailUser.po_nm}</span>
								</div>

								<label class="col-sm-1 control-label" style="font-size: 0.9em;"> 직무 </label>
								<div class="col-sm-10 input-group input-group-sm"style="float: left;">
									<span class="input-group-append-sm">${detailUser.job_nm}</span>
								</div>

									<input type="submit" id="modifySaveBtn" class="btn btn-default" style="float: right; margin-right: 20px;" value="사용자 수정" data-emp_no="${detailUser.emp_no}"/>
							</div>

						</form>
							
						</div>
						
					</div>
				</div>
			</div>
			
<script>
	$('#dept_no').val("${detailUser.dept_no}");
	var genderCode = 4; 
	if("${detailUser.gender}" == "남성"){
		genderCode = 3;
	}
	$('#gender').val(genderCode);
	$('#serve_cd').val("${detailUser.serve_cd}");
	$('#po_cd').val("${detailUser.po_cd}");
</script>