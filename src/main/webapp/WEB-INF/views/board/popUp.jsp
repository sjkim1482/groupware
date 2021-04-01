<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    		
    	})
    	$('#saveBtn').on('click', function () {
    		var popup_no = $('#popup_no').val();
    		var s_time = $('#s_time').val();
    		var e_time = $('#e_time').val();
    		var title = $('#title').val();
    		var cont = $('#summernote').val();
    		
    		$.ajax({
    			url: "${cp}/board/popUp",
    			data: "popup_no="+ popup_no + "&s_time="+s_time+"&e_time="+e_time+
    					"&title="+title+"&cont="+ cont ,
				method: "post",
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
// 			$('#popUpfrm').submit();
// 			alert("등록완료");
//  			 self.close();
//	window.self.close();
		})
		
	})
	
</script>

</head>
<body>
<form action="${cp}/board/popUp" id="popUpfrm" method="post">
<input type="hidden" name="popup_no" id="popup_no" value="${postVo.post_no }">
기간 <input type="date" name="s_time" id="s_time" value="시작날짜">~
	<input type="date" name="e_time" id="e_time"  value="종료날짜"> <br>
제목 <input type="text" name="title" id="title" value="${postVo.title}"><br>
내용<br> <textarea style="height: 70%; width: 80%;" id="summernote" name="cont">
	${postVo.cont}</textarea>
<button type="button" id="saveBtn" class="btn btn-primary" value="저장" style="float: right;">저장</button>
</form>	
 	
 
</body>
</html>