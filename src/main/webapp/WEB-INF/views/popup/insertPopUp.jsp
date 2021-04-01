<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/common/common_lib.jsp"%>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>

<!-- 써머노트 적용 - 주소 불러오기 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script>
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"
	defer></script>

<!-- 써머노트 스크립트 선언 -->

<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
			height: 500
    	})
    	$('#saveBtn').on('click', function () {
    		
    		var s_time = $('#s_time').val();
    		var e_time = $('#e_time').val();
    		var title = $('#title').val();
    		var cont = $('#summernote').val();
    	
    		
    		$.ajax({
    			url: "${cp}/popup/insertPopUp",
    			data: "s_time="+s_time+"&e_time="+e_time+
    					"&title="+title+"&cont="+ cont,
				type: "post",
    			success : function (data) {
					if(data.cnt==1){
						alert("등록되었습니다.")
						 self.close();
					}else{
						alert("등록에 실패했습니다.")
						return false;
					}
				}
    		})
		})
		
	})
	
</script>

</head>
<body>
<br>
<h3 style="text-align: center;">팝업 등록</h3>
<br>
<%-- <form action="${cp}/popup/insertPopUp" id="popUpfrm" method="post"> --%>
<input type="hidden" name="popup_no" id="popup_no">
	<table border="1" style="width: 100%">
		
		<tr>
			<th style="text-align: center; background-color: #D8D8D8;">제목</th>
			<td style="text-align: center; line-height: 25px;">
				<input style=" height: 100%;" type="text" class="form-control" name="title" id="title" ></td>
			<th colspan="1"
				style="text-align: center; height: 30px; background-color: #D8D8D8;">시작일자</th>
			<td colspan="1" style="height: 100%; text-align: center;">
			<input style="width: 100%;" type="date" name="s_time" id="s_time" value="시작날짜">
			</td>
			<th colspan="1"
				style="text-align: center; height: 30px; background-color: #D8D8D8;">종료일자</th>
			<td colspan="1" style="height: 100%; text-align: center;">
			<input style="width: 100%;" type="date" name="e_time" id="e_time"  value="종료날짜"></td>
		</tr>
		<tr>
		</tr>
		<tr>
			<th colspan="1"
				style="text-align: center; background-color: #D8D8D8;">내용</th>
			<td align="left" valign="top" colspan="20" style="height: 500px;">
				<textarea  id="summernote" name="cont">
				</textarea>
			</td>
		</tr>
		
	</table>

	<br><br>
<button type="button" id="saveBtn" class="btn btn-primary" value="저장" style="float: right;">저장</button>
<!-- </form>	 -->

	
 	
 
</body>
</html>