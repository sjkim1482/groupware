<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- <link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet"> -->
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

<script>
	$(function() {
		$('#summernote').summernote();
	})
</script>

<!-- 게시글 등록 페이지 -->

<div id="container">

	<div class="row">
		<div class="col-md-8">
			
				<h3>답글 등록</h3>
			
		
			<form action="${cp}/board/insertReply" method="post">
				
				<input type="hidden" name="bor_no" value="${bor_no}">
				<input type="hidden" name="higher_post_no" value="${post_no}">
				<input type="hidden" name="emp_no" value="${S_USER.emp_no}">				
												
				<br>
				<div class="form-group">
					<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" size="50">
				</div>
				<br>
					
				<br>
				<br> 
				<!-- body 태그  -->
				
				<textarea id="summernote" name="cont"></textarea>
				 <button type="submit" class="btn btn-primary" value="등록" style="float: right;">등록</button>
			</form>





		</div>
	</div>

</div>















