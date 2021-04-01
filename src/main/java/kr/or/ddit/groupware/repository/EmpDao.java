package kr.or.ddit.groupware.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.CommCdVo;
import kr.or.ddit.groupware.model.DeptVo;
import kr.or.ddit.groupware.model.EmpVo;
import kr.or.ddit.groupware.model.JobVo;

@Repository("empDao")
public class EmpDao implements EmpDaoI{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	//로그인
	@Override
	public EmpVo selectUser(String emp_id) {
		return template.selectOne("emp.selectUser", emp_id);
	}
	
	//개인정보동의 업데이트
	@Override
	public int agreeModify(int emp_no) {
		return template.update("emp.agreeModify", emp_no);
	}
	
	//사원정보 list 페이징처리
	@Override
	public List<EmpVo> selectPagingUser(PageVo vo) {
		return template.selectList("emp.selectPagingUser", vo);
	}
	
	//사원정보 수
	@Override
	public int selectAllUserCount() {
		return template.selectOne("emp.selectAllUserCount");
	}
	
	//사원 상세정보
	@Override
	public EmpVo detailUserAjax(EmpVo empVo) {
		return template.selectOne("emp.detailUserAjax", empVo);
	}
	
	//사원정보 수정
	@Override
	public int modifyUserAjax(EmpVo empVo) {
		return template.update("emp.modifyUserAjax", empVo);
	}
	
	//엑셀다운
	@Override
	public List<EmpVo> selectAllEmp() {
		return template.selectList("emp.selectAllEmp");
	}
	
	//인사정보 직무list조회(한사람)
	@Override
	public List<String> selectJobList(int emp_no) {
		return template.selectList("emp.selectJobList", emp_no);
	}
	
	//인사정보수정(직무삭제)
	@Override
	public int modifyDelete(int emp_no) {
		return template.delete("emp.modifyDelete", emp_no);
	}
	
	//인사정보수정(직무등록)
	@Override
	public int modifyInsert(JobVo jobVo) {
		return template.insert("emp.modifyInsert", jobVo);
	}
	
	//사원검색(이름)
	@Override
	public List<EmpVo> searchPagingEmp(PageVo vo) {
		return template.selectList("emp.searchPagingEmp", vo); 
	}
	
	//검색수
	@Override
	public int searchEmpCount(PageVo vo) {
		return template.selectOne("emp.searchEmpCount", vo);
	}
	
	//부서별 차트
	@Override
	public List<EmpVo> selectChartDept() {
		return template.selectList("emp.selectChartDept");
	}
	//직급별 차트
	@Override
	public List<EmpVo> selectChartPo() {
		return template.selectList("emp.selectChartPo");
	}
	//성별차트
	@Override
	public List<EmpVo> selectChartGender() {
		return template.selectList("emp.selectChartGender");
	}
	//재직별 차트
	@Override
	public List<EmpVo> selectChartServe() {
		return template.selectList("emp.selectChartServe");
	}

	//인사등록
	@Override
	public int registEmp(EmpVo empVo) {
		return template.insert("emp.registEmp", empVo);
	}
	
	//인사등록(id중복체크)
	@Override
	public int selectEmpidCount(String emp_id) {
		return template.selectOne("emp.selectEmpidCount", emp_id);
	}
	
	//인사등록(emp_no찾기)
	@Override
	public int selectEmpno() {
		return template.selectOne("emp.selectEmpno");
	}

	//인사 조직도(dept정보)
	@Override
	public List<DeptVo> selectDept() {
		return template.selectList("emp.selectDept");
	}
	
	//인사 조직도
	@Override
	public List<EmpVo> selectOrganization() {
		return template.selectList("emp.selectOrganization");
	}
	
	//부서명
	@Override
	public List<DeptVo> selectDeptNm() {
		return template.selectList("emp.selectDeptNm");
	}
	//성별
	@Override
	public List<CommCdVo> selectGenderNm() {
		return template.selectList("emp.selectGenderNm");
	}
	//재직코드
	@Override
	public List<CommCdVo> selectServeNm() {
		return template.selectList("emp.selectServeNm");
	}
	//직급
	@Override
	public List<CommCdVo> selectPoNm() {
		return template.selectList("emp.selectPoNm");
	}
	//직무
	@Override
	public List<CommCdVo> selectJobNm() {
		return template.selectList("emp.selectJobNm");
	}
	
	//부서등록(조직도)
	@Override
	public int registDept(DeptVo deptVo) {
		return template.insert("emp.registDept", deptVo);
	}
	
	//부서삭제(조직도)
	@Override
	public int deleteDept(DeptVo deptVo) {
		return template.delete("emp.deleteDept", deptVo);
	}

	//부서수정(조직도)
	@Override
	public int modifyDept(DeptVo deptVo) {
		return template.update("emp.modifyDept", deptVo);
	}
	
	
//==========================사원==================================
	//사용자조회
	@Override
	public EmpVo selectEmpDetail(int emp_no) {
		return template.selectOne("emp.selectEmpDetail", emp_no);
	}

	//password확인
	@Override
	public int selectPassCount(EmpVo empVo) {
		return template.selectOne("emp.selectPassCount", empVo);
	}
	
	//password변경
	@Override
	public int modifyEmp(EmpVo empVo) {
		return template.update("emp.modifyEmp", empVo);
	}


	

}
