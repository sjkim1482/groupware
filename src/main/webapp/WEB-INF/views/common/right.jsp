<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<style>
	.chatDiv{
		display:none; 
		position:absolute; 
		top: 541px;
		right : 0%; 
		width:350px; 
		height:400px; 
		background: #B1E9F9;
		padding: 5px;
	}
	
</style>

    <!--sidebar right start-->
<div class="sidebarRight">
        <div id="rightside-navigation">
            <div id="right-panel-tabs" role="tabpanel">
<!--                 <ul class="nav nav-tabs nav-justified" role="tablist"> -->
<!--                     <li class="active"><a data-target="#chat" data-toggle="tab" role="tab" data-toggle="tab" title="Chat"><i class="icon-users fa-lg"></i></a> -->
<!--                     </li> -->
<!--                     <li><a data-target="#settings" role="tab" data-toggle="tab" title="Settings"><i class="icon-settings fa-lg"></i></a> -->
<!--                     </li> -->

<!--                 </ul> -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="chat">
<!--                         <div class="heading"> -->
<!--                             <ul> -->
<!--                                 <li> -->
<!--                                     <input type="text" class="search" placeholder="Search"> -->
<!--                                     <button type="submit" class="btn btn-sm btn-search"><i class="fa fa-search"></i> -->
<!--                                     </button> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </div> -->

                        <h3 class="sidebar-title">online</h3>
                        <div class="list-contacts">
                  
                            
                            <c:forEach items="${loginEmpList}" var="loginEmp">
                            	<c:if test="${loginEmp.emp_no != 0}">
		                           	<div class="chatingOnOff" >
		                            	<a href="#" class="list-item">
			                                <div class="list-item-image">
			                                	<img id="pictureViewImg" style="width: 50px; height: 50px;"	src="${cp }/empController/profile?emp_id=${loginEmp.emp_id}" />
			                                    
			                                </div>
			                                <div class="list-item-content">
			                                    <h4>${loginEmp.ko_nm} ${loginEmp.po_nm}</h4>
			                                    <p>${loginEmp.dept_nm}</p>
			                                </div>
			                                <div class="item-status item-status-online"></div>
			                            </a>
		<!-- 		                            <div class="chatDiv" style="display:none; position:fixed;  width:300px; height:400px; background: white;"> -->
			                            <div class="chatDiv">
		<!-- 		                            	<div style="border: solid 1px black;"> -->
			                            	<div style="background: #D1FBFD;">
			                            		<img id="pictureViewImg" style="width: 50px; height: 50px;"	src="${cp }/empController/profile?emp_id=${loginEmp.emp_id}" />
			                            		${loginEmp.ko_nm}??? ?????? ??????
			                            	</div>
			                            	<div style="width: 350px; height: 300px;">
			                            		dd
			                            	</div>
			                            	<textarea rows="2" cols="38"></textarea> 
			                            	<input style="float: right;" type="button" value="??????">
			                            </div>    
		                            </div>
	                            </c:if>
                            </c:forEach>
                        </div>

                    </div>
<!--                     <div role="tabpanel" class="tab-pane" id="settings"> -->
<!--                         <ul class="setting-list"> -->
<!--                             <li> -->
<!--                                 <h3 class="sidebar-title">Account Settings</h3> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <h5>Share your status</h5> -->
<!--                                 <input type="checkbox" class="js-switch" checked /> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 Vivamus sagittis lacus vel augue laoreet rutrums. -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <h5>Notifications</h5> -->
<!--                                 <input type="checkbox" class="js-switch" /> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 Vivamus sagittis lacus vel augue laoreet rutrums. -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <h5>Vacation responder</h5> -->
<!--                                 <input type="checkbox" class="js-switch" checked /> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 Vivamus sagittis lacus vel augue laoreet rutrums. -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </div> -->
                </div>
            </div>
        </div>
    </div>
    
    <!--sidebar right end-->
    
    <!-- websocket javascript -->
    <script type="text/javascript">
//         var ws;
//         var messages = document.getElementById("messages");	
        
//         $(function() {
// // 			$.ajax({
// // 				url : "${cp}/userCheck",
// // 				data : "emp_no=${S_USER.emp_no}",
// // 				success : function(data) {
// // 					if(data.checkCnt==1){
// // 						openSocket();						
// // 					}else{
						
// // 					}
// // 				},
// // 				error : function(xhr) {
// // 					alert("?????? : " + xhr.status);
// // 				}
				
// // 			})
			
// 			$(".chatingOnOff").on("click",function(){

// 				if($(this).children(".chatDiv").css("display")=="none"){
// 			        $(this).children(".chatDiv").show();
// //	 		        $(this).children("span").text("[??????]");
// 			      }else{
// //	 		        $(this).children(".chatDiv").hide();
// //	 		        $(this).children("span").text("[??????]");
// 			      }

	   
// 			})  
// 		})
        
//         function openSocket(){
//             if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
//                 writeResponse("WebSocket is already opened.");
//                 return;
//             }
//             //????????? ?????? ????????? ??????
//             ws = new WebSocket("ws://192.168.0.121/echo.do");
            
//             ws.onopen = function(event){
//                 if(event.data === undefined){
//               		return;
//                 }
//                 writeResponse(event.data);
//             };
            
//             ws.onmessage = function(event){
//                 console.log('writeResponse');
//                 console.log(event.data)
//                 writeResponse(event.data);
//             };
            
//             ws.onclose = function(event){
//                 writeResponse("?????? ??????");
//             }
            
//         }
        
//         function send(){
//            // var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
//             var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value+","+$("#recuser").val();
//             alert(text);
//             ws.send(text);
//             text = "";
//         }
        
//         function closeSocket(){
//             ws.close();
//         }
        
//         function writeResponse(text){
//             messages.innerHTML += "<br/>"+text;
//         }

//         function clearText(){
//             console.log(messages.parentNode);
//             messages.parentNode.removeChild(messages)
//       	}
        
//         openSocket();
  </script>