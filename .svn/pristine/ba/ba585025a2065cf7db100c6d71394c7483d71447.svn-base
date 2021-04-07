package kr.or.ddit.groupware.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.CommCdVo;
import kr.or.ddit.groupware.model.EmpVo;
import kr.or.ddit.groupware.model.OnOffVo;

@Repository("onoffDao")
public class OnOffDao implements OnOffDaoI{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public List<OnOffVo> selectOnOffPaging(PageVo pageVo) {

		return template.selectList("onoff.selectOnOffPaging", pageVo);
	}

	@Override
	public int onoffCnt() {
		
		return template.selectOne("onoff.onoffCnt");
	}

	@Override
	public List<OnOffVo> selectOnOffDetailPaging(Map<String, Object> map) {
		
		return template.selectList("onoff.selectOnOffDetailPaging", map);
	}

	@Override
	public int onoffDetailCnt(int emp_no) {
		
		return template.selectOne("onoff.onoffDetailCnt", emp_no);
	}

	@Override
	public OnOffVo selectonoff(int emp_no) {
		
		return template.selectOne("onoff.selectonoff", emp_no);
	}

	@Override
	public List<OnOffVo> selectOnOfflist() {
		
		return template.selectList("onoff.selectOnOfflist");
	}

	@Override
	public List<OnOffVo> selectOnOffDetaillist(int emp_no) {
		
		return template.selectList("onoff.selectOnOffDetaillist", emp_no);
	}

	@Override
	public int insertAttend(int emp_no) {
		
		return template.insert("onoff.insertAttend", emp_no);
	}

	@Override
	public int selectOnoffMax() {
		
		return template.selectOne("onoff.selectOnoffMax");
	}

	@Override
	public OnOffVo selectEmpAttend(int emp_no) {
		
		return template.selectOne("onoff.selectEmpAttend", emp_no);
	}

	@Override
	public int checkAttendCnt(int emp_no) {
		
		return template.selectOne("onoff.checkAttendCnt", emp_no);
	}

	@Override
	public OnOffVo checkAttendTime(int emp_no) {
		
		return template.selectOne("onoff.checkAttendTime", emp_no);
	}

	@Override
	public int updateOffwork(int emp_no) {
		
		return template.update("onoff.updateOffwork", emp_no);	
	}

	@Override
	public OnOffVo checkOffTime(int emp_no) {
		
		return template.selectOne("onoff.checkOffTime", emp_no);
	}

	@Override
	public OnOffVo selectWorktime(int emp_no) {
		
		return template.selectOne("onoff.selectWorktime", emp_no);
	}

	@Override
	public int checkoffCnt(int emp_no) {
		
		return template.selectOne("onoff.checkoffCnt", emp_no);
	}

	@Override
	public List<CommCdVo> selectWorkStatus() {
		
		return template.selectList("onoff.selectWorkStatus");
	}

	@Override
	public int updateWorkStatus(Map<String, Object> map) {
		
		return template.update("onoff.updateWorkStatus", map);
	}

	@Override
	public EmpVo selectEmpWorkSta(int emp_no) {
		
		return template.selectOne("onoff.selectEmpWorkSta", emp_no);
	}

	@Override
	public List<OnOffVo> searchOnoffPaging(Map<String, Object> map) {
		
		return template.selectList("onoff.searchOnoffPaging", map);
	}

	@Override
	public int searchPagingCnt(Map<String, Object> map) {
		
		return template.selectOne("onoff.searchPagingCnt", map);
	}

	@Override
	public List<OnOffVo> searchDetailPaging(Map<String, Object> map) {
		
		return template.selectList("onoff.searchDetailPaging", map);
	}

	@Override
	public int searchDetailPagingCnt(Map<String, Object> map) {
		
		return template.selectOne("onoff.searchDetailPagingCnt", map);
	}

	@Override
	public List<OnOffVo> selectOnOffData(int emp_no) {
		
		return template.selectList("onoff.selectOnOffData", emp_no);
	}

	

	

}
