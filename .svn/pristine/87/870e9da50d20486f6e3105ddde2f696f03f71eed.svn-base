<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재선 지정</title>
<%@include file="/WEB-INF/views/common/common_lib.jsp"%>
<script type="text/javascript">
	$(function() {
		$(".empInfo").on("click", function() {
			var dept_nm = $(this).data("dept_nm");
			var cd_ko_nm =$(this).data("cd_ko_nm");
			var ko_nm = $(this).data("ko_nm");
			var emp_no = $(this).data("emp_no");
			$("#appLineTable").append(
					"<tr class='apptr'><td>"+dept_nm+"</td><td>"+cd_ko_nm+"</td><td data-emp_no="+emp_no+">"+ko_nm+"</td></tr>"	
			)
			
		})		
		
		$("#appListConfirm").on("click", function() {

			$(opener.document).find("#co_nm2").text("");
			$(opener.document).find("#co_nm3").text("");
			$(opener.document).find("#co_nm4").text("");
			$(opener.document).find("#co_nm5").text("");
			$(opener.document).find("#name2").text("");
			$(opener.document).find("#name3").text("");
			$(opener.document).find("#name4").text("");
			$(opener.document).find("#name5").text("");
			$(opener.document).find("#empList2").text("");
			$(opener.document).find("#empList3").text("");
			$(opener.document).find("#empList4").text("");
			$(opener.document).find("#empList5").text("");


			count = 1;
			$('.apptr').each(function() {
				
				count++;
				
			    if (!this.rowIndex) return; // skip first row
			    var emp_no = $(this).find("td").eq(2).data("emp_no");
	
			    var co_nm = $(this).find("td").eq(1).html();
			    var name = $(this).find("td").eq(2).html();
			    $(opener.document).find("#co_nm"+count).text(co_nm);
			    $(opener.document).find("#name"+count).text(name);
			    $(opener.document).find("#empList"+count).val(emp_no);
			  
			    
			});
						
			

			window.self.close();
		})
	})
</script>
</head>
<body>
	<div style="float: left;">
		<table border="1">
			<tr>
				<th>부서</th>
				<th>직급</th>
				<th>이름</th>
			</tr>
			<c:forEach items="${userList}" var="user">

				<tr class="empInfo" data-emp_no="${user.emp_no}" data-dept_nm="${user.dept_nm}" data-cd_ko_nm="${user.cd_ko_nm}" data-ko_nm="${user.ko_nm}" >
					<td>${user.dept_nm}</td>
					<td>${user.cd_ko_nm}</td>
					<td data-emp_no="${user.emp_no}">${user.ko_nm}</td>
				</tr>
			</c:forEach>
		</table>
	
		<c:forEach begin="1" end="${pagination}" var="i">
			<c:choose>
				<c:when test="${pageVo.page == i}">
					<li class="paginate_button active" aria-controls="example"
						tabindex="0"><span>${i}</span></li>
					<%-- 			<a href="#">${i}</a></li> --%>
				</c:when>
				<c:otherwise>
					<li class="paginate_button " aria-controls="example" tabindex="0">
						<a href="javascript:pagingUserAjax(${i }, ${pageVo.pageSize});">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
	
		</c:forEach>
	</div>
	<div style="float: left;">
		<h4>결재선</h4>
		<table border="1" id="alt">
			<tr>
				<th>부서</th>
				<th>직급</th>
				<th>이름</th>
			</tr>
			<tbody id="appLineTable">
			
			</tbody>
		</table>
	</div>
	<input type="button" id="appListConfirm" value="확인">

</body>
</html>