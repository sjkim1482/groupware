package kr.or.ddit.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.CommCdVo;
import kr.or.ddit.groupware.model.DeptVo;
import kr.or.ddit.groupware.model.EmpVo;
import kr.or.ddit.groupware.model.JobVo;
import kr.or.ddit.groupware.repository.EmpDao;

@Service("empService")
public class EmpService implements EmpServiceI{
	
	private static final Logger logger = LoggerFactory.getLogger(EmpService.class);

	@Resource(name = "empDao")
	private EmpDao empDao;

	//로그인
	@Override
	public EmpVo selectUser(String emp_id) {
		return empDao.selectUser(emp_id);
	}
	
	//개인정보동의 업데이트
	@Override
	public int agreeModify(int emp_no) {
		return empDao.agreeModify(emp_no);
	}
	
	//사원정보 list 페이징처리 
	@Override
	public Map<String, Object> selectPagingUser(PageVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userList", empDao.selectPagingUser(vo));
		map.put("userCnt", empDao.selectAllUserCount());
		map.put("pagination", (int)Math.ceil( (double)empDao.selectAllUserCount() / vo.getPageSize()));
		map.put("pageVo", vo);
		
		return map;
	}
	
	//사원 상세정보
	@Override
	public EmpVo detailUserAjax(EmpVo empVo) {
		EmpVo detail = empDao.detailUserAjax(empVo);
		
		logger.debug("detail : {}", detail);
		
		detail.setJob_nm(empDao.selectJobList(detail.getEmp_no()));
		
		return detail;
	}
	
	//사원수
	@Override
	public int selectAllUserCount() {
		return empDao.selectAllUserCount();
	}

	
	//인사정보수정
	@Override
	public int modifyUserAjax(EmpVo empVo) {
		return empDao.modifyUserAjax(empVo);
	}

	//엑셀다운
	@Override
	public List<EmpVo> selectAllEmp() {
		List<EmpVo> empList = empDao.selectAllEmp();
		
		for(int i = 0; i<empList.size(); i++) {
			empList.get(i).setJob_nm(empDao.selectJobList(empList.get(i).getEmp_no()));
		}
		
		return empList;
	}

	//인사정보수정(직무삭제)
	@Override
	public int modifyDelete(int emp_no) {
		return empDao.modifyDelete(emp_no);
	}

	//인사정보수정(직무등록)
	@Override
	public int modifyInsert(JobVo jobVo) {
		return empDao.modifyInsert(jobVo);
	}

	//사원검색
	@Override
	public Map<String, Object> searchPagingEmp(PageVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<EmpVo> empList = empDao.searchPagingEmp(vo);
		int empCnt = empDao.searchEmpCount(vo);
		
		map.put("userList", empList);
		map.put("userCnt", empCnt);
		map.put("pagination", (int)Math.ceil( (double)empDao.searchEmpCount(vo) / vo.getPageSize()));
		map.put("pageVo", vo);
		
		return map;
	}
	
	//부서별chart
	@Override
	public List<EmpVo> selectChartDept() {
		return empDao.selectChartDept();
	}
	//직급별chart
	@Override
	public List<EmpVo> selectChartPo() {
		return empDao.selectChartPo();
	}
	//성별chart
	@Override
	public List<EmpVo> selectChartGender() {
		return empDao.selectChartGender();
	}
	//재직별chart
	@Override
	public List<EmpVo> selectChartServe() {
		return empDao.selectChartServe();
	}
	//사원등록
	@Override
	public int registEmp(EmpVo empVo) {
		return empDao.registEmp(empVo);
	}
	//인사등록(id중복체크)
	@Override
	public int selectEmpidCount(String emp_id) {
		return empDao.selectEmpidCount(emp_id);
	}
	//인사등록(emp_no찾기)
	@Override
	public int selectEmpno() {
		return empDao.selectEmpno();
	}
	
	//인사조직도(dept정보)
	@Override
	public List<DeptVo> selectDept() {
		return empDao.selectDept();
	}
	
	//인사조직도
	@Override
	public List<EmpVo> selectOrganization() {
		return empDao.selectOrganization();
	}
	
	//부서명
	@Override
	public List<DeptVo> selectDeptNm() {
		return empDao.selectDeptNm();
	}
	//성별
	@Override
	public List<CommCdVo> selectGenderNm() {
		return empDao.selectGenderNm();
	}
	//재직코드
	@Override
	public List<CommCdVo> selectServeNm() {
		return empDao.selectServeNm();
	}
	//직급
	@Override
	public List<CommCdVo> selectPoNm() {
		return empDao.selectPoNm();
	}
	//직무
	@Override
	public List<CommCdVo> selectJobNm() {
		return empDao.selectJobNm();
	}
	
	//부서등록(조직도)
	@Override
	public int registDept(DeptVo deptVo) {
		return empDao.registDept(deptVo);
	}
	
	//부서삭제(조직도)
	@Override
	public int deleteDept(DeptVo deptVo) {
		return empDao.deleteDept(deptVo);
	}

	//부서수정(조직도)
	@Override
	public int modifyDept(DeptVo deptVo) {
		return empDao.modifyDept(deptVo);
	}
	
	//==========================사원==================================
	
	//사원조회
	@Override
	public EmpVo selectEmpDetail(int emp_no) {
		return empDao.selectEmpDetail(emp_no);
	}

	//password확인
	@Override
	public int selectPassCount(EmpVo empVo) {
		return empDao.selectPassCount(empVo);
	}

	//password변경
	@Override
	public int modifyEmp(EmpVo empVo) {
		return empDao.modifyEmp(empVo);
	}

	
	
}
