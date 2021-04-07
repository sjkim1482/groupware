package kr.or.ddit.groupware.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.groupware.model.VacationVo;

@Repository("vacationDao")
public class VacationDao implements VacationDaoI{
	
	private static final Logger logger = LoggerFactory.getLogger(VacationDao.class);

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public int registVacation(VacationVo vacationVo) {
		// TODO Auto-generated method stub
		return template.insert("vacation.registVacation",vacationVo);
	}

	@Override
	public int vacationMaxNo() {
		// TODO Auto-generated method stub
		return template.selectOne("vacation.vacationMaxNo");
	}

	@Override
	public int vacationTime(VacationVo vacationVo) {
		// TODO Auto-generated method stub
		return template.selectOne("vacation.vacationTime", vacationVo);
	}

	@Override
	public int subVacCnt(VacationVo vacationVo) {
		// TODO Auto-generated method stub
		return template.update("vacation.subVacCnt",vacationVo);
	}

	@Override
	public int subVacSrvCnt(VacationVo vacationVo) {
		// TODO Auto-generated method stub
		return template.update("vacation.subVacSrvCnt", vacationVo);
	}
	

	@Override
	public int updateVac() {
		
		return template.update("vacation.updateVac");
	}

	@Override
	public List<VacationVo> selectVacInfoPaging(Map<String, Object> map) {
		
		return template.selectList("vacation.selectVacInfoPaging", map);
	}

	@Override
	public int selectVacInfoCnt() {
		
		return template.selectOne("vacation.selectVacInfoCnt");
	}

	@Override
	public List<VacationVo> searchempVacPaging(Map<String, Object> map) {
		
		return template.selectList("vacation.searchempVacPaging", map);
	}

	@Override
	public int searchempVacCnt(Map<String, Object> map) {
		
		return template.selectOne("vacation.searchempVacCnt", map);
	}
	
	@Override
	public List<VacationVo> selectDetVacInfoPaging(Map<String, Object> map) {
		
		return template.selectList("vacation.selectDetVacInfoPaging", map);
	}
	
	@Override
	public int selectDetVacInfoCnt(Map<String, Object> map) {
		 
		return template.selectOne("vacation.selectDetVacInfoCnt", map);
	}
	
	@Override
	public List<VacationVo> vacationStaPaging(Map<String, Object> map) {
		
		return template.selectList("vacation.vacationStaPaging", map);
	}

	@Override
	public int vacationStaPagingCnt(Map<String, Object> map) {
		
		return template.selectOne("vacation.vacationStaPagingCnt", map);
	}

	@Override
	public List<VacationVo> searchVacStaPaging(Map<String, Object> map) {
		
		return template.selectList("vacation.searchVacStaPaging", map);
	}

	@Override
	public int searchVacStaPagingCnt(Map<String, Object> map) {
		
		return template.selectOne("vacation.searchVacStaPagingCnt", map);
	}

	@Override
	public List<VacationVo> vacationDetStaPaging(Map<String, Object> map) {
		
		return template.selectList("vacation.vacationDetStaPaging", map);
	}

	@Override
	public int vacationDetStaPagingCnt(int emp_no) {
		
		return template.selectOne("vacation.vacationDetStaPagingCnt", emp_no);
	}

	@Override
	public List<VacationVo> searchDetStaPaging(Map<String, Object> map) {
		
		return template.selectList("vacation.searchDetStaPaging", map);
	}
	
	@Override
	public int searchDetStaPagingCnt(Map<String, Object> map) {
		
		return template.selectOne("vacation.searchDetStaPagingCnt", map);
	}

	@Override
	public List<VacationVo> selectVacList() {
		
		return template.selectList("vacation.selectVacList");
	}

	@Override
	public List<VacationVo> selectUsedVacList() {
		
		return template.selectList("vacation.selectUsedVacList");
	}

	@Override
	public List<VacationVo> selectDetvacUsedList(int emp_no) {
		
		return template.selectList("vacation.selectDetvacUsedList", emp_no);
	}

	@Override
	public VacationVo selectDetVacinfo(int emp_no) {
		
		return template.selectOne("vacation.selectDetVacinfo", emp_no);
	}

	
	
}
