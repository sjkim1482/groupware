<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!--sidebar left start-->
        <nav class="sidebar sidebar-left">
            <h5 class="sidebar-header">메뉴</h5>
            <ul class="nav nav-pills nav-stacked">
            <!-- emp.ath_lv==000 -->
            	<c:choose>
            		<c:when test="${S_USER.ath_lv_cd==0}">
            			<br>
            			<li>
		                    <a href="${cp}/empController/empinformation" title="Dashboard">
		                        <i class="fa fa-users"></i> 인사관리
		                    </a>
		                </li>
		                <br>
		                <li>
		                    <a href="${cp}/pms/main?attend_emp_no=${S_USER.emp_no}&page=1&pageSize=5" title="Dashboard">
		                        <i class="fa fa-bar-chart-o"></i> PMS관리
		                    </a>
		                </li>
		                <br>
		                <li>
		                    <a href="${cp}/board/boardmain" title="Dashboard">
		                        <i class="fa fa-table"></i> 게시판관리
		                    </a>
		                    
		                </li>
		                <br>
		                <li>
		                    <a href="${cp}/popup/popupListView" title="Dashboard">
		                        <i class="fa fa-picture-o"></i> 팝업목록
		                    </a>
		                </li>
            		</c:when>
            		<c:otherwise>
            			<br>
            			<li>
		                    <a href="${cp}/empController/empMyPage?emp_no=${S_USER.emp_no}" title="Dashboard">
		                        <i class="fa fa-users"></i> 인사정보
		                    </a>
		                </li>
		                <br>
		                <li>
		                    <a href="${cp}/msg/msgMain?emp_no=${S_USER.emp_no}" title="Dashboard">
		                        <i class="fa fa-envelope"></i> 쪽지
		                    </a>
		                </li>
		                <br>
		                <li>
		                    <a href="${cp}/app/appView" title="Dashboard">
		                        <i class="fa fa-file-text"></i> 결재
		                    </a>
		                </li>
		                <br>
		                <li>
		                    <a href="${cp}/scd/calendar?emp_no=${S_USER.emp_no}" title="Dashboard">
		                        <i class="fa fa-list-alt"></i> 일정관리
		                    </a>
		                </li>
		                <br>
		                <li>
		                    <a href="${cp}/pms/main?attend_emp_no=${S_USER.emp_no}" title="Dashboard">
		                        <i class="fa fa-bar-chart-o"></i> PMS
		                    </a>
		                </li>
		                <br>
		                <%-- <li>
		                    <a href="${cp}/board/mainEmployee?emp_no=${S_USER.emp_no}" title="Dashboard">
		                        <i class="fa fa-table"></i> 사내게시판
		                    </a>
		                </li>  --%>
			            <!-- 게시판 목록 변경 -->

						<li>
						
							<a href="#" title="Dashboard">
								<i class="fa fa-table"></i> 사내게시판</a>
							<ul class="nav-sub">
								<c:forEach items="${boardLeft}" var="board">
								<li><a href="${cp}/board/postListView?bor_no=${board.bor_no}">${board.bor_nm}</a></li>
								</c:forEach> 
							</ul>
						</li> 

				<!--  -->
		                
		                <br>
		                <li>
		                    <a href="${cp}/meeting/main?emp_no=${S_USER.emp_no}" title="Dashboard">
		                        <i class="fa fa-video-camera"></i> 화상회의
		                    </a>
		                </li>
            		</c:otherwise>
            	</c:choose>
              
            </ul>
        </nav>
        <!--sidebar left end-->