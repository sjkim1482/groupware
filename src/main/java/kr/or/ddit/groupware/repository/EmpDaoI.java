package kr.or.ddit.groupware.repository;

import java.util.List;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.CommCdVo;
import kr.or.ddit.groupware.model.DeptVo;
import kr.or.ddit.groupware.model.EmpVo;
import kr.or.ddit.groupware.model.JobVo;

public interface EmpDaoI {

	//로그인
	EmpVo selectUser(String emp_id);
	
	//개인정보 동의 업데이트
	int agreeModify(int emp_no);
	
	//===============관리자=================

	//사원정보 list 페이징처리
	List<EmpVo> selectPagingUser(PageVo vo);
	
	//사원정보 수
	int selectAllUserCount();
	
	//사원 상세정보
	EmpVo detailUserAjax(EmpVo empVo);
	
	//사원정보 수정
	int modifyUserAjax(EmpVo empVo);
	
	//엑셀다운
	List<EmpVo> selectAllEmp();
	
	//인사정보 직무리스트조회(한사람)
	List<String> selectJobList(int emp_no);
	
	//인사정보수정(직무삭제)
	int modifyDelete(int emp_no);
	
	//인사정보수정(직무등록)
	int modifyInsert(JobVo jobVo);
	
	//사원검색
	List<EmpVo> searchPagingEmp(PageVo vo);
	
	//사원 검색수
	int searchEmpCount(PageVo vo);
	
	//부서별 차트
	List<EmpVo> selectChartDept();

	//직급별 차트
	List<EmpVo> selectChartPo();
	
	//성별 차트
	List<EmpVo> selectChartGender();

	//재직상태별 차트
	List<EmpVo> selectChartServe();
	
	//인사등록
	int registEmp(EmpVo empVo);
	
	//인사등록(id중복체크)
	int selectEmpidCount(String emp_id);
	
	//인사등록(emp_no찾기)
	int selectEmpno();
	
	//인사 조직도(부서명)
	List<DeptVo> selectDept();
	
	//인사 조직도
	List<EmpVo> selectOrganization();
	
	//부서명
	List<DeptVo> selectDeptNm();
	//성별
	List<CommCdVo> selectGenderNm();
	//재직코드 
	List<CommCdVo> selectServeNm();
	//직급
	List<CommCdVo> selectPoNm();
	//직무
	List<CommCdVo> selectJobNm();
	
	//부서등록(조직도)
	int registDept(DeptVo deptVo);
	
	//부서삭제(조직도)
	int deleteDept(DeptVo deptVo);
	
	//부서수정(조직도)
	int modifyDept(DeptVo deptVo);
	
	
	//===============사원=================
	
	//사용자 조회
	EmpVo selectEmpDetail(int emp_no);
	
	//password확인
	int selectPassCount(EmpVo empVo);
	
	//password변경
	int modifyEmp(EmpVo empVo);
	
}
