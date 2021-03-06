<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

		<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">인사등록</h3>
					<div class="actions pull-right">
						<i class="fa fa-chevron-down"></i> <i class="fa fa-times"></i>
					</div>
				</div>
				
				<div class="panel-body" style="height: 770px;">
					<div class="card">
						<div class="register-card-body" style="margin: 3px;">
						
						<form method="post" enctype="multipart/form-data" id="profilForm" action="${cp}/empController/empRegist">
							<div class="input-group" style="float: left;">
								<div class="mailbox-attachments clearfix" style="text-align: center; width: 100%;">
									<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 150px; width: 120px; margin: 0 auto;">
											<img id="pictureViewImg" style="width: 100%; height: 100%;"/>
										<input id="profile_nm" type="file" name="profile" accept=".gif, .jpg, .png" style="margin-top: 18px;">
									</div>
								</div>
							</div>
							
							<div class="form-group row" >
								<label class="col-sm-3 control-label" for="inputWarning1" style="font-size: 0.9em;">
									* 사원id <br><span id="idCk"></span></label>
								<div class="col-sm-5 input-group input-group-sm">
									<input type="text" id="empid" name="emp_id" placeholder="사원ID를 입력해주세요.">
								</div>
								
								<label class="col-sm-3 control-label" for="inputWarning1" style="font-size: 0.9em;"> 
									* password <br><span id="pwCk"></span></label>
								<div class="col-sm-5 input-group input-group-sm">
									<input type="password" id="pass" name="pass" placeholder="비밀번호를 입력해주세요.(초기비밀번호:생년월일 앞자리 + 특수기호)"/>
								</div>
								<label class="col-sm-3 control-label" for="inputWarning1" style="font-size: 0.9em;">
									* password확인 <br><span id="pwreCk"></span></label>
								<div class="col-sm-5 input-group input-group-sm">
									<input type="password" id="pass2" name="pass2" placeholder="비밀번호를 입력해주세요.">
								</div>
							
								<label class="col-sm-3 control-label" for="inputWarning1" style="font-size: 0.9em;"> * 부서이름 </label>
								<div class="col-sm-5 input-group input-group-sm">
									<select name="dept_no" id="dept_no">
										<option selected>선택</option>
										<c:forEach items="${deptNm}" var="dept">
											<c:if test="${dept.dept_no != 0}">
												<option value="${dept.dept_no}">${dept.dept_nm}</option>
											</c:if>
										</c:forEach>
									</select>
								
								</div>
							</div>
							<br>
							<div class="form-group row">
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> * 한글이름 </label>
								<div class="col-sm-4 input-group input-group-sm" style="float: left;">
									<input type="text" id="ko_nm" name="ko_nm" placeholder="한글이름을 입력해주세요."/>
								</div>

								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> * 영문이름 </label>
								<div class="col-sm-4 input-group input-group-sm">
									<input type="text" id="eg_nm" name="eg_nm" placeholder="영문이름을 입력해주세요."/>
								</div>
								
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;">  * 생년월일 </label>
								<div class="col-sm-4 input-group input-group-sm" style="float: left;">
									<input type="date" id="birth" name="birth" style="height: 20px;" placeholder="생년월일을 입력해주세요." />
								</div>
							
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;">  * 성별 </label>
								<div class="col-sm-4 input-group input-group-sm">
									<select name="gender" id="gender">
										<option selected>선택</option>
										<c:forEach items="${genderNm}" var="gender">
											<option value="${gender.comm_no}">${gender.cd_ko_nm}</option>
										</c:forEach>
									</select>
								</div>
								
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> * 개인ph</label>
								<div class="col-sm-10 input-group input-group-sm">
									<input type="text" id="per_pn" name="per_pn" placeholder="개인 ph(***-****-****)를 입력해주세요." style="float: left; margin-right: 10px; width: 250px;"/>
									<span id="phCk"></span>
								</div>

								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> 부서ph </label>
								<div class="col-sm-10 input-group input-group-sm">
									<input type="text" id="dept_pn" name="dept_pn" placeholder="부서 ph(***-****-****)를 입력해주세요." style="float: left; margin-right: 10px; width: 250px;"/>
									<span id="dphCk"></span> 
								</div>
							
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> email </label>
								<div class="col-sm-10 input-group input-group-sm">
									<input type="email" id="per_email" name="per_email" placeholder="개인email을 입력해주세요." style="float: left; margin-right: 10px; width: 250px;"/>
									<span id="emailCk"></span> 
								</div>

								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> d_email</label>
								<div class="col-sm-10 input-group input-group-sm">
									<input type="email" id="dept_email" name="dept_email" placeholder="부서email을 입력해주세요." style="float: left; margin-right: 10px; width: 250px;"/>
									<span id="deptemailCk"></span> 
								</div>
							
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> * 주소 </label>
								<div class="col-sm-2 input-group input-group-sm" style="float: left; margin-right: 10px;">
									<input type="text" name="zipcode" id="zipcode" placeholder="zipcode(우편번호)" style="width: 160px;" disabled/>
								</div>
								<div class="col-sm-6 input-group input-group-sm">
									<input type="text" name="addr1" id="addr1" placeholder="addr1(주소)" style="width: 240px;" disabled/>
								</div>       
								
								<div class="col-sm-7 input-group input-group-sm" style="float: left; margin-right: 10px; margin-left: 110px;">
									<input type="text" name="addr2" id="addr2" placeholder="addr2(상세주소)" style="width: 300px; margin-left: 110px;"/>
								</div>
								<div class="col-sm-1 input-group input-group-sm">
									<button type="button" id="addrBtn" class="btn btn-default">주소검색</button>
								</div>
								
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> * 입사일자 </label>
								<div class="col-sm-4 input-group input-group-sm" style="float: left;">
									<input type="date" id="hire_dt" name="hire_dt" style="height: 20px; placeholder="입사일자를 선택해주세요." value='<fmt:formatDate value="${detailUser.hire_dt}" pattern="yyyy-MM-dd"/>'/>
								</div>
								
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> 급여 </label>
								<div class="col-sm-4 input-group input-group-sm">
									<input type="text" id="sal" name="sal" placeholder="급여를 입력해주세요."/>
								</div>
 
								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> * 재직상태 </label>
								<div class="col-sm-4 input-group input-group-sm" style="float: left;">
									<select name="serve_cd" id="serve_cd">
										<c:forEach items="${serveNm}" var="serve">
										<option selected>선택</option>
											<c:if test="${serve.comm_no != 0}">
												<option value="${serve.comm_no}">${serve.cd_ko_nm}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>

								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> * 직급 </label>
								<div class="col-sm-4 input-group input-group-sm">
									<select name="po_cd" id="po_cd">
										<option selected>선택</option>
										<c:forEach items="${poNm}" var="po">
											<c:if test="${po.comm_no != 0 && po.comm_no != 107}">
												<option value="${po.comm_no}">${po.cd_ko_nm}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>

								<label class="col-sm-2 control-label" for="inputWarning1" style="font-size: 0.9em;"> 직무 </label>
								<div class="col-sm-10 input-group input-group-sm"style="float: left;">
									<c:forEach items="${jobNm}" var="job">
										<input type="checkbox" name="job_cd" value="${job.comm_no}"/>${job.cd_ko_nm}
									</c:forEach>
								</div>

									<input type="reset" id="resetBtn" class="btn btn-default" style="float: right; margin-right: 20px;" value="취소"/>
									<input type="button" id="registSaveBtn" class="btn btn-default" style="float: right; margin-right: 20px;" value="저장"/>
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