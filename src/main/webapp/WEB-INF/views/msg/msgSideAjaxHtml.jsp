<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<aside  class="panel-body">

                           
<input type="button" id="sentMsg" class="btn btn-primary" value="쪽지 작성">
<ul class="nav nav-pills nav-stacked compose-nav">
    <li>
        <a href="javascript:pagingRecMsgAjaxHtml(1, 10);"> <i class="fa fa-inbox"></i> 받은 쪽지함
            <span class="label label-danger pull-right inbox-notification">${noReadMsgCnt}</span>
        </a>
    </li>
   
    <li>
        <a href="javascript:pagingSentMsgAjaxHtml(1, 10);"> <i class="fa fa-envelope-o"></i> 보낸 쪽지함</a>
    </li>
    <li>
        <a href="javascript:pagingTempMsgAjaxHtml(1, 10);"> <i class="fa fa-pencil-square-o"></i> 임시 저장함 <span class="label label-info pull-right inbox-notification">${tempMsgCnt}</span>
        </a>
    </li>
    <li>
        <a href="javascript:pagingDeleteMsgAjaxHtml(1, 10);"> <i class="fa fa-trash-o"></i> 휴지통</a>
    </li>
</ul>

 </aside>
<aside  class="panel-body">
<input type="button" class="btn btn-primary" value="쪽지함 생성" data-toggle="modal" data-target="#formModal">
<ul class="nav nav-pills nav-stacked compose-nav">

    <c:forEach items="${msgBoxList}" var="msgBox">
    	<li>
        	<a href="javascript:pagingMsgBoxMsgAjaxHtml(1, 10,${msgBox.msg_box_no},'${msgBox.msg_box_nm}');" class="moveMsgBox" >${msgBox.msg_box_nm}</a>
    	</li>
    </c:forEach>
    
</ul>
 </aside>
 
 
 <div class="modal fade" id="formModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"> 쪽지함 생성</h4>
                </div>
                <div class="modal-body">
                        이름 : <input type="text" id="msg_box" >
                        
                </div>
                <div class="modal-footer">
                    <button type="button" id="comMsgBox" class="btn btn-primary">등록</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
<form id="msgBoxFrm">
	<input type="hidden" id="msg_box_nm" name="msg_box_nm">
	<input type="hidden" id="emp_no" name="emp_no" value="${S_USER.emp_no}">
</form>
<script>
	$("#comMsgBox").on("click", function() {
		
		var msg_box_nm = $("#msg_box").val();
		if(msg_box_nm== ""){
			alert("이름을 작성해주세요");
			return false;
		}
		
		$("#msg_box_nm").val(msg_box_nm);
		$("#msgBoxFrm").attr("method","POST");
		$("#msgBoxFrm").attr("action","${cp}/msg/registMsgBox");
		$("#msgBoxFrm").submit();
	})
	
	
</script>
