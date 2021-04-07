package kr.or.ddit.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.VacationVo;
import kr.or.ddit.groupware.repository.VacationDao;


@Service("vacationService")
public class VacationService implements VacationServiceI {
	
	private static final Logger logger = LoggerFactory.getLogger(VacationService.class);

	@Resource(name = "vacationDao")
	private VacationDao vacationDao;

	@Override
	public int registVacation(VacationVo vacationVo) {
		// TODO Auto-generated method stub
		return vacationDao.registVacation(vacationVo);
	}

	@Override
	public int vacationMaxNo() {
		// TODO Auto-generated method stub
		return vacationDao.vacationMaxNo();
	}

	@Override
	public int vacationTime(VacationVo vacationVo) {
		// TODO Auto-generated method stub
		return vacationDao.vacationTime(vacationVo);
	}

	@Override
	public int subVacCnt(VacationVo vacationVo) {
		// TODO Auto-generated method stub
		return vacationDao.subVacCnt(vacationVo);
	}

	@Override
	public int subVacSrvCnt(VacationVo vacationVo) {
		// TODO Auto-generated method stub
		return vacationDao.subVacSrvCnt(vacationVo);
	}
	

	@Override
	public int updateVac() {
		
		return vacationDao.updateVac();
	}
	
	@Override
	public Map<String, Object> selectVacInfoPaging(Map<String, Object> map) {
		
		logger.debug("일반 페이징 ============================== \n");
		logger.debug("map : {}", map);
		
		PageVo pageVo = new PageVo((int)map.get("page"), (int)map.get("pageSize"));
		
		List<VacationVo> vaclist = vacationDao.selectVacInfoPaging(map);
		int vaclistCnt = vacationDao.selectVacInfoCnt();
		
		logger.debug("vaclistCnt : {}", vaclistCnt);

		Map<String, Object> vacMap = new HashMap<>();
		vacMap.put("vaclist", vaclist);
		vacMap.put("pagination", (int)Math.ceil( (double)vaclistCnt / (Integer)map.get("pageSize")));
		vacMap.put("pageVo", pageVo);
		
		return vacMap;
	}

	@Override
	public Map<String, Object> searchempVacPaging(Map<String, Object> map) {
		
		logger.debug("검색 페이징 ===================================== \n");
		logger.debug("map : {}", map);
		
		PageVo pageVo = new PageVo((int)map.get("page"), (int)map.get("pageSize"));
		
		Map<String, Object> mapParam = new HashMap<>();
		
		List<VacationVo> vaclist = vacationDao.searchempVacPaging(map);
		int vaclistCnt = vacationDao.searchempVacCnt(map);
		
		mapParam.put("vaclist", vaclist);
		mapParam.put("pagination", (int)Math.ceil( (double)vaclistCnt / (Integer)map.get("pageSize")));
		mapParam.put("pageVo", pageVo);
		
		return mapParam;
	}

	@Override
	public Map<String, Object> selectDetVacInfoPaging(Map<String, Object> map) {
		
		logger.debug("상세조회 페이징 ===================================== ");
		PageVo pageVo = new PageVo((int)map.get("page"), (int)map.get("pageSize"));
		
		Map<String, Object> mapParam = new HashMap<>();
		
		List<VacationVo> vacDetlist = vacationDao.selectDetVacInfoPaging(map);
		int vacDetCnt = vacationDao.selectDetVacInfoCnt(map);
		
		mapParam.put("vacDetlist", vacDetlist);
		mapParam.put("pagination1", (int)Math.ceil( (double)vacDetCnt / (Integer)map.get("pageSize")));
		mapParam.put("pageVo1", pageVo);
		
		return mapParam;
	}

	@Override
	public Map<String, Object> vacationStaPaging(Map<String, Object> map) {
		
		PageVo pageVo = new PageVo((int)map.get("page"), (int)map.get("pageSize"));
		
		Map<String, Object> mapParam = new HashMap<>();
		List<VacationVo> vacUsedlist = vacationDao.vacationStaPaging(map);
		int vacUsedCnt = vacationDao.vacationStaPagingCnt(map);
		
		mapParam.put("vacUsedlist", vacUsedlist);
		mapParam.put("pagination", (int)Math.ceil( (double)vacUsedCnt / (Integer)map.get("pageSize")));
		mapParam.put("pageVo", pageVo);
		
		return mapParam;
	}

	@Override
	public Map<String, Object> searchVacStaPaging(Map<String, Object> map) {
		
		logger.debug("관리자에서 검색시 실행되는 SearchVacStaPaging() ===============================     \n");
		
		PageVo pageVo = new PageVo((int)map.get("page"), (int)map.get("pageSize"));
		
		logger.debug("map : {}", map);
		
		Map<String, Object> mapParam = new HashMap<>();
		List<VacationVo> vacUsedlist = vacationDao.searchVacStaPaging(map);
		
		logger.debug("vacUsedlist : {}", vacUsedlist);			
		
		int vacStaCnt = vacationDao.searchVacStaPagingCnt(map);
		
		logger.debug("vacStaCnt : {}", vacStaCnt);
		
		mapParam.put("vacUsedlist", vacUsedlist);
		mapParam.put("pagination", (int)Math.ceil( (double)vacStaCnt / (Integer)map.get("pageSize")));
		mapParam.put("pageVo", pageVo);
		
		return mapParam;
	}

	@Override
	public Map<String, Object> vacationDetStaPaging(Map<String, Object> map) {
		
		logger.debug("개인 연차사용내역 ================================== \n");

		PageVo pageVo = new PageVo((int)map.get("page"), (int)map.get("pageSize"));
		
		logger.debug("map : {}", map);
		
		Map<String, Object> mapParam = new HashMap<>();
		List<VacationVo> vacDetUsedlist = vacationDao.vacationDetStaPaging(map);
		
		for(int i = 0; i < vacDetUsedlist.size(); i++) {
			logger.debug("vacDetUsedlist : {}", vacDetUsedlist.get(i));
		}
		
		int vacStaCnt = vacationDao.vacationDetStaPagingCnt((int)map.get("emp_no"));
		
		logger.debug("vacStaCnt : {}", vacStaCnt);
		
		mapParam.put("vacDetUsedlist", vacDetUsedlist);
		mapParam.put("pagination1", (int)Math.ceil( (double)vacStaCnt / (Integer)map.get("pageSize")));
		mapParam.put("pageVo1", pageVo);
		
		return mapParam;
	}

	@Override
	public Map<String, Object> searchDetStaPaging(Map<String, Object> map) {
		
		logger.debug("개인 연차사용내역 기간 검색해버리기 ======================= \n");
		logger.debug("map : {}", map);
		
		PageVo pageVo = new PageVo((int)map.get("page"), (int)map.get("pageSize"));
		
		Map<String, Object> mapParam = new HashMap<>();
		List<VacationVo> vacUsedlist = vacationDao.searchDetStaPaging(map);
		
		for(int i = 0; i < vacUsedlist.size(); i++) {
			logger.debug("vacUustlist : {}", vacUsedlist.get(i));			
		}
		
		int vacStaCnt = vacationDao.searchDetStaPagingCnt(map);
		
		logger.debug("vacStaCnt : {}", vacStaCnt);
		
		mapParam.put("vacDetUsedlist", vacUsedlist);
		mapParam.put("pagination1", (int)Math.ceil( (double)vacStaCnt / (Integer)map.get("pageSize")));
		mapParam.put("pageVo1", pageVo);
		
		return mapParam;
	}

	@Override
	public List<VacationVo> selectVacList() {
		
		return vacationDao.selectVacList();
	}

	@Override
	public List<VacationVo> selectUsedVacList() {
		
		return vacationDao.selectUsedVacList();
	}

	@Override
	public List<VacationVo> selectDetvacUsedList(int emp_no) {
	
		return vacationDao.selectDetvacUsedList(emp_no);
	}

	@Override
	public VacationVo selectDetVacinfo(int emp_no) {
		
		return vacationDao.selectDetVacinfo(emp_no);
	}


	
}
