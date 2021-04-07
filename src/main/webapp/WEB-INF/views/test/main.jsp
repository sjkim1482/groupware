<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>   
 <style>
#timediv {
	font-size: 2.5em;
	text-align: center;
	}
.workday {
	margin-left:205px;
}

</style>
    <script>
    
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

    	$(function() {
			
    		if (Cookies.get("popup") == "Y") {
	    		return false;
    		
	    	}else{
			    <c:forEach items="${popUpList}" var="popup" varStatus="no" >
				 	window.open("${cp}/board/popUpView?popup_no=${popup.popup_no}", 
						 		"windowPop${no.count}", "width=500, height=600");
				</c:forEach>
	    	}
    		
    		var pageNum = $("#selectnum").val();
    		
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
    		
    		$(".postDetail").on("click", function() {
			
			
				var post_no = $(this).data("post_no");
				
				
				$("#post_no").val(post_no);
				
				$("#frmPost").attr("method","get");
		 		$("#frmPost").attr("action","${cp}/board/postDetail");
		 		$("#frmPost").submit();
				
				
			})
			
			$(".scd").on("click",function(){
				//this : 클릭 이벤트가 발생한 element
				//data- 속성명 data-userid, 속성명은 대소문자 무시하고 소문자로 인식
				//data-userId ==>data-userid
				var scd_no = $(this).data("scdno");
				$("#scd_no").val(scd_no);
				console.log(scd_no);
				 window.open("${cp}/scd/calendarView?scd_no="+scd_no, "PopupWin", "width=1000,height=600");

			});
    		
   			$(".appDetail").on("click",  function() {
				var app_char = $(this).data("app_char");
				$("#app_char").val(app_char);
				$("#appDatailFrm").attr("action","${cp}/app/appDetail");
				$("#appDatailFrm").submit();
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
    		
    		$(".pms").on("click",function(){
				//this : 클릭 이벤트가 발생한 element
				//data- 속성명 data-userid, 속성명은 대소문자 무시하고 소문자로 인식
				//data-userId ==>data-userid
				var pms_no = $(this).data("pms_no");
				$("#pms_no").val(pms_no);
				console.log(pms_no);
				$("#frm").submit();
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
<form id="appDatailFrm"  method="get">
	<input type="hidden" id="app_char" name="app_char">
</form>

<form action="${cp}/pms/pmsView" id="frmPost" method="get">
	<input type="hidden" id="post_no" name="post_no" value=""/>
</form>

<form action="${cp}/pms/pmsView" id="frm" method="get">
	<input type="hidden" id="pms_no" name="pms_no"  >
</form>
<div class="col-md-3">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-body" style="height: 770px; min-width: 360px;">

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
<div class="col-md-3 col-sm-6">
                        <div class="dashboard-tile detail tile-red">
                            <div class="content">
                                <h1 class="text-left timer" data-from="0" data-to="${userCnt-1}" data-speed="500">${userCnt-1}</h1>
                                <p>총 사원 수</p>
                            </div>
                            <div class="icon"><i class="fa fa-users"></i>
                            </div>
                        </div>
                    </div>
                   <div class="col-md-3 col-sm-6">
                        <div class="dashboard-tile detail tile-blue">
                            <div class="content">
                                <h1 class="text-left timer" data-from="0" data-to="${noReadMsgCnt}" data-speed="500">${noReadMsgCnt}</h1>
                                <p>읽지않은 쪽지</p>
                            </div>
                            <div class="icon"><i class="fa fa fa-envelope"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="dashboard-tile detail tile-purple">
                            <div class="content">
                                <h1 class="text-left timer" data-to="${postList.size()-1}" data-speed="500">${postList.size()-1}</h1>
                                <p>진행중인 프로젝트</p>
                            </div>
                            <div class="icon"><i class="fa fa-bar-chart-o"></i>
                            </div>
                        </div>
                    </div>
                   
 
<div class="col-sm-5" style="margin-top: 20px;">

<div class="panel panel-default" style="height: 300px;">

<div class="panel-heading">
    <h3 class="panel-title">${bor_nm}</h3>
   
</div>

<%-- <h3 style="text-align: center;">${bor_nm} </h3> --%>
<!-- <br> -->
<table class="table table-hover" cellspacing="0" width="100%" aria-describedby="example_info" style="width: 100%;">
			<thead>
				<tr> 
					<!-- <th>게시글 번호</th> -->
					
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">작성자</th>
					<th style="text-align: center;">작성일자</th>
					<th style="text-align: center;">조회수</th>
				</tr>
			</thead>

			<tbody>
		
			<c:forEach items="${postList}" var="post">
				<c:if test="${post.del_cd == 0}">
					<tr class="postDetail"  data-post_no="${post.post_no}" data-del_cd="${post.del_cd}" >
						<%-- <td>${post.post_no}</td> --%>
						<td>
							<c:forEach begin="1" end="${post.boardLevel}" var="i">
								<c:if test="${i>1}">
								&ensp;&ensp;&ensp;&ensp;
							</c:if>
						</c:forEach>
						<c:if test="${post.boardLevel!=1}">↳</c:if>
						${post.title}</td>
						<td style="text-align: center;">${post.ko_nm}</td>
						<td style="text-align: center;"><fmt:formatDate value="${post.reg_dt}" pattern="yyyy-MM-dd"/></td>
						<td style="text-align: center;">${post.hits}</td>
					</tr>
				</c:if>
			
			</c:forEach>
			</tbody>
		</table>

</div>    

</div>  
 
 
 
<div class="col-sm-4" style="margin-top: 20px;">
<div class="panel panel-default" style="height: 300px;">
<div class="panel-heading">
    <h3 class="panel-title">결재대기 문서함</h3>
   
</div>
<!-- <div id="appTable" class="panel panel-default"> -->
<!-- </div> -->


<!-- <h3 style="text-align: center;">결재대기 문서함</h3><br> -->
<table class="table table-hover" cellspacing="0" width="100%" aria-describedby="example_info"	style="width: 100%;">
	<thead>
	<tr>
		<th style="text-align: center;">문서번호</th>
		<th style="text-align: center;">구분</th>
		<th style="text-align: center;">제목</th>
		<th style="text-align: center;">작성자</th>
		<th style="text-align: center;">작성일자</th>
	</tr>
	</thead>
	<c:forEach items="${appList}" var="app">
		<tr class="appDetail" data-app_char="${app.app_char}">
			<td style="text-align: center;">${app.app_char}</td>
			<td style="text-align: center;">${app.app_det_title}</td>
			<td >${app.title}</td>
			<td style="text-align: center;">${app.ko_nm}</td>
			<td style="text-align: center;"><fmt:formatDate value="${app.reg_dt}" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>

</table>



</div>    
</div>


<div class="col-sm-5">
<div class="panel panel-default" style="height: 300px;">
<div class="panel-heading">
			<h3 class="panel-title">진행중인 프로젝트</h3>
		</div>
		
	
				<table class="table table-hover" cellspacing="0" width="100%" aria-describedby="example_info"	style="width: 100%;">
					<thead>
						<tr style="text-align: center;">
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">시작날짜</th>
							<th style="text-align: center;">종료날짜</th>
							<th style="text-align: center;">작성자</th>
							<th style="text-align: center;">부서</th>
						</tr>
					</thead>

					<tbody>   
						<c:forEach items="${pmsList}" var="pms" varStatus="loop">
							<tr class="odd odd2 pms" data-pms_no="${pms.pms_no}">
								<td style="text-align: left;">${pms.pms_nm}</td>
								<td><fmt:formatDate value="${pms.s_dt}" pattern="yyyy-MM-dd" /></td> 
								<td><fmt:formatDate value="${pms.e_dt}" pattern="yyyy-MM-dd" /></td> 
								<td>${pms.ko_nm}</td>
								<td>${pms.dept_nm}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
 
<!-- <div id="appTable" class="panel panel-default"> -->
<!-- </div> -->


<!-- <h3 style="text-align: center;">결재대기 문서함</h3><br> -->



</div>    
</div>


<div class="col-sm-4">
<div class="panel panel-default" style="height: 300px;">
<div class="panel-heading">
			<h3 class="panel-title">오늘 일정</h3>
		</div>
		
	
				<table class="table table-hover" cellspacing="0" width="100%" aria-describedby="example_info"	style="width: 100%;">
					<thead>
						<tr style="text-align: center;">
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">시작날짜</th>
							<th style="text-align: center;">종료날짜</th>
							<th style="text-align: center;">구분</th>
						</tr>
					</thead>

					<tbody>   
						<c:forEach items="${scdList}" var="scd" varStatus="loop">
							<tr class="odd odd2 scd" data-scdno="${scd.scd_no}">
								<td style="text-align: left;">${scd.title}</td>
								<td><fmt:formatDate value="${scd.s_dt}" pattern="yyyy-MM-dd" /></td> 
								<td><fmt:formatDate value="${scd.e_dt}" pattern="yyyy-MM-dd" /></td> 
								<td>${scd.scd_div_nm}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
 
<!-- <div id="appTable" class="panel panel-default"> -->
<!-- </div> -->


<!-- <h3 style="text-align: center;">결재대기 문서함</h3><br> -->



</div>    
</div>

