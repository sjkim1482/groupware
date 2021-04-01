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
	
	<!-- bar chart script -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<!-- bar chart -->

<style>
#timediv {
	font-size: 2.5em;
	text-align: center;
	}

</style>

<script type="text/javascript">

	var pageNum = $("#selectnum").val();

	//페이징처리
	function pagingOnOffAjax(page, pageSize) {
		var data1 = $("#EmpSearching").val();
		var data2 = $("#DeptSearching").val();
		var date1 = $("#DateSearching1").val();
		var date2 = $("#DateSearching2").val();
		
		$.ajax({
			url : "/empController/pagingOnOffAjaxHtml",
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
		});
	}
	
	var attendcnt = ${attendCnt};
	
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
				url : "/empController/pagingOnOffAjaxHtml",
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
		
		function dateSearching(){
			
			var data1 = $("#EmpSearching").val();
			var data2 = $("#DeptSearching").val();
			var date1 = $("#DateSearching1").val();
			var date2 = $("#DateSearching2").val();
			
			$.ajax({
				url : "/empController/pagingOnOffAjaxHtml",
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
		
		pagingOnOffAjax(${pageVo.page}, 15);
		CheckAttend();
		CheckOff();
		
		$("#selectnum").on('click', function(){
			
			var num = $(this).val();
			
			pagingOnOffAjax(${pageVo.page}, num);
			
			var data1 = $("#EmpSearching").val();
			var data2 = $("#DeptSearching").val();
			var date1 = $("#DateSearching1").val();
			var date2 = $("#DateSearching2").val();
			
		})
		
		
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
	
		$("#ConditionResetBtn").on('click', function(){
			$("#EmpSearching").val("");
			$("#DeptSearching").val("");
			$("#DateSearching1").val("");
			$("#DateSearching2").val("");
			
			pagingOnOffAjax(${pageVo.page}, 15);	
		})
	
		// 엑셀 다운로드
		$("#xlxsDownloadBtn").on('click', function(){
			$("#frm1").submit();
		})
		
	})		

	var interval = setInterval(timestamphome, 1000);
	
	 	function timestamphome(){
	 	var date;
		date = new Date();
	
	 	var Today = document.getElementById('TodayDate');
		var time = document.getElementById('timediv'); 
	 	time.innerHTML = date.toLocaleTimeString();
	
	  }
	
</script>

<div id="container">

<!-- 엑셀 다운로드 관리자 or 일반 사원 -->
	<c:choose>
		<c:when test="${S_USER.emp_no == 0 }">
			<form id="frm1" action="/empController/onofflistExcel" method="post">
				
			</form>
		
		</c:when>
		<c:otherwise>
			<form id="frm1" action="/empController/onoffDetailExcel" method="post">
				<input type="hidden" name="emp_no" value="${S_USER.emp_no }">
			</form>
		
		</c:otherwise>
	</c:choose>
	<!-- 공통 레이아웃 -->
	<%@ include file="../../../common/include.jsp" %>

	<!-- body start -->
	<div class="row">

		<div class="col-md-3">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-body" style="height: 785px; min-width: 360px;">

						<!-- grid -->
						<div class="card">
							<div class="register-card-body">
								<!-- real Time Clock START-->
								<div onload="">
									<div id="TodayDate" style="padding-left: 80px;">
										<fmt:formatDate value="<%=(new java.util.Date())%>"
											pattern="YYYY/MM/dd" />

									</div>
									<div class="anim"></div>

									<div class="body_" id="body_">
										<div id="timediv"></div>

									</div>

									<!-- 								<script src="script.js"></script> -->
								</div>
								<!-- real Time Clock END-->
								<!-- attend AND offwork  -->
								<div class="form-group row"
									style="margin-top: 20px; padding-left: 45px;">
									<label class="col-sm-3" style="font-size: 0.9em;"> 출근시간
									</label>
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
									style="margin-left: 35px; width: 255px; vertical-align: middle; 
									text-align-last: center; text-align: center; 
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

		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-heading">
					<c:choose>
						<c:when test="${S_USER.emp_no == 0 }">
							<h3 class="panel-title">근태 현황</h3>
						</c:when>
						<c:otherwise>
							<h3 class="panel-title">${S_USER.ko_nm } 근태 현황</h3>
						</c:otherwise>
					</c:choose>
				
				</div>
	
				<div class="panel-body" style="height: 770px; ">
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
										width: 100px; z-index: 3; position: absolute;">
								<div style="width: 120px; height: 70px;">

									<div>
										<input id="nameCk" type="checkbox"><label for="nameCk">사원</label><br>
										<input id="deptCk" type="checkbox"><label for="deptCk">부서</label><br>
										<input id="dateCk" type="checkbox"><label for="dateCk">기간</label>
									</div>

								</div>
							</div>
							<!-- Searching Condition end -->

							<div class="col-md-12"
								style="overflow: auto; height: 615px; z-index: 2; min-width: 1000px;">

								<table id="example"
									class="table table-striped table-bordered dataTable no-footer"
									cellspacing="0" width="100%" aria-describedby="example_info"
									style="width: 100%;">
									<thead>
										<tr role="row">
											<th>이름</th>
											<th>아이디</th>
											<th>부서</th>
											<th>날짜</th>
											<th>영문이름</th>
											<th>요일</th>
											<th>출근</th>
											<th>퇴근</th>
											<th>지각</th>
										</tr>
										
									</thead>

									<tbody id="onoffTbody">
									</tbody>
								</table>
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
	</div>

</div>

<!-- bar chart Start -->
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
				
					<div id="bar chart"
						style="width: 800px; float: left;">
					</div>
					
					<canvas id="bar-chart" width="1700" height="500"></canvas>
					
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		// Bar chart
		new Chart(document.getElementById("bar-chart"), {
		    type: 'bar',
		    data: {
		      labels: ["Africa", "Asia", "Europe", "Latin America", "North America", "ㅇ", "ㄱ"],
		      datasets: [
		        {
		          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850", "#e3d4r4", "#c45850"],
		          data: [1600,2000,734,784,433,112,500]
		        }
		      ]
		    },
		    options: {
		      legend: { display: false },
		      title: {
		        display: true,
		        text: '연차 바 그래프'
		      }
		    }
		});
	</script>

<!-- bar Chart End -->
