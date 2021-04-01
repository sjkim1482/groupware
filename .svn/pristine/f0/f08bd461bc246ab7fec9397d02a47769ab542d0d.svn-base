<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset='utf-8' />
<link href='../fullcalendar/main.css' rel='stylesheet' />
<script src='../fullcalendar/main.js'></script>
<script src='../fullcalendar/locales-all.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>

<script>


$(document).ready(function() {
    $('[data-toggle="popover"]').popover({container: "body"});
});

$(function () {
	$('[data-toggle="tooltip"]').tooltip()
})


$(function(){
	$("#scd_div_no").val("${scd_div_no}");
	
	
})

document.addEventListener('DOMContentLoaded', function() {
	 
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
    	locale: 'ko',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: '${start}',
      
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      //등록form으로 이동
      select: function(arg) {
    	
        	$("#s_dt").val(arg.start);
        	$("#e_dt").val(arg.end);
        	$("#frm").submit();
        calendar.unselect()
      },
      
      //tooltip
      eventDidMount: function(info) {
    	  $(info.el).tooltip({
              title: info.event.title
              
          });
      },
     //상세정보 
    eventClick: function(arg) {
    $("#scd_no").val(arg.event._def.groupId);
//     alert(arg.event._def.groupId);
    window.open("${cp}/scd/calendarView?scd_no="+arg.event._def.groupId, "PopupWin", "width=1000,height=900");
//     $("#frmView").submit();
    },
	 
    editable: true,
         dayMaxEvents: true, // allow "more" link when too many events
      //일정전체출력
      events: [
	    	  <c:forEach items="${scdList}" var="scd" varStatus="status">
	    		{
	    		groupId : '${scd.scd_no}',
	    		title: '${scd.title}',
	    		<c:choose>
	    		<c:when test="${scd.scd_div_no == 1}">
	    		   backgroundColor: '#938997',
	    		  </c:when>
	    		<c:when test="${scd.scd_div_no == 2}">
	    		   backgroundColor: '#538997',
	    		  </c:when>
	    		<c:otherwise>
	    		   backgroundColor: '#C165EA',
	    		</c:otherwise>
	    		</c:choose>
	    		start: '<fmt:formatDate value="${scd.s_dt}" pattern="yyyy-MM-dd"/>',
	    		end: '<fmt:formatDate value="${scd.e_dt}" pattern="yyyy-MM-dd"/>'
	    		}
		    		<c:if test="${status.count != fn:length(scdList)}">
		    			,
		    		</c:if>
	    		</c:forEach>
     ],
//       eventColor: '#378006'
			
    });
    //일정유형변경
    $("#scd_div_no").on("change",function(){
		var scd_div_no = $("#scd_div_no").val();
		if(scd_div_no == ""){
			location.href ="${cp}/scd/calendar?emp_no=${S_USER.emp_no}";
			return false;
		}else{
			$("#scd_div_no2").val(scd_div_no);
			console.log(scd_div_no);
	    	$("#frmDiv").submit();
	    	return true;
		}
    })

    calendar.render();
    
    
    $("#searchBtn").on("click",function(){
		var type = $("#searchType").val();
		console.log(type);
		var pageSize = $("#perPageNum").val();
		console.log(pageSize);
		var keywords = $("#keywords").val();
		console.log(keywords);
		var emp_no = $("#emp_no").val();
		console.log(emp_no);
		location.href="${cp}/scd/searchCalendar?type="+type+"&page=1&pageSize="+pageSize+"&keywords="+keywords+"&emp_no="+emp_no;
	})
	

  });
  

</script>
<style>
.popper,
.tooltip {
/*   position: absolute; */
/*     z-index: 9999; */
/*     background: #FFC107; */
/*     color: black; */
 width: 150px; 
/*     border-radius: 3px; */
/*     box-shadow: 0 0 2px rgba(0,0,0,0.5); */
/*     padding: 10px; */
    text-align: right;
  }
body {
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
	height: 800px;
}
.fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */

#example_wrapper{
	float: right;
/* 	margin-right: 16%;  */
	min-width: 48%;
}
</style>
</head>
<body>
		<!-- 일정등록 -->
		<form action="/scd/registCalendarForm" method="post" id="frm">
			<input type="hidden" id="s_dt" name="s_dt">
			<input type="hidden" id="e_dt" name="e_dt">
			<input type="hidden" id="emp_no" name="emp_no" value="${S_USER.emp_no}">
		</form>
		
		<!-- 일정상세정보 조회 -->
		<form action="/scd/calendarView" method="get" id="frmView">
			<input type="hidden" id="scd_no" name="scd_no">
		</form>
		
		<!-- 팝업창에서 삭제 후 조회 -->
		<form action="/scd/calendar2" method="get" id="frmView">
			<input type="hidden" id="emp_no" name="emp_no" value="${S_USER.emp_no}">
		</form>
		
		<!-- 일정타입별 조회 -->
		<form action="/scd/calendarDiv" method="get" id="frmDiv">
			<input type="hidden" id="emp_no" name="emp_no" value="${S_USER.emp_no}">
			<input type="hidden" id="dept_no" name="dept_no" value="${S_USER.dept_no}">
			<input type="hidden" id="scd_div_no2" name="scd_div_no" >
		</form>
		
		
		
		<!-- 일정 검색 -->
		<div role="grid" id="example_wrapper"
			class="dataTables_wrapper form-inline no-footer">
			<div class="" id="keyword">
				<select  name="scd_div_no" id="scd_div_no"  aria-controls="example" class="form-control input-sm"> 
						<option value="" selected="selected">전체</option>
						<c:forEach items="${scdDivList}" var="scd_div" varStatus="loop">
							<option value="${scd_div.scd_div_no}">${scd_div.scd_div_nm }</option>
						</c:forEach>
				</select>
				<!-- sort num -->
				<select aria-controls="example" class="form-control input-sm"
					name="perPageNum" id="perPageNum">
					<option value="">정렬개수</option>
					<option value="3">3개씩</option>
					<option value="5">5개씩</option>
					<option value="7">7개씩</option>
				</select>
				<!-- search bar -->
				<select aria-controls="example" class="form-control input-sm"
					name="searchType" id="searchType">
					<option value="">검색구분</option>
					<option value="u">작성자</option>
					<option value="t">제목</option>
					<option value="s">상태코드</option>
					<option value="d">일정타입</option>
				</select> <input class="form-control" type="text" name="keyword"
					id="keywords" placeholder="검색어를 입력하세요." value=""> <span
					class="input-group-append">
					<button class="btn btn-primary" type="button" id="searchBtn"
						data-card-widget="search" data-emp_no="${S_USER.emp_no}">
						<i class="fa fa-fw fa-search"></i>
					</button>
					
				</span>
				<!-- end : search bar -->
			</div>
		</div>
		<!-- 일정타입 분류 -->
	
	<div class="row">
			<div class="col-xs-6">
			</div>
			<div class="panel-body">
			
		</div>
		<div class="panel panel-default" style="padding-top: 20px; margin-left:15%; margin-right: 15%;padding-bottom: 20px;">
		<div id='calendar'></div>
		</div>
		</div>
		 
		
</body>
</html>
