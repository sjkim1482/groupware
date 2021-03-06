<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>

$(function(){
// 	pagingWorkAjax(1,5);
	
	$(".work").on("click",function(){
		//this : 클릭 이벤트가 발생한 element
		//data- 속성명 data-userid, 속성명은 대소문자 무시하고 소문자로 인식
		//data-userId ==>data-userid
		var work_no = $(this).data("work_no");
		var pms_no = $(this).data("pms_no");
		$("#work_no").val(work_no);
		$("#pms_no").val(pms_no);
// 		$("#bor_no").val(bor_no);
// 		$("#user_id").val(user_id);
		$("#frm").submit();
	});
	$("#chartBtn").on("click",function(){
		var pms_no = $(this).data("pms_no");
		$("#pms_no").val(pms_no);
		$("#frmChart").submit();
	})
})

 google.charts.load('current', {'packages':['gantt']});
    google.charts.setOnLoadCallback(drawChart);
    function daysToMilliseconds(days) {
        return days * 24 * 60 * 60 * 1000;
      }
    function drawChart() {
		
    	 var data = new google.visualization.DataTable();
         data.addColumn('string', 'Task ID');
         data.addColumn('string', 'Task Name');
         data.addColumn('date', 'Start Date');
         data.addColumn('date', 'End Date');
         data.addColumn('number', 'Duration');
         data.addColumn('number', 'Percent Complete');
         data.addColumn('string', 'Dependencies');
//       var data = new google.visualization.DataTable();
//       data.addColumn('string', 'Task ID');
//       data.addColumn('string', 'Task Name');
// //       data.addColumn('string', 'Resource');
//       data.addColumn('date', 'Start Date');
//       data.addColumn('date', 'End Date');
//       data.addColumn('number', 'Duration');
//       data.addColumn('number', 'Percent Complete');
//       data.addColumn('string', 'Dependencies');

      data.addRows([
    	  
    	 <c:forEach items="${pmsChartList}" var="pmsChartList" varStatus="status">
    	         <c:if test="${status.count > 1}">
	    			,
	    		</c:if>
	    			 <c:choose>
	    		    	<c:when test="${pmsChartList.higher_work_no != 0}">
	    		    		 ['${pmsChartList.work_no}', '${pmsChartList.work_nm}', null,
	    		    			 new Date("${pmsChartList.e_dtS}"), daysToMilliseconds(${pmsChartList.getDays()})

	    		 	          , ${pmsChartList.prog}, '${pmsChartList.higher_work_no}']
	    		    	</c:when>
	    		    	<c:otherwise>
	    		    		 ['${pmsChartList.work_no}', '${pmsChartList.work_nm}', 
	    		    		  new Date("${pmsChartList.s_dtS}"),
	    		 	         new Date("${pmsChartList.e_dtS}"), null, ${pmsChartList.prog}, null]
	    		    	</c:otherwise>
	    		    </c:choose>
    	 
    	  </c:forEach>

      ]);

      var options = {
        height: 600,
        gantt: {
          trackHeight: 30
        }
      };

      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));
    
      chart.draw(data, options);
    }
</script>
<style>
.tAr{
 	text-align: right; 
 	padding-right: 3%; 
 	min-width: 400px;
	
}
.odd{
	text-align: center; 
}
</style>
<form id="frm" action="${cp}/pms/workDetail">
	<input type="hidden" id="work_no" name="work_no" value="">
	<input type="hidden" id="pms_no" name="pms_no" value="">
</form>

<form id="frmChart" action="${cp}/pms/selectListChart">
	<input type="hidden" id="pms_no" name="pms_no" value="">
</form>

   
<!-- 총 추정시간 표시하기  -->

<div class="col-md-9">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">일감</h3>
		</div>
		<div class="panel-body" style="display: block; min-height:600px;">
			<form class="form-horizontal" role="form">
			<div style="height:450px; overflow=auto;">
							총 ${pmsCnt } 건
					<table id="example"
						class="table table-striped table-bordered dataTable no-footer"
						cellspacing="0" width="90%" aria-describedby="example_info"
						style="width: 100%; min-width: 300px;">
						<thead>
							<tr role="row">
								<th style="width: 70px; text-align: center;">글번호</th>
								<th style="width: 100px; text-align:  center;">우선순위</th>
								<th style="width: 90px; text-align: center;">상태</th>
								<th style="text-align: center;">제목</th>
								<th style="width: 100px; text-align: center;">담당자</th>
								<th style="width: 90px; text-align: center;">추정시간</th>
								<th style="width: 260px; text-align: center;">진척도</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pmsList}" var="pms" varStatus="loop">
								<tr class="odd work" data-work_no="${pms.work_no }" data-pms_no="${pms.pms_no }" >
									<td>${loop.count +(pageVo.page-1)*10}</td>
									<td>${pms.pri_order_nm}</td>
									<!-- 우선순위 -->
									<td>${pms.sta_cd_nm}</td>
									<!-- 상태 -->
									<td style="text-align: left;">
										<c:forEach begin="1" end="${pms.workLevel}" var="i">
											<c:if test="${i > 1}">
												&ensp; &ensp;
											</c:if>
										</c:forEach> 
											<c:if test="${pms.workLevel > 1}">
				                             ↳
				                             </c:if> 
				                     ${pms.work_nm}
									</td>
									<td>${pms.ko_nm}</td>
									<td>${pms.est_time}</td>
									<td  >
                                    	<div class="progress-bar progress-bar-info" style="width:${pms.prog}%">${pms.prog}%</div>
									</td>
									<!-- 추청시간 -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
			
			
			<div class="row" >
			<div style="text-align: center;">
				<div class="dataTables_paginate paging_simple_numbers"
					id="example_paginate">
					<ul class="pagination">
						<li class="paginate_button previous">
							<a href="${cp }/pms/pmsView?page=1&pageSize=${pageVo.pageSize}&pms_no=${pms_no}">Previous</a></li>
						<c:forEach begin="1" end="${pagination}" var="i">
						<c:choose>
							<c:when test="${pageVo.page==i}">
								<li class="paginate_button active">
									<a href="${cp }/pms/pmsView?page=${pageVo.page }&pageSize=${pageVo.pageSize}&pms_no=${pms_no}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="paginate_button " aria-controls="example" tabindex="0">
								<a href="${cp }/pms/pmsView?page=${i }&pageSize=${pageVo.pageSize}&pms_no=${pms_no}">${i}</a></li>
							</c:otherwise>
						</c:choose>
						
						</c:forEach>
						<li class="paginate_button next" aria-controls="example"
							tabindex="0" id="example_next"><a href="${cp }/pms/pmsView?page=${pagination}&pageSize=${pageVo.pageSize}&pms_no=${pms_no}">Next</a></li>
							
					</ul>
				</div>
			</div>
			<!-- 일정등록 -->
		<form action="/pms/registPmsForm" method="get"  class="tAr pT10">
			<input type="hidden" id="attend_emp_no" name="attend_emp_no" value="${S_USER.emp_no}">
			<input type="hidden" id="pms_no" name="pms_no" value="${pms_no}">
			<input type="submit" id="modifyBtn"  class="btn btn-primary btn-square" value="신규">
		</form>
		
		</div>
		</div>
	</div>
</div>

<div class="col-md-3">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">프로젝트 구성원</h3>
		</div>
		<div class="panel-body" style="display: block; max-height: 600px; min-height: 600px; overflow :auto;">
				<c:forEach items="${empList}" var="emp" varStatus="loop">
					
					<td>
						<!-- 구성원 프로필 이미지 -->
						<img id="pictureViewImg" style="width: 55px; height: 55px; border-radius: 30px; margin-right: 20px; float: left;" src="${cp}/empController/profile?emp_id=${emp.emp_id}" />
					</td>
					<td>
						<!--  구성원 이름 / 직급 / 부서명 -->
						<h4 style="margin-top: 17px;">${emp.ko_nm} / ${emp.cd_ko_nm}  / ${emp.dept_nm} </h4>
					</td>
					<c:if test="${status.count != fn:length(empList)}">
						<br>
					</c:if>
				</c:forEach>

		</div>
	</div>
</div>



<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">간트차트</h3>
		</div>
		<div class="panel-body" style="display: block; height: 600px;">
			<form class="form-horizontal" role="form">
				<div style="min-height: 450px; overflow:auto;">
					<div id="chart_div" style="height:600px; "></div>
				</div>
			</form>
			
			
			
			
			<div class="row">
				<div style="text-align: center;">
					<div class="dataTables_paginate paging_simple_numbers"
						id="example_paginate">
						<ul class="pagination">
							<li class="paginate_button previous"><a
								href="${cp }/pms/pmsView?page=1&pageSize=${pageVo.pageSize}&pms_no=${pms_no}">Previous</a></li>
							<c:forEach begin="1" end="${pagination}" var="i">
								<c:choose>
									<c:when test="${pageVo.page==i}">
										<li class="paginate_button active"><a
											href="${cp }/pms/pmsView?page=${pageVo.page }&pageSize=${pageVo.pageSize}&pms_no=${pms_no}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="paginate_button " aria-controls="example"
											tabindex="0"><a
											href="${cp }/pms/pmsView?page=${i }&pageSize=${pageVo.pageSize}&pms_no=${pms_no}">${i}</a></li>
									</c:otherwise>
								</c:choose>

							</c:forEach>
							<li class="paginate_button next" aria-controls="example"
								tabindex="0" id="example_next"><a
								href="${cp }/pms/pmsView?page=${pagination}&pageSize=${pageVo.pageSize}&pms_no=${pms_no}">Next</a></li>
						</ul>
					</div>
				</div>
			</div>
			
			
			
		</div>
	</div>
</div>





