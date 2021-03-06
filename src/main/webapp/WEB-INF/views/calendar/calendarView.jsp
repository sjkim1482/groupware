<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="shortcut icon" href="${cp}/assets/img/favicon.ico" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${cp}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Font Icons -->
    <link rel="stylesheet" href="${cp}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${cp}/assets/css/simple-line-icons.css">
    <!-- CSS Animate -->
    <link rel="stylesheet" href="${cp}/assets/css/animate.css">
    <!-- Switchery -->
    <link rel="stylesheet" href="${cp}/assets/plugins/switchery/switchery.min.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="${cp}/assets/css/main.css">
    <!-- Vector Map  -->
    <link rel="stylesheet" href="${cp}/assets/plugins/jvectormap/css/jquery-jvectormap-1.2.2.css">
    <!-- ToDos  -->
    <link rel="stylesheet" href="${cp}/assets/plugins/todo/css/todos.css">
    <!-- Morris  -->
    <link rel="stylesheet" href="${cp}/assets/plugins/morris/css/morris.css">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    <!-- Feature detection -->
    <script src="${cp}/assets/js/modernizr-2.6.2.min.js"></script>
	
<script type="text/javascript">
	// 문서로딩이 완료되고 나서 실행되는 영역
	$(function(){
		$("#modifyBtn").on("click",function(){
			$("#frm").attr("method","post");
			$("#frm").attr("action","${cp}/scd/modifyCalendarForm");
			$("#frm").submit();
		});	
		$("#deleteBtn").on("click",function(){
			var flag = confirm("해당 일정을 삭제하겠습니까?");
			if (flag) {
				var emp_no = $(this).data("emp_no");
				var scd_no = $("#scd_no").val();
				$.ajax({
					url : "/scd/deleteCalendarAjax",
					type : "POST",
					data : {
						"scd_no" : scd_no,
						"emp_no" : emp_no
					},
					success : function(data) {
						if(data.deleteCnt = 1){
							opener.parent.location.reload();
							window.self.close();
						}
					}	
				});
			}else{
				return ;
			}
		});
		function reload(){
		    window.opener.location.reload();
		    window.close();
		}
	})
</script>
<style>
.titW1{
	height : 50px;
	text-align: center;
}
.titW2{
	height : 50px;
	text-align: center;
}
.tAr{
 	text-align: right; 
 	padding-right: 10%; 
	
}
</style>
<meta charset='utf-8' />
<form  id="frm" class="form-horizontal form-border">
	<input type="hidden" name="s_dt" value="${scdVo.s_dt}"/>
	<input type="hidden" name="e_dt" value="${scdVo.e_dt}"/>
	<input type="hidden" name="plc" value="${scdVo.plc}"/>
	<input type="hidden" name="title" value="${scdVo.title}"/>
	<input type="hidden" name="cont" value='${scdVo.cont}'>
	<input type="hidden" name="scd_no"  id="scd_no"value="${scdVo.scd_no}"/>
	<input type="hidden" name="emp_no" value="${S_USER.emp_no}"/>
</form>

<div class="col-md-12"  style=" height:280px;">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">일정 상세정보 조회</h3>
		</div>
		<div class="panel-body" style="display: block;min-width: 100px; min-height:700px;">
			<div class="tablWrap" style="padding-left:100px;padding-top:30px;" >
			
			<div class="tablWrap" >
					<table width="90%"  border="3" cellspacing="0" cellpadding="0" class="data1 data3 tLf">
						<colgroup>
						<col width="130px;">
						<col >
			      		<col width="130px;">
			      		<col>
						</colgroup>
						<tbody>
						<tr>
							<th class="titW1">일자<!-- 일자 --></th>
							<td  class="titW2">
			                	<span id="sdate">
			                			<fmt:formatDate value="${scdVo.s_dt}" pattern="yyyy-MM-dd"/>
			                	</span>
			                	~
			                	<span id="edate">
			                			<fmt:formatDate value="${scdVo.e_dt}" pattern="yyyy-MM-dd"/>
			                	</span>
			                	<input id="isAllDay" checked="" type="checkbox" class="pL20" disabled="disabled"> 종일<!-- 종일 -->
			                	<input id="isLunar" type="checkbox" class="pL20" disabled="disabled"> 음력<!-- 음력 -->
			                </td>
			                <th class="titW1">작성자<!-- 작성자 --></th>
			                <td class="titW2">
						  		<span >
								  	${scdVo.ko_nm}
							  	</span>
						  	</td>
						</tr>
						<tr>
							<th class="titW1">제목<!-- 제목 --></th>
							<td colspan="3" ><span id="title">${scdVo.title}</span></td>
						</tr>
			            <tr>
							<th class="titW1">일정타입<!-- 일정타입 --></th>
						  	<td class="titW2">
						  				<span style="background-color:#72a881;color:#ffffff;">
							  					${scdVo.cd_ko_nm}
						  				</span>
						  	</td>
						  	<th class="titW1">장소<!-- 장소 --></th>
						  	<td class="titW2">
						  		<span >
								  	${scdVo.plc}
							  	</span>
						  	</td>
						</tr>
			            
			            <tr>
							<th class="titW1">부서</th>
			                <td colspan="3" class="titW2"><span id="repeatStr">${scdVo.dept_nm}</span></td>
					  	</tr>
			            <tr>
							<th class="titW1">캘린더<!-- 캘린더 --></th>
			                <td colspan="3" class="titW2">
			               		<span id="calendarName" style="color:white; background-color:#72A881;">${scdVo.scd_div_nm} 일정</span>
			                </td>
					  	</tr>
						<tr>
							<th class="titW1">공유<!-- 공유 --></th>
							<td colspan="3" class="titW2">
											공유자가 없습니다.<!-- 공유자 없음 -->
			                </td>
						</tr>
						<tr>
							<th class="titW1">내용<!-- 내용 --></th>
							<td colspan="3" >
			<%-- 					<input class="textarea1" name="memo" value="${scdVo.cont}"> --%>
								<span id="location">
								  	${scdVo.cont}
							  	</span> 
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<hr>
				<div class="tAr pT10">
					<input type="hidden" id="emp_no" name="emp_no" value="${S_USER.emp_no }">
					<input type="button" id="modifyBtn"  class="btn btn-primary btn-square" value="수정">
					<input type="button" id="deleteBtn" data-emp_no="${S_USER.emp_no }" class="btn btn-primary btn-square" value="삭제">
					<input type="button"  onClick="reload()" class="btn btn-primary btn-square" value="닫기">
				</div>
			</div>
		</div>
	</div>
</div>


