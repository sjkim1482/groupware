<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>
	$(function(){
		$("#ackApp").on("click", function(){
			$("#appFrm").attr("method","POST");
			$("#appFrm").attr("action","${cp}/app/ackApp");
			$("#appFrm").submit();
		});
		$("#comApp").on("click", function(){
			
			var turn_rea = $("#comCont").val();
			alert(turn_rea);
			$("#turn_rea").val(turn_rea);
			$("#appFrm").attr("method","POST");
			$("#appFrm").attr("action","${cp}/app/comApp");
			$("#appFrm").submit();
		});
		
		$("#preApp").on("click", function(){
			if(${S_USER.po_cd}>103){
				alert("과장 이상부터 전결 가능합니다.");
				return false;
			}
			
			$("#appFrm").attr("method","POST");
			$("#appFrm").attr("action","${cp}/app/preApp");
			$("#appFrm").submit();
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
	<textarea hidden="hidden" id ="turn_rea" name="turn_rea" ></textarea>
</form>

<div style="width: 100%; padding: 10px; background: white;"  >
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
			<div style="float: right;">
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
			<div>
			<table border="1" style="width: 100%;">
				
				
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
				
			</table>
			<br>
			<div style="float: right;">
				<input class="btn btn-info btn-sm" type="button" id="ackApp" value="승인">
				<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#formModal">
                                            반려
                                        </button>
                                  
                <c:forEach items="${appDetailLine}" var="line" varStatus="status">
					<c:choose>
						<c:when test="${line.app_step<appDetailLine.size()}">
							
						</c:when>
						<c:when test="${line.app_step==appDetailLine.size()&&line.emp_no==S_USER.emp_no}">
							
						</c:when>
						<c:otherwise>
							<input class="btn btn-primary btn-sm" type="button" id="preApp" value="전결">
						</c:otherwise>
					</c:choose>
					
				</c:forEach>
				
				<input class="btn btn-warning btn-sm" type="button" id="cancleApp" value="취소">
			</div>
			첨부파일<br>
            <c:forEach items="${attFileList}" var="file">
            	<a href="${cp}/file/fileDownload?file_no=${file.file_no}">
					${file.file_nm}
				</a><br>
            </c:forEach>
			
			</div>
			<br>
			
	
		</div>
		
		  <div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"> 반려사유입력</h4>
                </div>
                <div class="modal-body">
                        <textarea id="comCont" name="turn_rea" rows="20" cols="75"></textarea>
                        
                </div>
                <div class="modal-footer">
                    <button type="button" id="comApp" class="btn btn-primary">등록</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
		
		