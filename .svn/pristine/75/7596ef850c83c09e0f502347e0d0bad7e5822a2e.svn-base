<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="rightMenu" class="col-sm-14 col-md-9">
	<div id="righttTop">
		<h4>
			<label>상세정보</label>
		</h4>
	</div>

	<div class="register-card-body">

		<form role="form" class="form-horizontal" id="frm">
			<input type="hidden" name="emp_no" value="${detailUser.emp_no}" />
		</form>

		<div class="input-group" style="float: left;">
			<div class="mailbox-attachments clearfix"
				style="text-align: center; width: 100%;">
				<div class="mailbox-attachment-icon has-img" id="pictureView"
					style="border: 1px solid green; height: 150px; width: 120px; margin: 0 auto;">
					<a
						href="${cp }/empController/profileDownload?emp_id=${detailUser.emp_id}">
						<img id="pictureViewImg" style="width: 100%; height: 100%;"
						src="${cp }/empController/profile?emp_id=${detailUser.emp_id}" />
					</a>
				</div>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2" style="font-size: 0.9em; margin-top: 20px;"> 사원번호 </label>
			<div class="col-sm-2 input-group input-group-sm"
				style="margin-top: 20px;">
				<span class="input-group-append-sm">${detailUser.emp_no}</span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 사원id </label>
			<div class="col-sm-2 input-group input-group-sm">
				<span class="input-group-append-sm">${detailUser.emp_id}</span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 부서이름 </label>
			<div class="col-sm-2 input-group input-group-sm">
				<span class="input-group-append-sm">${detailUser.dept_nm}</span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 급여 </label>
			<div class="col-sm-2 input-group input-group-sm">
				<span class="input-group-append-sm">${detailUser.sal} 만원</span>
			</div>

		</div>

		<div class="form-group row">
			<label class="col-sm-2" style="font-size: 0.9em;"> 한글이름 </label>
			<div class="col-sm-4 input-group input-group-sm" style="float: left;">
				<span class="input-group-append-sm">${detailUser.ko_nm}</span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 영문이름 </label>
			<div class="col-sm-4 input-group input-group-sm">
				<span class="input-group-append-sm">${detailUser.eg_nm}</span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 생년월일 </label>
			<div class="col-sm-4 input-group input-group-sm" style="float: left;">
				<span class="input-group-append-sm"><fmt:formatDate
						value="${detailUser.birth }" pattern="yyyy.MM.dd" /></span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 성별 </label>
			<div class="col-sm-2 input-group input-group-sm">
				<span class="input-group-append-sm">${detailUser.gender}</span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 개인ph </label>
			<div class="col-sm-4 input-group input-group-sm" style="float: left;">
				<span class="input-group-append-sm">${detailUser.per_pn}</span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 부서ph </label>
			<div class="col-sm-4 input-group input-group-sm">
				<c:choose>
					<c:when test="${detailUser.dept_pn != null}">
						<span class="input-group-append-sm">${detailUser.dept_pn }</span>
					</c:when>
					<c:otherwise>
						<span class="input-group-append-sm"><br></span>
					</c:otherwise>
				</c:choose>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> email </label>
			<div class="col-sm-4 input-group input-group-sm" style="float: left;">
				<c:choose>
					<c:when test="${detailUser.per_email != null}">
						<span class="input-group-append-sm">${detailUser.per_email}</span>
					</c:when>
					<c:otherwise>
						<span class="input-group-append-sm"><br></span>
					</c:otherwise>
				</c:choose>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> d_email </label>
			<div class="col-sm-4 input-group input-group-sm">
				<c:choose>
					<c:when test="${detailUser.dept_email != null}">
						<span class="input-group-append-sm">${detailUser.dept_email}</span>
					</c:when>
					<c:otherwise>
						<span class="input-group-append-sm"><br></span>
					</c:otherwise>
				</c:choose>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 주소 </label>
			<div class="col-sm-10 input-group input-group-sm">
				<span class="input-group-append-sm"> ${detailUser.zipcode} /
					${detailUser.addr1} , ${detailUser.addr2}</span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 입사일자 </label>
			<div class="col-sm-3 input-group input-group-sm" style="float: left;">
				<span class="input-group-append-sm"> <fmt:formatDate
						value="${detailUser.hire_dt}" pattern="yyyy-MM-dd" /></span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 퇴사일자 </label>
			<div class="col-sm-3 input-group input-group-sm">
				<c:choose>
					<c:when test="${detailUser.retire_dt == null}">
						<span class="input-group-append-sm"></span>
					</c:when>
					<c:otherwise>
						<span class="input-group-append-sm">${detailUser.retire_dt}</span>
						<%-- 												<fmt:formatDate value="${detailUser.retire_dt}" pattern="yyyy-MM-dd"/></span> --%>
					</c:otherwise>
				</c:choose>
				<br>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 재직상태 </label>
			<div class="col-sm-2 input-group input-group-sm" style="float: left;">
				<span class="input-group-append-sm">${detailUser.serve_nm}</span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 직급 </label>
			<div class="col-sm-2 input-group input-group-sm" style="float: left;">
				<span class="input-group-append-sm">${detailUser.po_nm}</span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 연차일수 </label>
			<div class="col-sm-2 input-group input-group-sm">
				<span class="input-group-append-sm">${detailUser.vac_cnt}일</span>
			</div>

			<label class="col-sm-2" style="font-size: 0.9em;"> 직무 </label>
			<div class="col-sm-10 input-group input-group-sm" style="float: left;">
				<span class="input-group-append-sm">${detailUser.job_nm}</span>
			</div>
		</div>
	</div>

</div>