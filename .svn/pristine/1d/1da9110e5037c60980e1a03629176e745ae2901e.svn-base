<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>
<script>
 $(function () {
		$(".postDetail").on("click", function() {
			
			
			var post_no = $(this).data("post_no");
			
			
			$("#post_no").val(post_no);
			
			$("#frm").attr("method","get");
	 		$("#frm").attr("action","${cp}/board/postDetail");
	 		$("#frm").submit();
			
			
		})
		$("#searchType").val("${searchType}");
		$("#perPageNum").val("${pageSize}");
		
		$("#searchBtn").on("click", function() {
			var searchType = $("#searchType").val();
// 			var pageSize = $("#perPageNum").val();
			var keyword = $("#keywords").val();
			
			
			location.href="${cp}/board/SearchPost?searchType="+searchType+"&page=1&pageSize="+${pageVo.pageSize}+"&keyword="+keyword+"&bor_no="+${bor_no};
			
		})
		
		
})

</script>

<body>

<form id="frm" action="${cp}/board/postDetail">
		<input type="hidden" id="post_no" name="post_no" value=""/>
		
</form>
<!-- 게시판 이름 -->
<h1>${bor_nm} </h1>
<br><br>
<div class="panel-body">
	<div role="grid" id="example_wrapper"
		class="dataTables_wrapper form-inline no-footer">
		<div class="row">
						<div id="insertPost" style="float: left;">

					
<%-- 					<c:forEach items="${board}" var="board"> --%>
					
					<c:choose>	
						<c:when test="${S_USER.emp_no==0 }">
<!-- 						<input type="hidden" id="emp_no" name="emp_no" value=""/> -->
						<input type="button" class="btn btn-info" onclick="location.href='${cp}/board/insertPost?emp_no=${S_USER.emp_no}'"
							value="게시글 작성하기" class="btn-info" id="insertBtn"
							style="height: 40px;">
						</c:when>	
						
						<c:when test="${S_USER.emp_no!=0 && bor_no!=-1&&bor_no!=51}">
							<input type="button" class="btn btn-info" onclick="location.href='${cp}/board/insertPost?emp_no=${S_USER.emp_no}'"
							value="게시글 작성하기" class="btn-info" id="insertBtn"
							style="height: 40px;">
						</c:when>	
					</c:choose>	
<%-- 						<c:when test="${S_USER.emp_no!=0 && board.bor_no!=-1}"> --%>
<%-- 						<input type="button" class="btn btn-info" onclick="location.href='${cp}/board/insertPost?emp_no=${S_USER.emp_no}'" --%>
<!-- 							value="게시글 작성하기" class="btn-info" id="insertBtn" -->
<!-- 							style="height: 40px;"> -->
<%-- 						</c:when>	 --%>
<%-- 					</c:forEach> --%>
						
						</div>
			<div class="col-xs-6">
				<!-- <div class="dataTables_length" id="example_length">
					<label>
					<select name="example_length" aria-controls="example" class="form-control input-sm">
							<option value="10">10</option>
							<option value="25">25</option>
							<option value="50">50</option>
							<option value="100">100</option>
					</select> records per page</label>
				</div> 
				-->
			</div>
					<!-- 	<br><br><br>
						 -->
								
						<div id="keyword" style="float:right;">
					<!-- sort num -->
					
<!-- 								<select class="form-control col-md-3" name="pageSize" id="perPageNum"> -->
<!-- 									<option value="">정렬개수</option> -->
<!-- 									<option value="5">5개씩</option> -->
<!-- 									<option value="10">10개씩</option> -->
<!-- 									<option value="15">15개씩</option> -->
<!-- 								</select>  -->
						
								<!-- search bar -->
								
								<select class="form-control col-md-3" name="searchType" id="searchType">
									<option value="">검색구분</option>
									<option value="t">제목</option>
									<option value="w">작성자</option>
								</select> 
								<input class="form-control" type="text" name="keyword"
									placeholder="검색어를 입력하세요." id="keywords" value=""> 
									<span class="input-group-append">
									<button class="btn btn-primary" type="submit" id="searchBtn"
										data-card-widget="search" >
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
								<!-- end : search bar -->
							</div>
							</div>
						</div> 		

					
				</div>
			
		<table id="example" class="table table-striped table-bordered dataTable no-footer" cellspacing="0" width="100%" aria-describedby="example_info" style="width: 100%;">
			<thead>
				<tr role="row" style="background: #d3d4d6;"> 
					<!-- <th>게시글 번호</th> -->
					
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">작성자</th>
					<th style="text-align: center;">작성일자</th>
					<th style="text-align: center;">조회수</th>
				</tr>
			</thead>

			<tbody>
		
			<c:forEach items="${postList}" var="post">
				<c:if test="${post.del_cd == 0}">
					<tr class="postDetail"  data-post_no="${post.post_no}" data-del_cd="${post.del_cd}" >
						<%-- <td>${post.post_no}</td> --%>
						<td style="text-align: center;">
							<c:forEach begin="1" end="${post.boardLevel}" var="i">
								<c:if test="${i>1}">
								&ensp;&ensp;&ensp;&ensp;
							</c:if>
						</c:forEach>
						<c:if test="${post.boardLevel!=1}">↳</c:if>
						${post.title}</td>
						<td style="text-align: center;">${post.ko_nm}</td>
						<td style="text-align: center;"><fmt:formatDate value="${post.reg_dt}" pattern="yyyy-MM-dd"/></td>
						<td style="text-align: center;">${post.hits}</td>
					</tr>
				</c:if>
			
			</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<div class="col-xs-6">
				
			</div>
			<div style="text-align: center;">
			<div class="footer" style="position: absolute; left: 80px; bottom: 120px;width: 100%; padding: 15px 0; text-align: center;">
				<div class="dataTables_paginate paging_simple_numbers" id="example_paginate" >
					<ul class="pagination">
		
					
						<li class="paginate_button previous disabled"
							aria-controls="example" tabindex="0" id="example_previous"><a
							href="#">Previous</a></li>
						<c:forEach begin="1" end="${pagination}" var="i">
						<c:choose>
							<c:when test="${pageVo.page==i}">
								<li class="paginate_button active" aria-controls="example"
									tabindex="0"><a href="#">${i}</a></li>
							</c:when>
							 <c:otherwise>
								<li class="paginate_button " aria-controls="example" tabindex="0"><a
									href="${cp}/board/postListView?page=${i}&pageSize=${pageVo.pageSize}&bor_no=${pageVo.bor_no}">${i}</a></li>
							</c:otherwise> 
						</c:choose>
						
						</c:forEach>
						<li class="paginate_button next" aria-controls="example"
							tabindex="0" id="example_next"><a href="#">Next</a></li>
						
					</ul>
					</div>
				</div>
			</div>
		</div>

</body>

