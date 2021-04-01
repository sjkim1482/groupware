<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script>  -->
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>    
<script>
	$(function() {
		msgSideAjaxHtml();
		pagingRecMsgAjaxHtml(1, 10);
		
		$("#inbox-wrapper").on("click",".rec_msg_no",function(){
 			
			var msg_no = $(this).data("msg_no");
			
			$.ajax({
				url : "${cp}/msg/msgView",
				data : "msg_no=" + msg_no + "&emp_no=${S_USER.emp_no}",
				success : function(data) {
					msgSideAjaxHtml();
					$("#inbox-wrapper").html(data);
				},
				error : function(xhr) {
					alert("상태 : "+xhr.status);
				}
			});
		})
		
		$("#inbox-wrapper").on("click",".sent_msg_no",function(){
 
			var msg_no = $(this).data("msg_no");
			
			$.ajax({
				url : "${cp}/msg/sentMsgView",
				data : "msg_no=" + msg_no,
				success : function(data) {
					msgSideAjaxHtml();
					$("#inbox-wrapper").html(data);
				},
				error : function(xhr) {
					alert("상태 : "+xhr.status);
				}
			});
		})
		
		$("#inbox-wrapper").on("click",".temp_msg_no",function(){
 
			var msg_no = $(this).data("msg_no");
			
			$.ajax({
				url : "${cp}/msg/tempMsgView",
				data : "msg_no=" + msg_no,
				success : function(data) {
					msgSideAjaxHtml();
					$("#inbox-wrapper").html(data);
				},
				error : function(xhr) {
					alert("상태 : "+xhr.status);
				}
			});
		})
		
		$("#inbox-wrapper").on("click",".delete_msg_no",function(){
 
			var msg_no = $(this).data("msg_no");
			
			$.ajax({
				url : "${cp}/msg/deleteMsgView",
				data : "msg_no=" + msg_no,
				success : function(data) {
					msgSideAjaxHtml();
					$("#inbox-wrapper").html(data);
				},
				error : function(xhr) {
					alert("상태 : "+xhr.status);
				}
			});
		})
		
		
		$("#sideMsg").on("click","#sentMsg",function(){
 
			$.ajax({
				url : "${cp}/msg/sentMsg",
				success : function(data) {
					msgSideAjaxHtml();
					$("#inbox-wrapper").html(data);
				},
				error : function(xhr) {
					alert("상태 : "+xhr.status);
				}
			});
		})
		
		
	})

	function pagingMsgBoxMsgAjaxHtml(page, pageSize, msg_box_no, msg_box_nm) {
		$.ajax({
			url : "${cp}/msg/pagingMsgBoxMsgAjaxHtml",
			data : "page=" + page + "&pageSize=" + pageSize+ "&msg_box_no="+msg_box_no+"&msg_box_nm=" + msg_box_nm  +"&emp_no=${S_USER.emp_no}",
			success : function(data) {
				$("#inbox-wrapper").html(data);
			},
			error : function(xhr) {
				alert("상태 : "+xhr.status);
			}
		});
	}	
	
	function pagingRecMsgAjaxHtml(page, pageSize) {
		$.ajax({
			url : "${cp}/msg/pagingRecMsgAjaxHtml",
			data : "page=" + page + "&pageSize=" + pageSize+"&emp_no=${S_USER.emp_no}",
			success : function(data) {
				$("#inbox-wrapper").html(data);
			},
			error : function(xhr) {
				alert("상태 : "+xhr.status);
			}
		});
	}
	
	function pagingSentMsgAjaxHtml(page, pageSize) {
		$.ajax({
			url : "${cp}/msg/pagingSentMsgAjaxHtml",
			data : "page=" + page + "&pageSize=" + pageSize+"&emp_no=${S_USER.emp_no}",
			success : function(data) {
				$("#inbox-wrapper").html(data);
			},
			error : function(xhr) {
				alert("상태 : "+xhr.status);
			}
		});
	}
	
	function pagingTempMsgAjaxHtml(page, pageSize) {
		$.ajax({
			url : "${cp}/msg/pagingTempMsgAjaxHtml",
			data : "page=" + page + "&pageSize=" + pageSize+"&emp_no=${S_USER.emp_no}",
			success : function(data) {
				$("#inbox-wrapper").html(data);
			},
			error : function(xhr) {
				alert("상태 : "+xhr.status);
			}
		});
	}
	
	function pagingDeleteMsgAjaxHtml(page, pageSize) {
		$.ajax({
			url : "${cp}/msg/pagingDeleteMsgAjaxHtml",
			data : "page=" + page + "&pageSize=" + pageSize+"&emp_no=${S_USER.emp_no}",
			success : function(data) {
				$("#inbox-wrapper").html(data);
			},
			error : function(xhr) {
				alert("상태 : "+xhr.status);
			}
		});
	}
	
	function msgSideAjaxHtml() {
		$.ajax({
			url : "${cp}/msg/msgSideAjaxHtml",
			data : "emp_no=${S_USER.emp_no}",
			success : function(data) {
				$("#sideMsg").html(data);
			},
			error : function(xhr) {
				alert("상태 : "+xhr.status);
			}
		});
	}
	
	
</script>
    
<section id="main-content">
                <!--mail wrapper start-->
                <div class="row">
                    <div class="col-md-2 col-sm-12" id="compose-wrapper">
                        <div id="sideMsg" class="panel">
                            
                        </div>


                    </div>
                    <div class="col-md-10 col-sm-12" id="inbox-wrapper">

<!--                         <section class="panel"> -->
<!--                             <header class="panel-heading wht-bg"> -->
<!--                                 <h4 class="gen-case">Inbox (83) -->
<!--                         <form action="#" class="pull-right mail-src-position"> -->
<!--                             <div class="input-append"> -->
<!--                                 <input type="text" class="form-control " placeholder="Search Mail"> -->
<!--                             </div> -->
<!--                         </form> -->
<!--                        </h4> -->
<!--                             </header> -->
<!--                             <div class="panel-body minimal" style="width: 100%"> -->

                                 
<!--                             </div> -->
<!--                         </section> -->

                    </div>

                </div>
                </section>