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
			
    		if (Cookies.get("popup") == "Y") {
	    		return false;
    		
	    	}else{
			    <c:forEach items="${popUpList}" var="popup" varStatus="no" >
				 	window.open("${cp}/board/popUpView?popup_no=${popup.popup_no}", 
						 		"windowPop${no.count}", "width=500, height=600");
				</c:forEach>
	    	}
    		
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
                                <h1 class="text-left timer" data-to="${postList.size()}" data-speed="500">${postList.size()}</h1>
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
							<tr class="odd odd2">
								<td style="text-align: left;" class="pms" data-pms_no="${pms.pms_no}">${pms.pms_nm}</td>
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
							<tr class="odd odd2">
								<td style="text-align: left;" class="pms" data-pms_no="${pms.pms_no}">${pms.pms_nm}</td>
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


<!-- <div class="row"> -->
<!--                     <div class="col-md-3 col-sm-6"> -->
<!--                         <div class="dashboard-tile detail tile-red"> -->
<!--                             <div class="content"> -->
<!--                                 <h1 class="text-left timer" data-from="0" data-to="180" data-speed="2500"> </h1> -->
<!--                                 <p>New Users</p> -->
<!--                             </div> -->
<!--                             <div class="icon"><i class="fa fa-users"></i> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-3 col-sm-6"> -->
<!--                         <div class="dashboard-tile detail tile-turquoise"> -->
<!--                             <div class="content"> -->
<!--                                 <h1 class="text-left timer" data-from="0" data-to="56" data-speed="2500"> </h1> -->
<!--                                 <p>New Comments</p> -->
<!--                             </div> -->
<!--                             <div class="icon"><i class="fa fa-comments"></i> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-3 col-sm-6"> -->
<!--                         <div class="dashboard-tile detail tile-blue"> -->
<!--                             <div class="content"> -->
<!--                                 <h1 class="text-left timer" data-from="0" data-to="32" data-speed="2500"> </h1> -->
<!--                                 <p>New Messages</p> -->
<!--                             </div> -->
<!--                             <div class="icon"><i class="fa fa fa-envelope"></i> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-3 col-sm-6"> -->
<!--                         <div class="dashboard-tile detail tile-purple"> -->
<!--                             <div class="content"> -->
<!--                                 <h1 class="text-left timer" data-to="105" data-speed="2500"> </h1> -->
<!--                                 <p>New Sales</p> -->
<!--                             </div> -->
<!--                             <div class="icon"><i class="fa fa-bar-chart-o"></i> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 tiles end -->
<!--                 dashboard charts and map start -->
<!--                 <div class="row"> -->
<!--                     <div class="col-md-6"> -->
<!--                         <div class="panel panel-default"> -->
<!--                             <div class="panel-heading"> -->
<!--                                 <h3 class="panel-title">Sales for 2014</h3> -->
<!--                                 <div class="actions pull-right"> -->
<!--                                     <i class="fa fa-chevron-down"></i> -->
<!--                                     <i class="fa fa-times"></i> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="panel-body"> -->
<!--                                 <div id="sales-chart" style="height: 250px;"></div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-6"> -->
<!--                         <div class="panel panel-default"> -->
<!--                             <div class="panel-heading"> -->
<!--                                 <h3 class="panel-title">Office locations</h3> -->
<!--                                 <div class="actions pull-right"> -->
<!--                                     <i class="fa fa-chevron-down"></i> -->
<!--                                     <i class="fa fa-times"></i> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="panel-body"> -->
<!--                                 <div class="map" id="map" style="height: 250px;"></div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 dashboard charts and map end -->
<!--                 ToDo start -->
<!--                 <div class="row"> -->
<!--                     <div class="col-md-4"> -->
<!--                         <div class="panel panel-default"> -->
<!--                             <div class="panel-heading"> -->
<!--                                 <h3 class="panel-title">To do list</h3> -->
<!--                                 <div class="actions pull-right"> -->
<!--                                     <i class="fa fa-chevron-down"></i> -->
<!--                                     <i class="fa fa-times"></i> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="panel-body"> -->
<!--                                 <div class="row"> -->
<!--                                     <div class="col-md-12"> -->
<!--                                         <div class="form-group"> -->
<!--                                             <input id="new-todo" type="text" class="form-control" placeholder="What needs to be done?"> -->
<!--                                             <section id='main'> -->
<!--                                                 <ul id='todo-list'></ul> -->
<!--                                             </section> -->
<!--                                         </div> -->
<!--                                         <div class="form-group"> -->
<!--                                             <button id="todo-enter" class="btn btn-primary pull-right">Submit</button> -->
<!--                                             <div id='todo-count'></div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                             </div> -->
<!--                         </div> -->

<!--                         <div class="row"> -->
<!--                             <div class="col-md-12"> -->
<!--                                 <div class="panel panel-default"> -->
<!--                                     <div class="panel-heading"> -->
<!--                                         <h3 class="panel-title">Server Status</h3> -->
<!--                                         <div class="actions pull-right"> -->
<!--                                             <i class="fa fa-chevron-down"></i> -->
<!--                                             <i class="fa fa-times"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="panel-body"> -->

<!--                                         <span class="sublabel">Memory Usage</span> -->
<!--                                         <div class="progress progress-striped"> -->
<!--                                             <div class="progress-bar progress-bar-info" style="width: 20%">20%</div> -->
<!--                                         </div> -->
<!--                                         progress -->

<!--                                         <span class="sublabel">CPU Usage </span> -->
<!--                                         <div class="progress progress-striped"> -->
<!--                                             <div class="progress-bar progress-bar-default" style="width: 60%">60%</div> -->
<!--                                         </div> -->
<!--                                         progress -->

<!--                                         <span class="sublabel">Disk Usage </span> -->
<!--                                         <div class="progress progress-striped"> -->
<!--                                             <div class="progress-bar progress-bar-primary" style="width: 80%">80%</div> -->
<!--                                         </div> -->
<!--                                         progress -->

<!--                                     </div> -->
<!--                                 </div> -->

<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-4"> -->
<!--                         <div class="panel panel-solid-info"> -->
<!--                             <div class="panel-heading"> -->
<!--                                 <h3 class="panel-title">Weather</h3> -->
<!--                                 <div class="actions pull-right"> -->
<!--                                     <i class="fa fa-chevron-down"></i> -->
<!--                                     <i class="fa fa-times"></i> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="panel-body"> -->
<!--                                 <div class="row"> -->
<!--                                     <div class="col-md-6"> -->
<!--                                         <h3 class="text-center small-thin uppercase">Today</h3> -->
<!--                                         <div class="text-center"> -->
<%--                                             <canvas id="clear-day" width="110" height="110"></canvas> --%>
<!--                                             <h4>62°C</h4> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="col-md-6"> -->
<!--                                         <h3 class="text-center small-thin uppercase">Tonight</h3> -->
<!--                                         <div class="text-center"> -->
<%--                                             <canvas id="partly-cloudy-night" width="110" height="110"></canvas> --%>
<!--                                             <h4>44°C</h4> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <div class="panel-footer"> -->
<!--                                 <div class="row"> -->
<!--                                     <div class="col-md-2"> -->
<!--                                         <h6 class="text-center small-thin uppercase">Mon</h6> -->
<!--                                         <div class="text-center"> -->
<%--                                             <canvas id="partly-cloudy-day" width="32" height="32"></canvas> --%>
<!--                                             <span>48°C</span> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                     <div class="col-md-2"> -->
<!--                                         <h6 class="text-center small-thin uppercase">Mon</h6> -->
<!--                                         <div class="text-center"> -->
<%--                                             <canvas id="rain" width="32" height="32"></canvas> --%>
<!--                                             <span>39°C</span> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                     <div class="col-md-2"> -->
<!--                                         <h6 class="text-center small-thin uppercase">Tue</h6> -->
<!--                                         <div class="text-center"> -->
<%--                                             <canvas id="sleet" width="32" height="32"></canvas> --%>
<!--                                             <span>32°C</span> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                     <div class="col-md-2"> -->
<!--                                         <h6 class="text-center small-thin uppercase">Wed</h6> -->
<!--                                         <div class="text-center"> -->
<%--                                             <canvas id="snow" width="32" height="32"></canvas> --%>
<!--                                             <span>28°C</span> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                     <div class="col-md-2"> -->
<!--                                         <h6 class="text-center small-thin uppercase">Thu</h6> -->
<!--                                         <div class="text-center"> -->
<%--                                             <canvas id="wind" width="32" height="32"></canvas> --%>
<!--                                             <span>40°C</span> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                     <div class="col-md-2"> -->
<!--                                         <h6 class="text-center small-thin uppercase">Fri</h6> -->
<!--                                         <div class="text-center"> -->
<%--                                             <canvas id="fog" width="32" height="32"></canvas> --%>
<!--                                             <span>42°C</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-4"> -->
<!--                         <div class="panel panel-default"> -->
<!--                             <div class="panel-body"> -->
<!--                                 <h4>Browser Summary</h4> -->
<!--                                 <div id="donut-example"></div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 ToDo end -->