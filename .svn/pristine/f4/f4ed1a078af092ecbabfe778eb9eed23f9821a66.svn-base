<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재선 지정</title>
<%@include file="/WEB-INF/views/common/common_lib.jsp"%>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script> -->
    
<!-- jQuery EasyUi API -->
	<link rel="stylesheet" type="text/css" href="${cp}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${cp}/easyui/themes/icon.css">
	<script type="text/javascript" src="${cp}/easyui/jquery.easyui.min.js"></script>    


<script type="text/javascript">
	empCount = 1;
	var empList = new Array();
	var appEmpList = new Array();
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
			
			if($("#per_app_line_nm").val()==""){
				alert("결재선 이름을 입력해주세요");
				return false;
			}
			
			 $("input[name=empList]").each(function(idx){   
		         
		        // 해당 체크박스의 Value 가져오기
		        var value = $(this).val();
		 
		        appEmpList.push($("input[name=empList]:eq(" + idx + ")").val());
		         
			         
			  });

			var per_app_line_nm = $("#per_app_line_nm").val();
			
			$.ajax({
				url : "${cp}/app/addAppLine",
				type : "post",
				data : "per_app_line_nm=" + per_app_line_nm + "&emp_no=${S_USER.emp_no}" + "&empList=" + appEmpList,
				success : function(data) {
					if(data.cnt!=0){
						alert("개인결재선이 저장완료 되었습니다");
						window.self.close();
					}else{
						alert("실패!");
						return false;
					}
				}
			});
			
			
			
			
// 			$(opener.document).find("#co_nm2").text("");
// 			$(opener.document).find("#co_nm3").text("");
// 			$(opener.document).find("#co_nm4").text("");
// 			$(opener.document).find("#co_nm5").text("");
// 			$(opener.document).find("#name2").text("");
// 			$(opener.document).find("#name3").text("");
// 			$(opener.document).find("#name4").text("");
// 			$(opener.document).find("#name5").text("");
// 			$(opener.document).find("#empList2").text("");
// 			$(opener.document).find("#empList3").text("");
// 			$(opener.document).find("#empList4").text("");
// 			$(opener.document).find("#empList5").text("");


// 			count = 1;
// 			$('.apptr').each(function() {
				
// 				count++;
				
// 			    if (!this.rowIndex) return; // skip first row
// 			    var emp_no = $(this).find("td").eq(2).data("emp_no");
	
// 			    var co_nm = $(this).find("td").eq(1).html();
// 			    var name = $(this).find("td").eq(2).html();
// 			    $(opener.document).find("#co_nm"+count).text(co_nm);
// 			    $(opener.document).find("#name"+count).text(name);
// 			    $(opener.document).find("#empList"+count).val(emp_no);
			  
			    
// 			});
						
			

			//window.self.close();
		})
		
		$('.tree-title').on('click',function(){
			var emp_no = $(this).children('.emp_no').val();
			var dept_nm = $(this).children('.dept_nm').val();
			var cd_ko_nm =$(this).children('.po_nm').val();
			var ko_nm = $(this).children('.ko_nm').val();
			if(dept_nm != undefined){
				if(emp_no == ${S_USER.emp_no}){
					alert("작성자는 결재선에 등록할수 없습니다.");
					return false;
				}
				if(empCount < 5){
					for(let i = 0; i < empList.length; i++){
						if(empList[i] == emp_no){
							alert("이미 등록된 결재자입니다.");
							return false;
						}
					}
					$("#appLineTable").append(
							"<tr class='apptr'><td>"+dept_nm+"<input type='hidden' class='empList' name='empList' value='"+emp_no+"'></td><td>"+cd_ko_nm+"</td><td class='delEmpNo' data-emp_no="+emp_no+">"+ko_nm+"</td><td><input type='button' class='cencleEmp btn btn-danger btn-xs' value='취소'></td></tr>"	
					)
					empList.push(emp_no);
					empCount++;
				}else{
					alert("결재선은 4명까지만 선택가능합니다.");
				}
			}
		})
		$("#appLineTable").on("click",".cencleEmp",function(){
			var delEmpNo = $(this).parent().parent().children('.delEmpNo').data("emp_no");
			$(this).parent().parent().remove();
			empCount--;
			for(let i = 0; i < empList.length; i++){
				if(empList[i] == delEmpNo){
					empList.splice(i, 1);
					i--;
				}
			}
		})
		
	})
</script>



	

   
	
	
</head>

<body>
<h2 style="text-align: center;">결재선 생성</h2>
<hr style="border: solid 0.3px black;">
<div style="padding: 20px">
	

	<div id="content">
<!-- 			<div id="title"> -->
<!-- 				<h3>구성원 관리</h3> -->
<!-- 				구성원, 조직을 추가하거나 정보를 수정할 수 있습니다. -->
<!-- 			</div> -->

<!-- 	<br><br><br> -->

			<div>
				
				<!-- 좌측매뉴 -->
				<div id="leftMenu" class="col-sm-4 col-md-3 panel-body" style="margin-right: 50px">
					<div id="leftTop">
						<h4>
							<label>조직도 </label>
						</h4>
					</div>
					<div>
						<ul class="easyui-tree" type="square">
							<li><span>부서명</span>
								<ul>
									<c:forEach items="${deptList}" var="deptList"> <!-- 부서명 -->
										<li data-options="state:'closed'"><span>${deptList.dept_nm}</span>
										
											<ul>
												<c:forEach items="${organizationList}" var="organizationList">
													<c:if test="${deptList.dept_no eq organizationList.dept_no}">
														<li class="">[${deptList.dept_nm}&nbsp;&nbsp; / &nbsp;&nbsp;${organizationList.po_nm}] 
																		&nbsp;&nbsp;${organizationList.ko_nm}
																		<input type="hidden" class="emp_no" value="${organizationList.emp_no}">
																		<input type="hidden" class="po_nm" value="${organizationList.po_nm}">
																		<input type="hidden" class="ko_nm" value="${organizationList.ko_nm}">
																		<input type="hidden" class="dept_nm" value="${organizationList.dept_nm}">
																		</li>  
													</c:if>
												</c:forEach>
											</ul>
										
										</li>
									</c:forEach>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	
	<div class="panel-body" style="float: left; width:500px; height:300px;">
<!-- 	<div class="panel-body col-sm-4 col-md-3" > -->
		<h4 style="text-align: center;">결재선</h4>
		결재선 이름 : <input type="text" name="per_app_line_nm" id="per_app_line_nm">
		<table class="table" id="alt">
			<thead>
                                 
				<tr>
					<th>부서</th>
					<th>직급</th>
					<th>이름</th>
					<th>비고</th>
				</tr>
			 </thead>
			<tbody id="appLineTable">
			
			</tbody>
		</table>
	</div>
	<br style="clear: both;">
	<div>
		<input class="btn btn-info btn-sm" style="float: right;" type="button" id="appListConfirm" value="저장">
	</div>

</div>
</body>
</html>