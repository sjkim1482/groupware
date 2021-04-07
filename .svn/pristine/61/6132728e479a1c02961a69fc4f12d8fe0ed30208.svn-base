<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
    
<!-- jQuery EasyUi API -->
	<link rel="stylesheet" type="text/css" href="${cp}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${cp}/easyui/themes/icon.css">
	<script type="text/javascript" src="${cp}/easyui/jquery.easyui.min.js"></script>    

	 <script>
		$(function(){
			$('.tree-title').on('click',function(){
				var emp_no = $(this).children('.emp_no').val();
				$.ajax({
					url : "/empController/detailOrganizationAjaxHtml",
					data : "emp_no=" + emp_no,
					success : function(data) {
						$("#rightMenu").html(data);
					}
				});
			})
			
			//부서등록
			$('#deptsavetBtn').on('click',function(){
				var dept_nm = $('#deptinput').val();
				$('#deptnm').val(dept_nm);
				$('#deptfrm').attr('method','POST');
				$('#deptfrm').submit();
			})
			
			//부서삭제
			$('.deleteDept').on('click',function(){
				var dept_no = $(this).data('dept_no');
				$('#deletedeptno').val(dept_no);
				//경고창
				if(confirm("정말 삭제하시겠습니까??") == true){ //확인
					$('#deptdeletefrm').attr('method','POST');
					$('#deptdeletefrm').submit();
				}else{	//취소
					return false; 
				}
			})
			
			//부서수정
			$('#modifyDept').on('click',function(){
				$('#formModal').modal('hide');
			})
			
		})
	</script>
	
	<%@ include file="../../../common/include.jsp" %>

	<div id="content" class="panel panel-default">
	<!-- 부서신규등록 -->	
	<form action="${cp}/empController/registDept" id="deptfrm">
		<input type="hidden" id="deptnm" name="dept_nm">
	</form>
	
	<!-- 부서삭제 -->
	<form action="${cp}/empController/deleteDept" id="deptdeletefrm">
		<input type="hidden" id="deletedeptno" name="dept_no" >
	</form>

			<div>
				<!-- 좌측매뉴 -->
				<div id="leftMenu" class="col-sm-4 col-md-3">
					<div id="leftTop">
						<h4>
							<label>조직도 </label>
							<input type="button" id="deptregistBtn" class="btn btn-default" style="float: right; margin-right: 20px;" value="관리" data-emp_no="${detailUser.emp_no}" data-toggle="modal" data-target="#formModal">
						</h4>
					</div>
					<div>
						<ul class="easyui-tree" type="square">
							<li><span>부서명</span>
								<ul>
									<c:forEach items="${deptList}" var="deptList"> <!-- 부서명 -->
										<li data-options="state:'closed'"><span>${deptList.dept_nm}</span>
										
											<ul>
												<c:forEach items="${organizationList}" var="organizationList">
													<c:if test="${deptList.dept_no eq organizationList.dept_no}">
														<li>[${deptList.dept_nm}&nbsp;&nbsp; / &nbsp;&nbsp;${organizationList.po_nm}] 
																		&nbsp;&nbsp;${organizationList.ko_nm}<input type="hidden" class="emp_no" value="${organizationList.emp_no}"></li>
													</c:if>
												</c:forEach>
											</ul>
										
										</li>
									</c:forEach>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>


		<div id="rightMenu" class="col-sm-14 col-md-9">
			<div id="righttTop">
				<h4>
					<label>상세정보</label>
				</h4>
			</div>
			<div class="register-card-body">
	
				<div class="input-group" style="float: left;">
					<div class="mailbox-attachments clearfix"
						style="text-align: center; width: 100%;">
						<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 150px; width: 120px; margin: 0 auto;">
							<img id="pictureViewImg" style="width: 100%; height: 100%;" />
						</div>
					</div>
				</div>
	
				<div class="form-group row">
					<label class="col-sm-2" style="font-size: 0.9em; margin-top: 20px;"> 사원번호 </label>
					<div class="col-sm-2 input-group input-group-sm" style="margin-top: 20px;">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 사원id </label>
					<div class="col-sm-2 input-group input-group-sm">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 부서이름 </label>
					<div class="col-sm-2 input-group input-group-sm">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 급여 </label>
					<div class="col-sm-2 input-group input-group-sm">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
				</div>
	
				<div class="form-group row">
					<label class="col-sm-2" style="font-size: 0.9em;"> 한글이름 </label>
					<div class="col-sm-4 input-group input-group-sm" style="float: left;">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 영문이름 </label>
					<div class="col-sm-4 input-group input-group-sm">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 생년월일 </label>
					<div class="col-sm-4 input-group input-group-sm" style="float: left;">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 성별 </label>
					<div class="col-sm-4 input-group input-group-sm">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 개인ph </label>
					<div class="col-sm-4 input-group input-group-sm" style="float: left;">
						<c:if test="${detailUser.per_pn == null}">
							<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
						</c:if>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 부서ph </label>
					<div class="col-sm-4 input-group input-group-sm">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> email </label>
					<div class="col-sm-4 input-group input-group-sm" style="float: left;">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> d_email </label>
					<div class="col-sm-4 input-group input-group-sm">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 주소 </label>
					<div class="col-sm-10 input-group input-group-sm">
						<span class="input-group-append-sm"> &nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 입사일자 </label>
					<div class="col-sm-3 input-group input-group-sm" style="float: left;">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 퇴사일자 </label>
					<div class="col-sm-3 input-group input-group-sm">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 재직상태 </label>
					<div class="col-sm-2 input-group input-group-sm" style="float: left;">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 직급 </label>
					<div class="col-sm-2 input-group input-group-sm" style="float: left;">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>
	
					<label class="col-sm-2" style="font-size: 0.9em;"> 연차일수 </label>
					<div class="col-sm-2 input-group input-group-sm">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>

					<label class="col-sm-2" style="font-size: 0.9em;"> 직무 </label>
					<div class="col-sm-2 input-group input-group-sm" style="float: left;">
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
					</div>

				</div>
				
				
				
				
				
			</div>
		</div>
				<!-- 부서관리modalform -->
				<!-- Form Modal -->
					<div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 400px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">부서관리</h4>
								</div>
								<div class="modal-body">
								<div style="padding: 20px; background: #F0FFF0;">
									<form class="form-horizontal" role="form">
										<div class="form-group">
											<c:forEach items="${deptList}" var="deptList"> <!-- 부서명 -->
												 <div class="form-group row">
												 	<div class="col-sm-9" style="float: left;">
														<li data-options="state:'closed'" style="float: left;"><span>${deptList.dept_nm}</span></li>
												 	</div>
													<div class="col-sm-1">
														<input type="button" class="btn btn-primary deleteDept" value="삭제" style="height: 30px; margin-left: 5px;" data-dept_no="${deptList.dept_no}">
													</div>
												 </div>
											</c:forEach>
										</div>
									</form>
								</div>

									<input type="text" class="form-control" id="deptinput" style="margin-top: 10px; width: 220px; float: left;">
									<button type="button" class="btn btn-primary" id="deptsavetBtn" style="margin-top: 10px; margin-left: 20px; float: left;">신규</button>
									<input type="button" class="btn btn-primary" id="modifyDept" data-toggle="modal" data-target="#formModal2" value="수정" style="margin-top: 10px; margin-left: 5px;">

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Form Modal -->

				<!-- 부서수정 modal form -->
				<!-- Form Modal -->
					<div class="modal fade" id="formModal2" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 400px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">부서수정</h4>
								</div>
								<div class="modal-body">
								<div style="padding: 20px; background: #F0FFF0;">
<!-- 									<form class="form-horizontal" role="form"> -->
										<div class="form-group">
											<c:forEach items="${deptList}" var="deptList"> <!-- 부서명 -->
												 <div class="form-group row">
												 	<form action="${cp}/empController/modifyDept" method="post">
												 	<div class="col-sm-9" style="float: left;">
														<li data-options="state:'closed'" style="float: left;">
															<input type="text" name="dept_nm" value="${deptList.dept_nm}">
															<input type="hidden" name="dept_no" value="${deptList.dept_no}">
														</li>
												 	</div>
													<div class="col-sm-1">
														<input type="submit" class="btn btn-primary modifyDept" value="저장" style="height: 30px; float: left;">
													</div>
													</form>
												 </div>
											</c:forEach>
										</div>
<!-- 									</form> -->
								</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Form Modal -->
</div>
		

            
            
