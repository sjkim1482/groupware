<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<div>

	<h2 style="text-align: center;">쪽지 재작성</h2>
	<hr>
	<br>
	<form  id = "msgSentFrm" enctype="multipart/form-data">
	<input type="hidden" name="msg_no" value="${msg.msg_no}">
	<input type="hidden" name="sd_emp_no" value="${S_USER.emp_no}">
	<input style="float: right;" type="button" id="empMsgList" value="수신자 지정">
	<br>
			<table border="1" style="width: 100%;">
				
				
				
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; height: 30px;"><strong>받는이</strong></th>
					<td colspan="7" id="empMsgInfoList" style="background-color: white;">	</td>
				</tr>
				
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; height: 30px;"><strong>제목</strong></th>
					<td colspan="7"><input id="title" name="title" style="width: 100%; line-height: 25px;" type="text" value="${msg.title}">	</td>
				</tr>
				<tr>
					<td colspan="8">
						<textarea id="summernote" name="cont">${msg.cont}</textarea>
						<br>
						
						<input type="file" name="fileName" multiple="multiple">
					</td>
				</tr>
				
			</table>
			<br>
	</form>
				
			
			<div style="float: right;">
				<input type="button" id="registTempMsg" value="보내기">
				<input type="button" id="tempTempMsg" value="임시저장">
				<input type="button" id="deleteTempMsg" value="삭제">
				<input type="button" id="cancleMsg" value="취소">
			</div>
			</div>
			<br>
			<br>
<script>
      
        	$('#summernote').summernote({
        		height: 700
        		
        	});	
        	
        	$("#empMsgList").on("click", function() {
         		var win = window.open("${cp}/msg/empInfoMsgList", "PopupWin", "width=900,height=500");

			})
			
			$("#registTempMsg").on("click", function() {
				var title = $("#title").val();
				if(title == ""){
					alert("제목은 필수입력 사항입니다.");
					return false;
				}
				var empSentList = $("#empMsgInfoList").text();
				
				if(empSentList == "	"){
					alert("수신자를 지정하세요");
					return false;
				}
				
				$("#msgSentFrm").attr("method","POST");
				$("#msgSentFrm").attr("action","${cp}/msg/registTempMsg");
				$("#msgSentFrm").submit();
			})
			
			$("#deleteTempMsg").on("click", function() {
			
				$("#msgSentFrm").attr("method","POST");
				$("#msgSentFrm").attr("action","${cp}/msg/deleteTempMsg");
				$("#msgSentFrm").submit();
			})
		
			$("#tempTempMsg").on("click", function() {
			
				$("#msgSentFrm").attr("method","POST");
				$("#msgSentFrm").attr("action","${cp}/msg/tempTempMsg");
				$("#msgSentFrm").submit();
			})
    </script>