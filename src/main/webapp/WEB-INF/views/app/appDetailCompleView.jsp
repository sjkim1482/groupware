<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="${cp}/js/html2canvas.js"></script>
<script src="${cp}/js/jspdf.min.js"></script>

<script>
	$(function(){
		$("#comApp").on("click", function(){
			$("#appFrm").attr("method","POST");
			$("#appFrm").attr("action","${cp}/app/comApp");
			$("#appFrm").submit();
		});
		$("#AppRewrite").on("click", function(){
			$("#appFrm").attr("method","GET");
			$("#appFrm").attr("action","${cp}/app/appRewrite");
			$("#appFrm").submit();
		});
		$("#preApp").on("click", function(){
			$("#appFrm").attr("method","POST");
			$("#appFrm").attr("action","${cp}/app/preApp");
			$("#appFrm").submit();
		});
		
		$('#AppDown').click(function() { // pdf저장 button id
			
// 		    html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id
			
// 		    // 캔버스를 이미지로 변환
// 		    var imgData = canvas.toDataURL('image/png');
			     
// 		    var imgWidth = 210; // 이미지 가로 길이(mm) / A4 기준 210mm
// 		    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
// 		    var imgHeight = canvas.height * imgWidth / canvas.width;
// 		    var heightLeft = imgHeight;
// 		    var margin = 10; // 출력 페이지 여백설정
// 		    var doc = new jsPDF('p', 'mm');
// 		    var position = 0;
		       
// 		    // 첫 페이지 출력
// 		    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
// 		    heightLeft -= pageHeight;
		         
// 		    // 한 페이지 이상일 경우 루프 돌면서 출력
// 		    while (heightLeft >= 20) {
// 		        position = heightLeft - imgHeight;
// 		        doc.addPage();
// 		        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
// 		        heightLeft -= pageHeight;
// 		    }
		 
// 		    // 파일 저장
// 		    doc.save('file-name.pdf');

			  
// 		});
		
			$("#pdfDownload").submit();

		});
		
		$("#cancleApp").on("click", function(){
			
			$("#appFrm").attr("method","GET");
			$("#appFrm").attr("action","${cp}/app/appView");
			$("#appFrm").submit();
		});
	})
</script>

<form id="appFrm">
	<input type="hidden" id="emp_no" name="emp_no" value="${S_USER.emp_no}">
	<input type="hidden" id="app_char" name="app_char" value="${appDetail.app_char}">
</form>
<form id="pdfDownload" style="float:right; margin-left: 4px;" action="${cp}/pdf/pdfDownload">
	<input type="hidden" id="emp_no" name="emp_no" value="${S_USER.emp_no}">
	<input type="hidden" id="app_char" name="app_char" value="${appDetail.app_char}">
	<c:choose>
		<c:when test="${appDetail.app_det_no == 1}">
			<input type="hidden" name="app_type" value="기안서">
		</c:when>
		<c:when test="${appDetail.app_det_no == 2}">
			<input type="hidden" name="app_type" value="연차휴가계">
		</c:when>
		<c:when test="${appDetail.app_det_no == 3}">
			<input type="hidden" name="app_type" value="반차휴가계">
		</c:when>
		<c:when test="${appDetail.app_det_no == 4}">
			<input type="hidden" name="app_type" value="프로젝트기안서">
		</c:when>
	</c:choose>
</form>



<div id="pdfDiv" style="width: 100%; padding: 10px; background-color: white; z-index: -2"  >
<!-- 			<div> -->
<%-- 			<img alt="승인마크" style="position: absolute; z-index: 0" src="${cp}/image/승인마크.png"> --%>
<!-- 			</div> -->
			<div style="z-index: 1">
			<h2 style="text-align: center;">
			<c:choose>
				<c:when test="${appDetail.app_det_no == 1}">
					기안서
				</c:when>
				<c:when test="${appDetail.app_det_no == 2}">
					연차휴가계
				</c:when>
				<c:when test="${appDetail.app_det_no == 3}">
					반차휴가계
				</c:when>
				<c:when test="${appDetail.app_det_no == 4}">
					프로젝트기안서
				</c:when>
			</c:choose>
			</h2>
			<hr style="border: solid 0.3px black;">
			<br>
			
				
			<div style="float: right; ">
				<table border="1">
					<tr style="height: 30px;">
						<th rowspan="2" style="height: 90px;width: 80px; text-align: center; background-color: #CECEF6;">결재</th>
						<c:forEach items="${appDetailLine}" var="line">
							<td style="width:  90px; background-color: #CECEF6; text-align: center;"><span id="co_nm1">${line.cd_ko_nm}</span></td>
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
			<div >
			<table  border="1" style="width: 100%;">
				
				
				<tr>
					<th style="text-align: center; width: 10%; height: 30px; background-color: #D8D8D8;"  colspan="1"><strong>문서번호</strong></th>
					<td colspan="7"><div style="margin-left: 10px">${appDetail.app_char}</div></td>
				</tr>
				<tr>
					<th style="text-align: center; width: 10%; height: 30px; background-color: #D8D8D8;"  colspan="1"><strong>기안부서</strong></th>
					<td colspan="7"><div style="margin-left: 10px">${appDetail.dept_nm}</div></td>
				</tr>
				<tr>
					<th style="text-align: center; height: 30px; background-color: #D8D8D8;" height="20"><strong>기안자</strong></th>
					<td colspan="7"><div style="margin-left: 10px">${appDetail.ko_nm}</div></td>
				</tr>
				<tr>
					<th style="text-align: center; height: 30px; background-color: #D8D8D8;" height="20"><strong>기안날짜</strong></th>
					<td colspan="7"><div style="margin-left: 10px"><fmt:formatDate value="${appDetail.reg_dt}" pattern="yyyy-MM-dd"/></div></td>
				</tr>
				
				<c:if test="${appDetail.app_det_no==2}">
					<tr>
						<th style="text-align: center; height: 30px; background-color: #D8D8D8;" height="20"><strong>기간</strong></th>
						<td colspan="7"><div style="margin-left: 10px">시작일 : <fmt:formatDate value="${appDetail.s_dt}" pattern="yyyy-MM-dd"/>
							/ 종료일 : <fmt:formatDate value="${appDetail.e_dt}" pattern="yyyy-MM-dd"/>
						</div></td>
					</tr>
					
				</c:if>
				
				<c:if test="${appDetail.app_det_no==3}">
					<tr>
						<th style="text-align: center; height: 30px; background-color: #D8D8D8;" height="20"><strong>기간</strong></th>
						<td colspan="7"><div style="margin-left: 10px">시작일 : <fmt:formatDate value="${appDetail.s_dt}" pattern="yyyy-MM-dd"/>
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
					<th style="text-align: center; height: 30px; background-color: #D8D8D8;"><strong>제목</strong></th>
					<td colspan="7"><div style="margin-left: 10px">${appDetail.title}</div></td>
				</tr>
				<tr>
					<th style="text-align: center; height: 700px; background-color: #D8D8D8;"><strong>내용</strong></th>
					<td colspan="7" align="left" valign="top"><div style="margin: 10px;">${appDetail.cont}</div></td>
					
				</tr>
				
			
				<c:if test="${turnReaCheck==1}">
					<tr>
						<th style="text-align: center; background-color: #D8D8D8;"><strong>반려사유</strong></th>
						<td colspan="7" align="left" valign="top"><div style="margin: 10px;">${appDetail.turn_rea}</div></td>	
					</tr>
				</c:if>
				
			</table>
		
			첨부파일<br>
            <c:forEach items="${attFileList}" var="file">
            	<a href="${cp}/file/fileDownload?file_no=${file.file_no}">
					${file.file_nm}
				</a><br>
            </c:forEach>			
				
			<div style="float: right;">
<%-- 				<form style="float:right; margin-left: 4px;" action="${cp}/pdf/pdfDownload"> --%>
<!-- 					pdf다운 -->
<!-- 					<input type="submit" id="pdfDownloadBtn" class="btn btn-default" value="pdf 다운로드"> -->
<!-- 				</form> -->
				<c:if test="${appDetail.app_sta_cd!=303}">
					<input class="btn btn-info btn-sm" type="button" id="AppDown" value="문서출력">
				</c:if>
				<c:if test="${appDetail.app_sta_cd==303}">
					<input class="btn btn-primary btn-sm" type="button" id="AppRewrite" value="문서 재작성">
				</c:if>
				<input class="btn btn-warning btn-sm" type="button" id="cancleApp" value="돌아가기">
			</div>
			<br><br>
			</div>
			
		</div>
	</div>
		