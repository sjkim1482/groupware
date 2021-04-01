<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
   	
    <c:choose>
    	<c:when test="${S_USER.emp_no == 0 }">
		    <a href="${cp}/empController/empinformation" class="btn btn-primary btn-trans">인사관리</a> 
			<a href="${cp}/empController/organizationChart" class="btn btn-primary btn-trans">조직도</a>
			<a href="${cp}/empController/emponoff?emp_no=${S_USER.emp_no}&emp_id=${S_USER.emp_id}" class="btn btn-primary btn-trans">근태관리</a> 
			<a href="${cp}/vacController/goVacjsp?emp_no=${S_USER.emp_no}&emp_id=${S_USER.emp_id}" class="btn btn-primary btn-trans">연차관리</a>
			<a href="${cp}/vacController/goVacStatus?emp_no=${S_USER.emp_no}&emp_id=${S_USER.emp_id}" class="btn btn-primary btn-trans">연차내역</a>
	    
    	</c:when>
    	<c:otherwise>
    		<a href="${cp}/empController/empMyPage?emp_no=${S_USER.emp_no}" class="btn btn-primary btn-trans">내 인사정보</a>
			<a href="${cp}/empController/empOrganizationChart" class="btn btn-primary btn-trans">조직도</a>
    		<a href="${cp}/empController/emponoff?emp_no=${S_USER.emp_no}&emp_id=${S_USER.emp_id}" class="btn btn-primary btn-trans">내 근태관리</a>
    		<a href="${cp}/vacController/goVacStatus?emp_no=${S_USER.emp_no}&emp_id=${S_USER.emp_id}" class="btn btn-primary btn-trans">내 연차내역</a>
    	</c:otherwise>
    </c:choose>
    

	
	
	