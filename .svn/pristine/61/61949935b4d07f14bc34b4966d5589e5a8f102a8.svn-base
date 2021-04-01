<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
 $(function(){
	$("#empMsgList").on("click", function() {
		var win = window.open("${cp}/meeting/empInfoMsgList", "PopupWin", "width=1600,height=900");
	})	 
	 
	$(".joinMeeting").on("click", function() {
		var win = window.open("https://192.168.0.121:44300/room/asas", "PopupWin", "width=1600,height=900");
// 		location.href = "https://192.168.0.122:44300/room/asas";
	})
	$(".closeMeeting").on("click", function() {
		var meet_no = $(this).data("meet_no");
		$("#meet_no").val(meet_no);
		
		$("#closeMeetingFrm").submit();
		
	})
 })
</script>

<form id="closeMeetingFrm" method="POST" action="${cp}/meeting/closeMeeting">
	<input type="hidden" name="emp_no" value="${S_USER.emp_no}">
	<input type="hidden" id="meet_no" name="meet_no">
</form>

<input type="button" class="btn btn-info" id="empMsgList" value="화상회의 생성">
<br>
<br>
<div class="col-md-6">
                           <div class="panel panel-default">
                          <div class="panel-heading">
                            <h3 class="panel-title">Hover rows</h3>
                            <div class="actions pull-right">
                                <i class="fa fa-chevron-down"></i>
                                <i class="fa fa-times"></i>
                            </div>
                          </div>
                          <div class="panel-body">
                        <table class="table table-hover">
                          <thead>
                            <tr>
                              <th>번호</th>
                              <th>제목</th>
                              <th>생성자</th>
                              <th>비고</th>
                            </tr>
                          </thead>
                          <tbody>
                          <c:forEach items="${meetingList}" var="meeting" varStatus="status">
                            <tr>
                              <td>${status.count}</td>
                              <td>${meeting.meet_nm}</td>
                              <td>${meeting.ko_nm} ${meeting.cd_ko_nm}</td>
                              <td>	
                              <input type="button" class="joinMeeting" value="입장">
                              <c:if test="${meeting.emp_no == S_USER.emp_no}">
                              	<input type="button" class="closeMeeting" data-meet_no="${meeting.meet_no}" value="종료">
                              </c:if>
                              </td>
                            </tr>
                          </c:forEach>
                          </tbody>
                        </table>
                          </div>
                        </div>
                    </div>