package kr.or.ddit.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.CommCdVo;
import kr.or.ddit.groupware.model.ScdVo;
import kr.or.ddit.groupware.repository.ScdDao;

@Service("scdService")
public class ScdService implements ScdServiceI{
private static final Logger logger = LoggerFactory.getLogger(ScdService.class);

	@Resource(name = "scdDao")
	private ScdDao scdDao;
	
	//���� ��ȸ
	@Override
	public List<ScdVo> selectScd(ScdVo vo) {
		return scdDao.selectScd(vo);
	}

	//���� ���
	@Override
	public int registCalendar(ScdVo vo) {
		return scdDao.registCalendar(vo);
	}

	//���� ������
	@Override
	public ScdVo scdView(int scd_no) {
		return scdDao.scdView(scd_no);
	}

	//���� ����
	@Override
	public int modifyCalendar(ScdVo vo) {
		return scdDao.modifyCalendar(vo);
	}

	//���� ����
	@Override
	public int deleteCalendar(int scd_no) {
		return scdDao.deleteCalendar(scd_no);
	}
	//���� ��ü��ȸ
	@Override
	public List<ScdVo> selectAll(ScdVo vo) {
		return scdDao.selectAll(vo);
	}
	//���� �˻�
	@Override
	public Map<String, Object> searchPagingCalendar(Map<String, Object> map) {
		
		logger.debug("searchPagingCalendar() ================== \n");
		logger.debug("paramap : {}", map);
		
		Map<String, Object> paramap =  new HashMap<String, Object>();
		
		
		List<ScdVo> scdList = scdDao.searchPagingCalendar(map);
		
//		for(int i = 0; i < scdList.size(); i++) {
//			logger.debug("scdList : {}", scdList.get(i));			
//		}
//		
		Map<String, Object> cntmap = new HashMap<String, Object>();
		cntmap.put("field", map.get("field"));
		cntmap.put("data", map.get("data"));
		cntmap.put("emp_no", map.get("emp_no"));
		logger.debug("cntmap : {}", cntmap);
		
		int scdCnt=  scdDao.SearchCalendar(cntmap);
		logger.debug("scdCnt : {}", scdCnt);
		
		
		PageVo pageVo = new PageVo((int)map.get("page"), (int)map.get("pageSize"));
		
		paramap.put("scdList", scdList);
		paramap.put("scdCnt", scdCnt);
		paramap.put("pageVo", pageVo);
		
		return paramap;
	}

	@Override
	public int registPmsCalendar(ScdVo scdVo) {
		// TODO Auto-generated method stub
		return scdDao.registPmsCalendar(scdVo);
	}

	@Override
	public List<CommCdVo> selectComm_cd() {
		// TODO Auto-generated method stub
		return scdDao.selectComm_cd();
	}

	@Override
	public List<ScdVo> selectScdDivVo() {
		// TODO Auto-generated method stub
		return scdDao.selectScdDivVo();
	}

	@Override
	public List<ScdVo> selectMainScd(ScdVo scdVo) {
		// TODO Auto-generated method stub
		return scdDao.selectMainScd(scdVo);
	}


}
