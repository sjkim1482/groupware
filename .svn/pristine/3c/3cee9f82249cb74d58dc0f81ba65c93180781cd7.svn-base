<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script> 
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>



	<script>
      	$(function(){
      		var fileCnt = 1;
        	$('#summernote').summernote({
        		height: 700
        		
        	});	
        	
        	$("#appLine").on("click", function() {
         		var win = window.open("${cp}/app/empInfoList", "PopupWin", "width=500,height=600");

			})
			
			$("#registApp").on("click", function() {
				var title = $("#title").val();
				if(title == ""){
					alert("제목은 필수입력 사항입니다.");
					return false;
				}
				
				
				$("#appfrm").attr("method","POST");
				$("#appfrm").attr("action","${cp}/app/registReApp");
				$("#appfrm").submit();
			})
			
			$("#deleteApp").on("click", function() {
				
				$("#appfrm").attr("method","POST");
				$("#appfrm").attr("action","${cp}/app/deleteApp");
				$("#appfrm").submit();
			})
			
			$("#tempApp").on("click", function() {
				
				$("#appfrm").attr("method","POST");
				$("#appfrm").attr("action","${cp}/app/tempSaveApp");
				$("#appfrm").submit();
			})
			
			
			$(".deletefile").on("click",function(){
        		var file_no = $(this).data("file_no");
        		var inpo = this;
        		$.ajax({
    				url : "${cp}/app/deleteAppFile",
    				type : "post",
    				data : {"file_no" : file_no},
    				success : function (res) {
    					if(res.cnt==1){
    						$(inpo).parent().remove();
    					}else{
    						alert("삭제오류")
    						return false;
    					}
    				},
    				error : function(xhr) {
    					alert("상태 : " + xhr.status)
    				},
    				dataType : "json"
    			})
        	})
        	
        	$("#cancleApp").on("click", function(){
    			
    			$("#appfrm").attr("method","GET");
    			$("#appfrm").attr("action","${cp}/app/appView");
    			$("#appfrm").submit();
    		});
			
		});
    </script>
		

	
	<form id="appfrm" enctype="multipart/form-data">
		<input type="hidden" name="app_char" value="${appDetail.app_char}">
		<input type="hidden" name="emp_no" value="${S_USER.emp_no}">
		<input type="hidden" name="app_det_no" value="${appDetail.app_det_no}">
		<input type="hidden" name="app_div_no" value="${appDetail.app_div_no}">
		
		
		
		<div style="width: 100%; padding: 10px; background: white;"  >
			<h2 style="text-align: center;">기안서</h2>
			<hr style="border: solid 0.3px black;">
			<br>
			<div style="float: right;">
				<table border="1">
					<tr style="height: 30px;">
						<th rowspan="2" style="height: 90px;width: 80px; text-align: center; background-color: #CECEF6;">결재</th>
						<c:forEach items="${appDetailLine}" var="line">
							<td style="width:  90px; background-color: #CECEF6; text-align: center;"><span id="co_nm1">${line.cd_ko_nm}<input type="hidden" name="appLineList" value="${line.emp_no}"></span></td>
						</c:forEach>
					
						
					</tr>
					<tr style="height: 80px;">
						<c:forEach items="${appDetailLine}" var="line" varStatus="status">
								<c:choose>
								<c:when test="${line.app_step==1}">
									<td style="width:  90px; text-align: center;"><span><img alt="상신" src="${cp}/image/제출.JPG"><br>${line.ko_nm}</span></td>
								</c:when>
								<c:when test="${line.app_cd==301}">
									<td style="width:  90px; text-align: center;"><span><img alt="승인" src="${cp}/image/승인.JPG"> <br>${line.ko_nm}</span></td>
								</c:when>
								<c:when test="${line.app_cd==303}">
									<td style="width:  90px; text-align: center;"><span><img alt="반려" src="${cp}/image/반려.JPG"> <br>${line.ko_nm}</span></td>
								</c:when>
								<c:when test="${line.app_cd==304}">
									<td style="width:  90px; text-align: center;"><span><img alt="전결" src="${cp}/image/전결.JPG"> <br>${line.ko_nm}</span></td>
								</c:when>
								<c:otherwise>
									<td style="width:  90px; text-align: center;"><span>${line.ko_nm}</span></td>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
						
					</tr>
				</table>
				<br>
				
			</div>
		
			
			<br style="clear:both;"><br><br>
			<div>
			<table border="1" style="width: 100%;">
				
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; width: 10%; height: 30px;"  colspan="1"><strong>기안부서</strong></th>
					<td colspan="7">${appDetail.app_char}</td>
				</tr>
				
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; width: 10%; height: 30px;"  colspan="1"><strong>기안부서</strong></th>
					<td colspan="7">${appDetail.dept_nm}</td>
				</tr>
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; height: 30px;" height="20"><strong>기안자</strong></th>
					<td colspan="7">${appDetail.ko_nm}</td>
				</tr>
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; height: 30px;" height="20"><strong>기안날짜</strong></th>
					<td colspan="7"><fmt:formatDate value="${appDetail.reg_dt}" pattern="yyyy-MM-dd"/></td>
				</tr>
				
				<c:if test="${appDetail.app_det_no==2}">
					<tr>
						<th style="text-align: center; height: 30px; background-color: #D8D8D8;" height="20"><strong>기간</strong></th>
						<td colspan="7"><div style="margin-left: 10px">시작일 : <fmt:formatDate value="${appDetail.s_dt}" pattern="yyyy-MM-dd"/>
							/ 종료일 : <fmt:formatDate value="${appDetail.e_dt}" pattern="yyyy-MM-dd"/>
						</div></td>
					</tr>
					
				</c:if>
				
				<c:if test="${appDetail.app_det_no==4}">
					<tr>
						<th style="text-align: center; height: 30px; background-color: #D8D8D8;" height="20"><strong>기간</strong></th>
						<td colspan="7"><div style="margin-left: 10px">시작일 : <fmt:formatDate value="${appDetail.s_dt}" pattern="yyyy-MM-dd"/>
							/ 종료일 : <fmt:formatDate value="${appDetail.e_dt}" pattern="yyyy-MM-dd"/>
						</div></td>
					</tr>
					
					<tr>
						<th style="text-align: center; height: 30px; background-color: #D8D8D8;" height="20"><strong>참여자</strong></th>
						<td colspan="7"><div style="margin-left: 10px">
							<c:forEach items="${psmEmpList}" var="emp">
								[${emp.dept_nm} / ${emp.po_nm} / ${emp.ko_nm}]  
							</c:forEach>
						</div></td>
					</tr>
				</c:if>
				<tr>
					<th style="text-align: center; background-color: #D8D8D8; height: 30px;"><strong>제목</strong></th>
					<td colspan="7"><input id="title" name="title" style="width: 100%; line-height: 25px;" type="text" value="${appDetail.title}">	</td>
				</tr>
				<tr>
					<td colspan="8">
						<textarea id="summernote" name="cont">${appDetail.cont}</textarea>
						<br>
						첨부파일<br>
			            <c:forEach items="${attFileList}" var="file">
			            	<div id="filetag">
				            	<a href="${cp}/file/fileDownload?file_no=${file.file_no}">
									${file.file_nm}
								</a>
                              	<input type="button" class="deletefile" value="삭제" data-file_no="${file.file_no}">
							</div>
			            </c:forEach>	
						<input type="file" name="fileName" multiple="multiple">
					</td>
				</tr>
				
			</table>
			
				
			
			<br>
			</div>
			<div style="float: right;">
				<input class="btn btn-info btn-sm" type="button" id="registApp" value="등록">
				<input class="btn btn-danger btn-sm" type="button" id="deleteApp" value="삭제">
				<input class="btn btn-warning btn-sm" type="button" id="cancleApp" value="취소">
			</div>
			
		</div>
	</form>

