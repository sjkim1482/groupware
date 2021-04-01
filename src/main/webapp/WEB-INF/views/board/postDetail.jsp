<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
$(function() {
	

//수정


$("#modifyBtn").on("click", function() {
	$("#frm").attr("method","get");
	$("#frm").attr("action","${cp}/board/modifyPost");
	$("#frm").submit();
})

//삭제

$("#deleteBtn").on("click", function() {
	$("#frm").attr("method","post");
	$("#frm").attr("action","${cp}/board/deletePost");
	$("#frm").submit();
})

// 답글

$("#replyBtn").on("click", function() {
	$("#frm").attr("method","get");
	$("#frm").attr("action","${cp}/board/insertReply");
	$("#frm").submit();
})

// 팝업창 띄우기

$("#popupBtn").on("click", function() {
	var win = window.open("${cp}/board/popUp?post_no=${boardPost.post_no}", "windowPop", "width=650, height=700")
	
})


})
</script>

<body>
	<form id="frm" >
		<input type="hidden" name="emp_no" value="${S_USER.emp_no}">
		<input type="hidden" name="post_no" value="${boardPost.post_no}">
		<input type="hidden" name="bor_no" value="${boardPost.bor_no}">
	</form>
<!--게시판 목록 버튼 시작  -->
	
	<c:forEach items="${boardList}" var="board">
		<c:if test="${board.act_cd==1 && board.bor_no==-1 || board.bor_no ==50 || board.bor_no ==51 || board.bor_no == S_USER.dept_no}">
			<a href="${cp}/board/postListView?bor_no=${board.bor_no}">
				<input type="button" class="btn btn-primary" value="${board.bor_nm}" style="height: 40px;">
			</a>
		</c:if>
	</c:forEach>
	
<!--게시판 목록 버튼 끝  -->
	
<!-- 팝업 등록 버튼 시작-->
	<br><br><br>
	<c:if test="${S_USER.emp_no==0&&boardPost.bor_no==-1}">
		<input type="button" class="btn btn-info" id="popupBtn" value="팝업 등록" >
	</c:if>
<!-- 팝업 등록 버튼 끝-->
	<!-- 팝업 내용 -->
	
	<table border="1" style="width: 100%">
						<tr>
							<th colspan="1" style="text-align: center; height: 40px; background-color: #D8D8D8;">제목</th>
							<td colspan="4" style="line-height: 25px; text-align: center;">
								${boardPost.title}
							</td>
							<th style="text-align: center;  background-color: #D8D8D8;">작성자</th>
							<td style="text-align: center; line-height: 25px;">
						 			${boardPost.ko_nm}
							</td>
						 	<th colspan="1" style="text-align: center; height: 30px;  background-color: #D8D8D8;">일자</th>
						 	<td colspan="1" style= "height:100%; text-align: center;">
							<fmt:formatDate value="${boardPost.reg_dt}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						<tr>
						</tr>
						<tr>
							<th colspan="1" style="text-align: center;  background-color: #D8D8D8;">내용</th>
							<td align="left" valign="top" colspan="20" style="height: 500px;"> <div style="margin: 15px;">${boardPost.cont}</div></td>
						</tr>	
						<tr>	
							<th colspan="1" style="text-align: center; height: 40px; background-color: #D8D8D8;">첨부파일</th>
							<td colspan="9"><c:forEach items="${FileList}" var="file">
									<a href="${cp}/file/fileDownload?file_no=${file.file_no}">
										${file.file_nm} </a>
									<br>
								</c:forEach>
							</td>
						</tr>
					</table>
	
	
	
<%-- 	<h3>제목</h3>${boardPost.title}
	<h3>작성자</h3>${boardPost.ko_nm}
	<h3>작성일</h3><fmt:formatDate value="${boardPost.reg_dt}" pattern="yyyy-MM-dd"/>
	<h3>내용</h3>${boardPost.cont}
	<h3>첨부파일</h3>
	 <c:forEach items="${FileList}" var="file">
            	<a href="${cp}/file/fileDownload?file_no=${file.file_no}">
					${file.file_nm}
				</a><br>
            </c:forEach> --%>
	<br><br> 
	 <c:choose>
		<c:when test="${S_USER.emp_no==boardPost.emp_no}">
			<input type="button" id="modifyBtn" value="수정">
			<input type="button" id="deleteBtn" value="삭제">
		</c:when>
		<c:when test="${S_USER.emp_no==0}">
			<input type="button" id="deleteBtn" value="삭제">
		</c:when>
	</c:choose>  
			<c:if test="${boardPost.bor_no==50}">
			<input type="button" id="replyBtn" value="답글">
			</c:if> 
	<h3>댓글</h3>
		<c:forEach items="${commList}" var="comm">
			<c:choose>
				<c:when test="${comm.del_cd==1}">
				</c:when>
				<c:otherwise>
					<form action="${cp}/board/deleteComm" method="post">
					<input type="hidden" name="com_no" value="${comm.com_no}">
					<input type="hidden" name="emp_no" value="${comm.emp_no}">
					<input type="hidden" name="post_no" value="${comm.post_no}">
					${comm.cont}[${comm.ko_nm}/<fmt:formatDate value="${comm.reg_dt}" pattern="yyyy-MM-dd"/>]
					<c:if test="${S_USER.emp_no==comm.emp_no}">
						<input type="submit" value="삭제"><br>
					</c:if>
					</form>
			</c:otherwise>
			</c:choose>
		</c:forEach> 
	
	
		<form action="${cp}/board/insertComm" method="post">
			<textarea rows="3" cols="50" id="comm" name="cont"></textarea>
			<input type="hidden" name="post_no" value="${boardPost.post_no}">
			<input type="hidden" name="emp_no" value="${S_USER.emp_no}">
			<input type="submit" id="commBtn" value="댓글저장">
		</form>
 	
</body>
</html>