<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
		$('#summernote').summernote({
			height: 370
		
	})
	
	$(".deleteBtn").on("click", function () {
			var file_no = $(this).data("file_no");
			var info = this;
			$.ajax({
				url : "${cp}/board/deletePostFile",
				data : {"file_no":file_no},
				type : "post",
				success : function (res) {
					if(res.deleteCnt==1){
						$(info).parent().remove();
					}else{
						alert("삭제 실패");
						return false;
					}
				},
				error : function (xhr) {
					alert("상태"+xhr.status);
				},
				dataType : "json"
			})
		})
	
	
})

</script>
<body>
 <h3>게시글 수정</h3>
 <br><br>
	<form action="${cp}/board/modifyPost" method="post" enctype="multipart/form-data">
		<input type="hidden" name="emp_no" value="${S_USER.emp_no}"> 
		<input type="hidden" name="post_no" value="${boardPost.post_no}">
	
		
		<div>
					<table border="1" style="width: 100%">
						<tr>
							<th colspan="2" style="text-align: center;  background-color: #D8D8D8;">제목</th>
							<td colspan="3" style="line-height: 25px;" >
								<input id="title" name="title" style="width: 100%;" value="${boardPost.title}">
							</td>
							<th style="text-align: center;  background-color: #D8D8D8;">일자</th>
							<td style="text-align: center; line-height: 25px;">
								<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						 	
						<tr>
							<th colspan="2" style="text-align: center;  background-color: #D8D8D8;">내용</th>
							<td colspan="20" rowspan="1">
							<textarea style="height: 100%" id="summernote" name="cont">${boardPost.cont}</textarea></td>
						</tr>	
						<tr>	
							<th colspan="2" style="text-align: center; height: 40px; background-color: #D8D8D8;">첨부파일</th>
							<td colspan="8">
								<input type="file" name="fileName" multiple="multiple">
								<c:forEach items="${FileList}" var="file">
							<div>
							<a href="${cp}/file/fileDownload?file_no=${file.file_no}">${file.file_nm} </a>
								<input type="button" class="deleteBtn" value="삭제" data-file_no="${file.file_no}"> 
							<br>
							</div>
						</c:forEach>
							</td>
						</tr>
						
					</table>
					</div>
					<br><br>
					<button type="submit" class="btn btn-primary" value="저장" style="float: right;">저장</button>

	</form>



</body>
</html>