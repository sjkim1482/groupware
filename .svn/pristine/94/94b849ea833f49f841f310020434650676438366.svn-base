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
					url : "/empController/empDetailOrganizationAjaxHtml",
					data : "emp_no=" + emp_no,
					success : function(data) {
						$("#rightMenu").html(data);
					}
				});
			})
		})
	</script>

   <%@ include file="../../../common/include.jsp" %>
	
	<div id="content">
			<div>
				<!-- 좌측매뉴 -->
				<div id="leftMenu" class="col-sm-4 col-md-3">
					<div id="leftTop">
						<h4>
							<label>조직도 </label>
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
					<label class="col-sm-2" style="font-size: 0.9em; margin-top: 20px;">
						사원번호 </label>
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
						<span class="input-group-append-sm">&nbsp;&nbsp;&nbsp;</span>
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
</div>
		

            
            
