<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<form id="viewFrm">
	<input type="hidden" name="msg_no" value="${msg.msg_no}">
	<input type="hidden" name="emp_no" value="${S_USER.emp_no}">
</form>
<section class="panel">
	<header class="panel-heading wht-bg"> 
		<h2>${msg.title}</h2>
	</header>
	<div class="panel-body minimal" style="width: 100%">



		<input type="button" value="쪽지함으로 이동"  data-toggle="modal" data-target="#formModalMsgBox">
		<table border="1" style="width: 100%;">



			<tr>
				<th
					style="text-align: center; width: 10%; height: 50px; background-color: #D8D8D8;"
					colspan="1"><strong>발신부서</strong></th>
				<td colspan="7"><div style="margin-left: 10px">${msg.dept_nm}</div></td>
			</tr>
			<tr>
				<th
					style="text-align: center; width: 10%; height: 50px; background-color: #D8D8D8;"
					colspan="1"><strong>발신자</strong></th>
				<td colspan="7">
					<div style="margin-left: 10px"><img id="pictureViewImg"
					style="width: 50px; height: 50px;"
					src="${cp }/empController/profile?emp_id=${msg.emp_id}" /> ${msg.ko_nm} ${msg.cd_ko_nm}</div></td>
			</tr>
			<tr>
				<th
					style="text-align: center; height: 50px; background-color: #D8D8D8;"
					height="20"><strong>발신날짜</strong></th>
				<td colspan="7"><div style="margin-left: 10px">
						<fmt:formatDate value="${msg.reg_dt}" pattern="yyyy-MM-dd" />
					</div></td>
			</tr>

<!-- 			<tr> -->
<!-- 				<th -->
<!-- 					style="text-align: center; height: 50px; background-color: #D8D8D8;"><strong>제목</strong></th> -->
<%-- 				<td colspan="7"><div style="margin-left: 10px">${msg.title}</div></td> --%>
<!-- 			</tr> -->
			<tr>
				<th
					style="text-align: center; height: 700px; background-color: #D8D8D8;"><strong>내용</strong></th>
				<td colspan="7" align="left" valign="top"><div
						style="margin: 10px;">${msg.cont}</div></td>

			</tr>



		</table>
		첨부파일<br>
		<c:forEach items="${attFileList}" var="file">
			<a href="${cp}/file/fileDownload?file_no=${file.file_no}">
				${file.file_nm} </a>
			<br>
		</c:forEach>
		
		<div style="float: right;">
			<input type="button" id="deleteMsg" value="휴지통으로 이동">
		</div>


	</div>
</section>


 <div class="modal fade" id="formModalMsgBox" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"> 쪽지함이동</h4>
                </div>
                <div class="modal-body">
                	<select id="selectMsgBox">
                		<option value="">선택</option>
                		<c:forEach items="${msgBoxList}" var="msgBox">
                			<option value="${msgBox.msg_box_no}">${msgBox.msg_box_nm}</option>
                		</c:forEach>
                	</select>                       
                </div>
                <div class="modal-footer">
                    <button type="button" id="comMoveMsgBox" class="btn btn-primary">등록</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
<form id="moveMsgBoxFrm">
	<input type="hidden" name="msg_no" value="${msg.msg_no}">
	<input type="hidden" id="msg_box_no" name="msg_box_no" >
	<input type="hidden" name="emp_no" value="${S_USER.emp_no}">
</form>
<script>
	$("#deleteMsg").on("click", function() {
		
		$("#viewFrm").attr("method","POST");
		$("#viewFrm").attr("action","${cp}/msg/deleteMsg");
		$("#viewFrm").submit();
	})
	$("#comMoveMsgBox").on("click", function() {

		var msg_box_no = $("#selectMsgBox").val(); 
		if(msg_box_no == ""){
			alert("쪽지함을 지정해주세요");
			return false;
		}
			
		$("#msg_box_no").val(msg_box_no); 
		$("#moveMsgBoxFrm").attr("method","POST");
		$("#moveMsgBoxFrm").attr("action","${cp}/msg/moveMsgBox");
		$("#moveMsgBoxFrm").submit();
	})
</script>
