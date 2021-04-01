<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/common/common_lib.jsp"%>
<head>
<meta charset="UTF-8">
<title>공지사항 팝업</title>
<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic,600italic,700italic,900italic'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
</head>

<script>

	$(function () {

		$("#close").on("click", function() {
			if ($("#check").is(":checked") == true) {
				Cookies.set("popup", "Y", {expires:1});
			} else {
		//Cookies.remove("check");

			}
			window.self.close();

		});


	});
	
// 	$('#myModal').show();
//     });
//     //팝업 Close 기능
//     function close_pop(flag) {
//          $('#myModal').hide();
//     };
	
	
</script>

<body>

<%-- <form action="${cp}/board/popUpView" id="popUpfrm" method="get"> --%>

<input type="hidden" name="popup_no" id="popup_no" value="${popUp.popup_no}">


   <!-- The Modal -->
    <%-- <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">NOTICE</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br />${popUp.title}</p>
                <p><br /></p>
                <p style="text-align: center; line-height: 1.5;"><br />${popUp.cont}</p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
            <div style="position: absolute; right: 0px; bottom: 0px;"> 
 				<input type="checkbox" id="check" onclick="closePopup();">
    			 <b style="font-size: 3px">하루에 한번만 보기</b> 
    	    </div>
 
   	 </div>
   	 </div> --%>
        <!--End Modal-->

	<h3 style="text-align: center">${popUp.title}</h3>
	<div id="more" style="text-align: right;">
	<a href="${cp}/board/postDetail?post_no=${popUp.popup_no}">자세히보기&ensp;&ensp;</a></div>
	<br>
	<br> <div style="text-align: center;"> ${popUp.cont} </div>
	<div style="position: fixed; text-align: right; bottom: 0; width: 100%;">
		<input style="right:0;" type="checkbox" id="check" onclick="closePopup();"> <b
			style="font-size: 3px">하루에 한번만 보기</b> 
		<input type="button" id="close" value="close">
	</div>
	<!-- </form>-->

</body>
<%@include file="/WEB-INF/views/common/global_lib.jsp"%>
</html>