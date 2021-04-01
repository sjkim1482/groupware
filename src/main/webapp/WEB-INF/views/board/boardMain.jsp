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

<script type="text/javascript">
	$(function() {

	})
</script>

<!-- 관리자 게시판 관리 메인 페이지 -->

<div id="container">

	<div class="row" style="min-width: 1200px;">
		<div class="col-md-8">

			<h3 class="board_admin">게시판 관리 페이지</h3>
			<br> <br>

			<c:forEach items="${boardList}" var="board">
				<c:if test="${board.act_cd==1}">
					<a href="${cp}/board/postListView?bor_no=${board.bor_no}"> 
					<input type="button" class="btn btn-primary" value="${board.bor_nm}"
						style="height: 40px;">
					</a>
				</c:if>
			</c:forEach>

			<br> <br> <br>
				<input type="submit" onclick="location.href='${cp}/board/insertPost?emp_no=${S_USER.emp_no}'"
				value="게시글 등록하기" class="btn btn-info" id="insertBtn"
				style="height: 40px;"> <br> <br>
			<div id="boardM" style="margin-left: 100px;">
				<form action="${cp}/board/boardCreate" method="post">
					<hr>
					<br> 
					<input type="hidden" name="emp_no" value="${S_USER.emp_no}"> 
					게시판 이름 <input type="text" name="bor_nm" /> 
					<select name="active">
						<option value="activation">활성화</option>
						<option value="disable">비활성화</option>
					</select> <input class="btn btn-info" type="submit" value="생성" />
					<hr>
				</form>
				<c:forEach items="${boardList}" var="board">
					<form action="${cp}/board/boardModify" method="post">
						게시판 이름 <input type="text" value="${board.bor_nm}" name="bor_nm"
							readonly="readonly"/>
						<c:choose>
							<c:when test="${board.act_cd==1}">
								<select name="active">
									<option value="activation" selected="selected">활성화</option>
									<option value="disable">비활성화</option>
								</select>
							</c:when>
							<c:otherwise>
								<select name="active">
									<option value="activation">활성화</option>
									<option value="disable" selected="selected">비활성화</option>
								</select>
							</c:otherwise>
						</c:choose>
						<input class="btn btn-primary btn-trans" type="submit" value="수정"><br>
					</form>
				</c:forEach>
			</div>
		</div>
	</div>

</div>















