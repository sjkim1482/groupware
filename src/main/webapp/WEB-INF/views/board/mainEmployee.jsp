<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>사원 게시판</h2>
<br><br><br>


<c:forEach items="${boardList}" var="board">
		<a href="${cp}/board/postListView?bor_no=${board.bor_no}">
		<input type="button" class="btn btn-primary" value="${board.bor_nm}" style="height: 40px;">
		</a>
</c:forEach>
<br><br>
	<input type="button" class="btn btn-info" 
	onclick="location.href='${cp}/board/insertPost?emp_no=${S_USER.emp_no}'" value="게시글 작성하기" class="btn-info" id="insertBtn" style="height: 40px;">
 
</body>
</html>