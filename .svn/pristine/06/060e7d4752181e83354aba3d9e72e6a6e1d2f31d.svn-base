<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<head>
<meta charset="UTF-8">
<title>팝업관리</title>
</head>

<script>
$(function () {
	
// 팝업상세보기
	$(".popupDetail").on("click", function() {
		var popup_no = $(this).data("popup_no");
		
		
		$("#popup_no").val(popup_no);
		
		$("#frm").attr("method","get");
 		$("#frm").attr("action","${cp}/popup/popupDetail");
 		$("#frm").submit();
		
		
	})


})
</script>

<body>
<form id="frm" action="${cp}/popup/popupDetail">
	<input type="hidden" id="popup_no" name="popup_no" >
</form>

<h3 style="text-align: center">팝업 관리</h3>
<br><br>	
	<!-- 팝업리스트 -->
<%-- <input type="hidden" name="popup_no" id="popup_no" value="${popup.popup_no}"> --%>

	<%-- <input type="submit" onclick="location.href='${cp}/popup/insertPopUp'" class="btn btn-info" id="popupBtn" value="팝업 등록" > --%>
	<br><br>
	
	<table id="example" class="table table-striped table-bordered dataTable no-footer" 
	 cellspacing="0" width="100%" aria-describedby="example_info" style="width: 100%;">
			<thead>
				<tr role="row">
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">시작일자</th>
					<th style="text-align: center;">종료일자</th>
				</tr>
			</thead>
			<tbody>
		
			<c:forEach items="${popupList}" var="popup">
					<tr class="odd popupDetail"  data-popup_no="${popup.popup_no}" >
						<td style="text-align: center;">${popup.popup_no}</td>
						<td style="text-align: center;">${popup.title}</td>
						<td style="text-align: center;"><fmt:formatDate value="${popup.s_time}" pattern="yyyy-MM-dd"/></td>
						<td style="text-align: center;"><fmt:formatDate value="${popup.e_time}" pattern="yyyy-MM-dd"/></td>
					</tr>
			
			</c:forEach>
			</tbody>
		</table>
	
</body>
