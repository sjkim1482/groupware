<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
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

<script type="text/javascript">
	$(function() {
		$('#summernote').summernote({
    		height: 370
    		
    	})
	})
	
</script>

<!-- 게시글 등록 페이지 -->

<!-- <div id="container"> -->

	<!-- <div class="row" > -->
		<div class="col-md-8" style="width: 100%" >
			
				<h3>게시글 등록</h3>
			<br><br>
		
			<form action="${cp}/board/insertPost" method="post" enctype="multipart/form-data">
				<input type="hidden" name="post_no" value="${post_no}">
				<%-- <input type="hidden" name="bor_no" value="${bor_no}"> --%>			
				<input type="hidden" name="emp_no" value="${S_USER.emp_no}">				
				<div>
					<table border="1" style="width: 100%">
						<tr>
							<th colspan="2" style="text-align: center;  background-color: #D8D8D8;">제목</th>
							<td colspan="3" style="line-height: 25px;">
								<input id="title" name="title" style="width: 100%;" type="text">
							</td>
							<th style="text-align: center;  background-color: #D8D8D8;">일자</th>
							<td style="text-align: center; line-height: 25px;">
								<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						<tr>
						 	<th colspan="2" style="text-align: center; height: 30px;  background-color: #D8D8D8;">게시판</th>
						 	<td colspan="8" style= "height:100%">
						 	<select name="bor_no" style= "height:100%">
								<option selected="selected">게시판을 선택하세요</option>
								<c:forEach items="${boardList}" var="board">
									<c:choose>
										<c:when test="${(board.bor_no==-1||board.bor_no==51) && S_USER.emp_no != 0}">
										</c:when>
										<c:otherwise>
											<option value="${board.bor_no}">${board.bor_nm}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
						</tr>
						<tr>
							<th colspan="2" style="text-align: center;  background-color: #D8D8D8;">내용</th>
							<td colspan="20" rowspan="1"><textarea style="height: 100%" id="summernote" name="cont"></textarea></td>
						</tr>	
						<tr>	
							<th colspan="2" style="text-align: center; height: 40px; background-color: #D8D8D8;">첨부파일</th>
							<td colspan="8"><input type="file" name="fileName" multiple="multiple"></td>
						</tr>
						
					</table>
					</div>
					<br>
						 <button type="submit" class="btn btn-primary" value="저장" style="float: right;">저장</button>
					</form>
				</div>
									
				<br>
				<%-- <div class="form-group">
				
					<!-- <label for="exampleInputEmail1"></label>  -->
					<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" size="50">
				</div>
				<br>
				<select name="bor_no">
					<option value="" selected="selected">게시판을 선택하세요</option>
					<c:forEach items="${boardList}" var="board">
							<c:choose>
								<c:when test="${board.bor_no==-1 && S_USER.emp_no != 0}">
								</c:when>
								<c:otherwise>
									<option value="${board.bor_no}">${board.bor_nm}</option>
								</c:otherwise>
							</c:choose>
					</c:forEach>
				</select>
					
				<br>
				<br> 
				<!-- body 태그  -->
				<textarea id="summernote" name="cont"></textarea>
				<br> 첨부파일
				<div id="addFileDiv" style="float: left;">
					<input type="file" name="insertFile">
				</div>
				<input type="button" id="addFileBtn" value="첨부파일 추가"> 
				 <button type="submit" class="btn btn-primary" value="등록" style="float: right;">등록</button> --%>
			

		<!-- </div> -->
<!-- 	</div>

</div> -->















