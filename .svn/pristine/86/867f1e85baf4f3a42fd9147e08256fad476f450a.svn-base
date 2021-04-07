<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>

	$(function() {

		//수정
		$("#modifyBtn").on("click", function() {
			$("#frm").attr("method", "post");
			$("#frm").attr("action", "${cp}/popup/modifyPopup");
			$("#frm").submit();
		})
		//삭제
		$("#deleteBtn").on("click", function() {
			$("#frm").attr("method", "post");
			$("#frm").attr("action", "${cp}/popup/deletePopup");
			$("#frm").submit();
		})
	})
</script>
<form id="frm" >
		<input type="hidden" name="popup_no" value="${popup.popup_no}">
</form>

<body>
	
	<br>
	<h3 style="text-align: center;">팝업관리</h3>
	<br>
	<table border="1" style="width: 100%">
		<tr>
			<th colspan="1"
				style="text-align: center; height: 40px; background-color: #D8D8D8;">번호</th>
			<td colspan="4" style="line-height: 25px; text-align: center;">
				${popup.popup_no}</td>
			<th style="text-align: center; background-color: #D8D8D8;">제목</th>
			<td style="text-align: center; line-height: 25px;">
				${popup.title}</td>
			<th colspan="1"
				style="text-align: center; height: 30px; background-color: #D8D8D8;">시작일자</th>
			<td colspan="1" style="height: 100%; text-align: center;">
			<fmt:formatDate value="${popup.s_time}" pattern="yyyy-MM-dd" /></td>
			<th colspan="1"
				style="text-align: center; height: 30px; background-color: #D8D8D8;">종료일자</th>
			<td colspan="1" style="height: 100%; text-align: center;">
			<fmt:formatDate value="${popup.e_time}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
		</tr>
		<tr>
			<th colspan="1"
				style="text-align: center; background-color: #D8D8D8;">내용</th>
			<td align="left" valign="top" colspan="20" style="height: 500px;">
				<div style="margin: 15px;">${popup.cont}</div>
			</td>
		</tr>
		
	</table>
	
	<br><br>
	
	<div id="btn" style="float:right;">
<!-- 	<input type="button" class="btn btn-primary" id="modifyBtn" value="수정"> -->
	<input type="button" class="btn btn-primary" id="deleteBtn" value="삭제">
	</div>

</body>
</html>