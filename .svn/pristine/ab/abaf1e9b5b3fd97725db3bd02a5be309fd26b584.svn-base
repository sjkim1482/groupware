<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style>
#timediv {
	font-size: 2.5em;
	text-align: center;
	}

.vl {
  border-right: 1px solid #A4A4A4;
  height: 80px;
  float : left;
  padding-right:20px;
}
</style>

<script type="text/javascript">

	var pageNum = $("#selectnum").val();

	//페이징처리
	function pagingVacAjax(page, pageSize) {
		var data1 = $("#EmpSearching").val();
		var data2 = $("#DeptSearching").val();
		var date1 = $("#DateSearching1").val();
		var date2 = $("#DateSearching2").val();
		
		$.ajax({
			url : "/vacController/vacStatusAjaxHtml",
			tpye : "POST",
			data : {
				"page" : page,
				"pageSize" : pageSize,
				"emp_no" : ${S_USER.emp_no},
				"emp_id" : "${S_USER.emp_id}",
				"data1" : data1,
				"data2" : data2,
				"date1" : date1,
				"date2" : date2
			},
			success : function(data) {
				var html = data.split("####################");
				$("#onoffTbody").html(html[0]);
				$("#pagination").html(html[1]);
			}
			,
			error : function(xhr){
				alert("dd" + xhr.status)
			}
		});
	}
	
	var attendcnt = ${attendCnt};
	
	// 출근 체크
	function CheckAttend(){
		$.ajax({
			url : "/onoffController/checkAttend",
			type : "GET",
			data : "attendCnt=" + attendcnt + "&emp_no=" + ${S_USER.emp_no},
			success : function(data) {
				$("#attendTime").text(data.attendTime);
				$("#workStatus").val(data.empStatus);
			}
		})
	}
	
	// 퇴근 체크
	function CheckOff(){
		$.ajax({
			url : "/onoffController/checkOff",
			type : "GET",
			data : "emp_no=" + ${S_USER.emp_no},
			success : function(data) {
				$("#offworkTime").text(data.offTime);
				$("#todayWork").text(data.workTime);
			}
		})
	}
	
		// 검색 기능 (사원, 부서)
	function empSearching(){
			
		var data1 = $("#EmpSearching").val();
		var data2 = $("#DeptSearching").val();
		var date1 = $("#DateSearching1").val();
		var date2 = $("#DateSearching2").val();
		
		$.ajax({
			url : "/vacController/vacStatusAjaxHtml",
			tpye : "POST",
			data : {
				"page" : ${pageVo.page},
				"pageSize" : pageNum,
				"emp_no" : ${S_USER.emp_no},
				"emp_id" : "${S_USER.emp_id}",
				"data1" : data1,
				"data2" : data2,
				"date1" : date1,
				"date2" : date2
			},
			success : function(data) {
				
				var html = data.split("####################");
				$("#onoffTbody").html(html[0]);
				$("#pagination").html(html[1]);
			},
			error : function(xhr){
				alert("dd" + xhr.status)
			}
		});
	}
		
		// 검색기능 ( 입사 날짜 )
	function dateSearching(){
			
		var data1 = $("#EmpSearching").val();
		var data2 = $("#DeptSearching").val();
		var date1 = $("#DateSearching1").val();
		var date2 = $("#DateSearching2").val();
		
		$.ajax({
			url : "/vacController/vacStatusAjaxHtml",
			tpye : "POST",
			data : {
				"page" : ${pageVo.page},
				"pageSize" : pageNum,
				"emp_no" : ${S_USER.emp_no},
				"emp_id" : "${S_USER.emp_id}",
				"data1" : data1,
				"data2" : data2,
				"date1" : date1,
				"date2" : date2
			},
			success : function(data) {
				var html = data.split("####################");
				$("#onoffTbody").html(html[0]);
				$("#pagination").html(html[1]);
			}
		});
			
	}

	$(function() {
		
		var pageNum = $("#selectnum").val();
		
		// 관리자용과 일반 사원용 페이징이 다름.
		if(${S_USER.emp_no == 0}){
			pagingVacAjax(${pageVo.page}, 15);					
		}else{
			pagingVacAjax(${pageVo.page}, 10);
		}
		
		CheckAttend();
		CheckOff();
		   
		// 휴가(연차) 등록
		$("#registAppAL").on("click", function() {
			$("#app_det_no").val("2");
			$("#app_div_no").val("2");
			$("#appfrm").submit();
		})
		
		// 휴가(반차) 등록
		$("#registAppSRV").on("click", function() {
			$("#app_det_no").val("3");
			$("#app_div_no").val("2");
			$("#appfrm").submit();
		})
		
		
		$("#selectnum").on('click', function(){
			var num = $(this).val();
			
			pagingVacAjax(${pageVo.page}, num);
			
			var data1 = $("#EmpSearching").val();
			var data2 = $("#DeptSearching").val();
			var date1 = $("#DateSearching1").val();
			var date2 = $("#DateSearching2").val();	
		})
		
		// 출근하기
		$("#attendBtn").on('click', function(){
			if(attendcnt == 0){
				$.ajax({
					url : "/onoffController/doattend",
					tpye : "POST",
					data : {
						"emp_no" : ${S_USER.emp_no}
					},
					success : function(data) {
						$("#attendTime").text(data.attend_time);													
						attendcnt++;
					}
				})
			}
		})
			
		// 퇴근하기
		$("#offBtn").on("click", function(){
			if(attendcnt > 0){
				$.ajax({
					url : "/onoffController/dooff",
					tpye : "POST",
					data : {
						"emp_no" : ${S_USER.emp_no} 
					},
					success : function(data) {
						$("#offworkTime").text(data.offTime);
						$("#todayWork").text(data.workTime);
					}
				})
			}
		})
		
		// 정보상태변경
		$("#workStatus").change(function(){
			var sta = $(this).val();
			
			console.log(sta);
			
			$.ajax({
				url : "/onoffController/workStatus",
				type : "POST",
				data : {
					"comm_cd" : sta,
					"emp_no" : ${S_USER.emp_no}
				},
				success : function(data) {	
					$("#workStatus").val(data.empSta);
					
				}
			})		
		})
		
		// 검색 조건 나타내기 OR 안보이기
		
		var Visible = 1;
		
		$("#ck_main").on('click', function(){
			
			if(Visible == 1){
				document.getElementById("ConditionBox").style.display="block";
				Visible--;
			}else{
				document.getElementById("ConditionBox").style.display="none";
				Visible++;
			}
		})
		
		var display = 3;
		var Visible1 = 1;
		
		$("#nameCk").on('click', function(){
			
			if(Visible1 == 1){
				document.getElementById("ConditionResetBtn").style.display="inline";
				document.getElementById("searchEmp").style.display="inline";
				Visible1--;
				display--;
			}else{
				document.getElementById("searchEmp").style.display="none";
				Visible1++;
				display++;
				if(display == 3){
					document.getElementById("ConditionResetBtn").style.display="none";
				}

			}
			
		})
		
		var Visible2 = 1;
		
		$("#deptCk").on('click', function(){
			
			if(Visible2 == 1){
				document.getElementById("ConditionResetBtn").style.display="inline";
				document.getElementById("searchDept").style.display="inline";
				Visible2--;
				display--;	
			}else{
				document.getElementById("searchDept").style.display="none";
				Visible2++;
				display++;
				
				if(display == 3){
					document.getElementById("ConditionResetBtn").style.display="none";
				}
			}	
		})
		
		var Visible3 = 1;
		
		$("#dateCk").on('click', function(){
			
			if(Visible3 == 1){
				document.getElementById("ConditionResetBtn").style.display="inline";
				document.getElementById("searchDate").style.display="inline";
				Visible3--;
				display--;
			}else{
				document.getElementById("searchDate").style.display="none";
				Visible3++;
				display++;
				
				if(display == 3){
					document.getElementById("ConditionResetBtn").style.display="none";
				}
			}
			
		})
				
		// 검색조건 끝
	
		// 검색조건 초기화
		$("#ConditionResetBtn").on('click', function(){
			
			$("#EmpSearching").val("");
			$("#DeptSearching").val("");
			$("#DateSearching1").val("");
			$("#DateSearching2").val("");
			
			if(${S_USER.emp_no == 0}){
				pagingVacAjax(${pageVo.page}, 15);					
			}else{
				pagingVacAjax(${pageVo.page}, 10);
			}
		})
		
		// 엑셀 다운로드
		$("#xlxsDownloadBtn").on('click', function(){
			$("#frm1").submit();
		})
		
	})		
	//function 끝
	
	// 현재시간
	var interval = setInterval(timestamphome, 1000);
	
	function timestamphome(){
		
		var date;
		date = new Date();
		
		var Today = document.getElementById('TodayDate');
		var time = document.getElementById('timediv'); 
		time.innerHTML = date.toLocaleTimeString();
		
	}
	
</script>

<form id="appfrm" action="${cp}/app/registApp" method="get">
	<input type="hidden" name="emp_no" value="${S_USER.emp_no}">
	<input type="hidden" id="app_div_no" name="app_div_no">
	<input type="hidden" id="app_det_no" name="app_det_no">
</form>

<div id="container">
	
	<c:choose>
		<c:when test="${S_USER.emp_no == 0 }">
	<form id="frm1" action="/vacController/vacUsedlistExcel">
	</form>
		</c:when>
		<c:otherwise>
			<form id="frm1" action="/vacController/vacDetUsedlistExcel">
				<input type="hidden" name="emp_no" value="${S_USER.emp_no }">
			</form>
		</c:otherwise>
	</c:choose>
	
	<%@ include file="../../../common/include.jsp"%>

	<div class="row">

			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-body" style="height: 817px; min-width: 360px;">
	
							<!-- grid -->
							<div class="card">
								<div class="register-card-body">
									<!-- real Time Clock START-->
									<div onload="">
										<div id="TodayDate">
										<span style="padding-left: 80px;">
											<fmt:formatDate value="<%=(new java.util.Date())%>"
												pattern="YYYY/MM/dd" />
										</span>
												
												<div class="body_" id="body_">
													<div id="timediv"></div>
			
												</div>
	
										<!-- <script src="script.js"></script> -->
									</div>
									<!-- real Time Clock END-->
									<!-- attend AND offwork  -->
									<div class="form-group row"
										style="margin-top: 20px; padding-left: 45px;">
										
										<label class="col-sm-3" style="font-size: 0.9em;"> 출근시간 </label>
										<div class="col-sm-3 input-group input-group-sm"
											style="padding-left: 100px;">
											<c:choose>
												<c:when test="${attendCnt == 0 }">
													<p id="attendTime">&nbsp;&nbsp;&nbsp;-</p>
												</c:when>
												<c:otherwise>
													<p id="attendTime">${QRattendTime }</p>
													
												</c:otherwise>
											</c:choose>
										</div>
	
										<label class="col-sm-3" style="font-size: 0.9em;"
											style="margin-top : 20px;"> 퇴근시간 </label>
										<div class="col-sm-3 input-group input-group-sm"
											style="padding-left: 100px;">
											<p id="offworkTime">&nbsp;&nbsp;&nbsp;-</p>
										</div>
	
										<label class="col-sm-3" style="font-size: 0.9em;"
											style="margin-top : 20px;"> 근무시간 </label>
										<div class="col-sm-3 input-group input-group-sm"
											style="padding-left: 99px;">
											<p id="todayWork">&nbsp;&nbsp;&nbsp;-</p>
										</div>
	
									</div>
									<!-- hr line -->
									<hr>
									<form id="onoffFrm">
										<div style="text-align: center; witdh:110px; min-width: 110px;">
											<button type="button"
												style="width: 110px; margin-right:32px;" id="attendBtn"
												class="btn btn-primary btn-trans">출근하기</button>
											<button type="button"
												style="width: 110px; margin-right:5px; text-align: center;"
												id="offBtn" class="btn btn-primary btn-trans">퇴근하기</button>
										</div>
									</form>
									
														
									<select id="workStatus" class="btn btn-primary btn-trans"
										data-toggle="dropdown" aria-expanded="true"
										style="margin-left: 35px; width: 255px; vertical-align: middle; text-align-last: center; text-align: center; 
										-ms-text-align-last: center; -moz-text-align-last: center;">
										<c:forEach items="${workStatus }" var="Wkstatus">
											<option value="${Wkstatus.comm_no }">${Wkstatus.cd_ko_nm }</option>
										</c:forEach>
									</select>
	
								</div>
								<!-- grid end -->
	
							</div>
	
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<c:choose>
			<c:when test="${S_USER.emp_no != 0 }">
			
				<!-- 개인 연차일수 계산 -->
				<div class="col-md-9">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-body" style="height: 100px; min-width: 360px;">
			
								<!-- grid -->
								<div class="card">
									<div class="register-card-body">
									
										<div class="vacinfo" style="width : 300px; float: left; margin-left : 95px; text-align:center;">
										
											<label>총 연차 </label><br>
												<c:choose>
													<c:when test="${vacVo.total_vac == 0 }">
														<label style="font-size:40px; margin-right:5px;">${vacVo.total_mon_vac }</label>
													</c:when>
													<c:otherwise>
														<label style="font-size:40px; margin-right:5px;">${vacVo.total_vac }</label>
													</c:otherwise>
												</c:choose>
														
										</div>
										
										<div class="vl"></div>
											
										
										<div class="vacinfo" style="width : 300px; float: left; text-align:center;">
										
											<label>사용 연차 </label><br> 
											<label style="font-size:40px;">${vacVo.used_vac }</label>
														
										</div>
										
										<div class="vl"></div>
											
											
										<div class="vacinfo" style="width : 300px; float: left; padding-left : 50px; text-align:center;">
											<label>잔여 연차 </label> <br>
											<label style="font-size:40px;">${vacVo.remain_vac }</label>
										</div>
									
									</div>	
								</div>
								<!-- grid end -->
							</div>
						</div>
					</div>
				</div>
			<!-- 연차일수 계산 End -->
			
				<div class="col-md-9">
					<div class="panel panel-default">
						<div class="panel-heading">
							<c:choose>
								<c:when test="${S_USER.emp_no == 0 }">
									<h3 class="panel-title">연차 사용 현황</h3>
								</c:when>
								<c:otherwise>
									<h3 class="panel-title">${S_USER.ko_nm }님 연차 사용 현황</h3>
								</c:otherwise>
							</c:choose>
						</div>
			
						<div class="panel-body" style="height: 648px;">
							<div class="panel-body">
								<div role="grid" id="example_wrapper"
									class="dataTables_wrapper form-inline no-footer">
								<div class="row">
										<div class="col-xs-6" style="float: left;">
											<div class="dataTables_length" id="example_length"
												style="padding-left: 15px; width: 1141px;">
		
												<c:if test="${S_USER.emp_no == 0 }">
													<a id="ck_main" class="btn_tool" style=""> <span
														class="txt" style="cursor: pointer; position: absolute;"><strong>+
																검색 조건</strong> </span>
													</a>
												</c:if>	
		
												<!--//display none block-->
												<span style="margin-left:95px;">
													<span id="searchEmp" style="display: none;"> 
																<label>사원명:
																<input style="width: 120px;" id="EmpSearching" type="search"
																class="form-control input-sm" aria-controls="example"
																onkeyup="empSearching()">
																</label>
													</span> 
													
													<span id="searchDept" style="display: none;"> 
																<label>부서명:
																<input style="width: 120px;" id="DeptSearching" type="search"
																class="form-control input-sm" aria-controls="example"
																onkeyup="empSearching()">
																</label>
													</span> 
													<c:choose>
														<c:when test="${S_USER.emp_no == 0 }">
													<span id="searchDate" style="display: none;"> 
																<label>기간:
																<input style="width: 150px;" id="DateSearching1" type="date"
																class="form-control input-sm" aria-controls="example" onchange="dateSearching()">											
																~ 
																<input style="width: 150px;" id="DateSearching2"
																type="date" class="form-control input-sm" aria-controls="example" onchange="dateSearching()">
														</label>
													</span>
														<label style="float:right;"> 
															<select
																id="selectnum" name="example_length" aria-controls="example"
																class="form-control input-sm">
																	<option value="10">10</option>
																	<option value="30">30</option>
																	<option value="50">50</option>
																	<option value="100">100</option>
															
															</select>
														</label>
														<!-- 엑셀 다운로드 -->
														<input type="submit" id="xlxsDownloadBtn"
															class="btn btn-default" value="엑셀 다운로드"
															style="float:right; margin-right:5px;">
					
														<!-- 엑셀 다운로드 끝 -->
														
														</c:when>
												
														
														<c:otherwise>
														
															<span id="searchDate" style="display: block; width: 1155px;"> 
																<label >기간:
																<input style="width: 150px;" id="DateSearching1" type="date"
																class="form-control input-sm" aria-controls="example" onchange="dateSearching()">											
																~ 
																<input style="width: 150px;" id="DateSearching2"
																type="date" class="form-control input-sm" aria-controls="example" onchange="dateSearching()">
														</label>
														<input type="button" value="초기화" id="ConditionResetBtn" style="display: inline;">
														<label style="float:right; margin-right:28px;"> <select
															id="selectnum" name="example_length" aria-controls="example"
															class="form-control input-sm">
																<option value="10">10</option>
																<option value="30">30</option>
																<option value="50">50</option>
																<option value="100">100</option>
														
														</select>
													</label>
														<!-- 엑셀 다운로드 -->
														<input type="submit" id="xlxsDownloadBtn"
															class="btn btn-default" value="엑셀 다운로드"
															style="float:right; margin-right:5px;">
					
														<!-- 엑셀 다운로드 끝 -->
														
													</span>
														</c:otherwise>
													</c:choose>
													</span>
													<input type="button" value="초기화" id="ConditionResetBtn" style="display: none;">
											</div>
										</div>

									</div>
									<!-- display : none and block ( Searching conditions) -->
									
									<div class="array_option" id="ConditionBox"
										style="display: none; background: #eee; border-radius: 4px; box-shadow: 1px 2px 10px rgb(0 0 0/ 40%); 
												width: 100px; z-index: 3; position: absolute; margin-left:14px;">
										<div style="width: 120px; height: 70px; ">
		
											<div>
												<input id="nameCk" type="checkbox"><label for="nameCk">사원</label><br>
												<input id="deptCk" type="checkbox"><label for="deptCk">부서</label><br>
												<input id="dateCk" type="checkbox"><label for="dateCk">입사일</label>
		
											</div>
		
										</div>
									</div>
									<!-- Searching Condition end -->
		
									<div class="col-md-12"
										style="overflow: auto; height: 470px; z-index: 2; min-width: 1000px;">
		
										<table id="example"
											class="table table-hover"
											cellspacing="0" width="100%" aria-describedby="example_info"
											style="width: 100%;">
											<thead>
												<tr role="row">
		
													<th>이름</th>
													<th>부서</th>
													<th>사용 기간</th>
													<th>사용 일수</th>
													<th>연차 분류</th>
				
											</thead>
		
											<tbody id="onoffTbody">
												
											</tbody>
										</table>  
										<div style="float: right;">       
											<button type="button" id="registAppAL" class="btn btn-primary ">연차 신청</button>
											<button type="button" id="registAppSRV" class="btn btn-primary ">반차 신청</button>
										</div>
									</div>
									<div class="row">
										<!-- 								<div class="col-xs-6"></div> -->
										<div style="text-align: center;">
											<div class="dataTables_paginate paging_simple_numbers"
												id="example_paginate">
												<ul id="pagination" class="pagination">
													
												</ul>
											</div>
										</div>
		
									</div>
		
								</div>
		
							</div>
						</div>
					</div>
				</div>
				
			</c:when>
			
			<c:otherwise>
					<div class="col-md-9">
					<div class="panel panel-default">
						<div class="panel-heading">
							<c:choose>
								<c:when test="${S_USER.emp_no == 0 }">
									<h3 class="panel-title">연차 사용 현황</h3>
								</c:when>
								<c:otherwise>
									<h3 class="panel-title">${S_USER.ko_nm }님 연차 사용 현황</h3>
								</c:otherwise>
							</c:choose>
						</div>
			
						<div class="panel-body" style="height: 800px;">
							<div class="panel-body">
								<div role="grid" id="example_wrapper"
									class="dataTables_wrapper form-inline no-footer">
								<div class="row">
										<div class="col-xs-6" style="float: left;">
											<div class="dataTables_length" id="example_length"
												style="padding-left: 15px; width: 1141px;">
		
												<c:if test="${S_USER.emp_no == 0 }">
													<a id="ck_main" class="btn_tool" style=""> <span
														class="txt" style="cursor: pointer; position: absolute;"><strong>+
																검색 조건</strong> </span>
													</a>
												</c:if>	
		
												<!--//display none block-->
												<span style="margin-left:95px;">
													<span id="searchEmp" style="display: none;"> 
																<label>사원명:
																<input style="width: 120px;" id="EmpSearching" type="search"
																class="form-control input-sm" aria-controls="example"
																onkeyup="empSearching()">
																</label>
													</span> 
													
													<span id="searchDept" style="display: none;"> 
																<label>부서명:
																<input style="width: 120px;" id="DeptSearching" type="search"
																class="form-control input-sm" aria-controls="example"
																onkeyup="empSearching()">
																</label>
													</span> 
													<c:choose>
														<c:when test="${S_USER.emp_no == 0 }">
													<span id="searchDate" style="display: none;"> 
																<label>기간:
																<input style="width: 150px;" id="DateSearching1" type="date"
																class="form-control input-sm" aria-controls="example" onchange="dateSearching()">											
																~ 
																<input style="width: 150px;" id="DateSearching2"
																type="date" class="form-control input-sm" aria-controls="example" onchange="dateSearching()">
														</label>
													</span>
														<label style="float:right;"> 
															<select
																id="selectnum" name="example_length" aria-controls="example"
																class="form-control input-sm">
																	<option value="15">15</option>
																	<option value="30">30</option>
																	<option value="50">50</option>
																	<option value="100">100</option>
															
															</select>
														</label>
														<!-- 엑셀 다운로드 -->
														<input type="submit" id="xlxsDownloadBtn"
															class="btn btn-default" value="엑셀 다운로드"
															style="float:right; margin-right:5px;">
					
														<!-- 엑셀 다운로드 끝 -->
														
														</c:when>
												
														
														<c:otherwise>
														
															<span id="searchDate" style="display: block; width: 1155px;"> 
																<label >기간:
																<input style="width: 150px;" id="DateSearching1" type="date"
																class="form-control input-sm" aria-controls="example" onchange="dateSearching()">											
																~ 
																<input style="width: 150px;" id="DateSearching2"
																type="date" class="form-control input-sm" aria-controls="example" onchange="dateSearching()">
														</label>
														<input type="button" value="초기화" id="ConditionResetBtn" style="display: inline;">
														<label style="float:right; margin-right:28px;"> <select
															id="selectnum" name="example_length" aria-controls="example"
															class="form-control input-sm">
																<option value="10">10</option>
																<option value="30">30</option>
																<option value="50">50</option>
																<option value="100">100</option>
														
														</select>
													</label>
														<!-- 엑셀 다운로드 -->
														<input type="submit" id="xlxsDownloadBtn"
															class="btn btn-default" value="엑셀 다운로드"
															style="float:right; margin-right:5px;">
					
														<!-- 엑셀 다운로드 끝 -->
														
													</span>
														</c:otherwise>
													</c:choose>
													</span>
													<input type="button" value="초기화" id="ConditionResetBtn" style="display: none;">
											</div>
										</div>
										
										
										
									</div>
									<!-- display : none and block ( Searching conditions) -->
									
									<div class="array_option" id="ConditionBox"
										style="display: none; background: #eee; border-radius: 4px; box-shadow: 1px 2px 10px rgb(0 0 0/ 40%); 
												width: 100px; z-index: 3; position: absolute; margin-left:14px;">
										<div style="width: 120px; height: 70px; ">
		
											<div>
												<input id="nameCk" type="checkbox"><label for="nameCk">사원</label><br>
												<input id="deptCk" type="checkbox"><label for="deptCk">부서</label><br>
												<input id="dateCk" type="checkbox"><label for="dateCk">입사일</label>
		
											</div>
		
										</div>
									</div>
									<!-- Searching Condition end -->
		
									<div class="col-md-12"
										style="overflow: auto; height: 670px; z-index: 2; min-width: 1000px;">
		
										<table id="example"
											class="table table-hover"
											cellspacing="0" width="100%" aria-describedby="example_info"
											style="width: 100%;">
											<thead>
												<tr role="row">
		
													<th>이름</th>
													<th>부서</th>
													<th>사용 기간</th>
													<th>사용 일수</th>
													<th>연차 분류</th>
				
											</thead>
		
											<tbody id="onoffTbody">
												
											</tbody>
										</table>  
										<div style="float: right;">       
											<button type="button" id="registAppAL" class="btn btn-primary ">연차 신청</button>
											<button type="button" id="registAppSRV" class="btn btn-primary ">반차 신청</button>
										</div>
									</div>
									<div class="row">
										<!-- 								<div class="col-xs-6"></div> -->
										<div style="text-align: center;">
											<div class="dataTables_paginate paging_simple_numbers"
												id="example_paginate">
												<ul id="pagination" class="pagination">
													
												</ul>
											</div>
										</div>
		
									</div>
		
								</div>

							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<!-- End Container -->


