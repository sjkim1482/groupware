package kr.or.ddit.groupware.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.groupware.model.CommCdVo;
import kr.or.ddit.groupware.model.ScdVo;

@Repository("scdDao")
public class ScdDao implements ScdDaoI {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public List<ScdVo> selectScd(ScdVo vo) {
		return template.selectList("scd.selectScd", vo);
	}

	@Override
	public int registCalendar(ScdVo vo) {
		return template.insert("scd.registCalendar", vo);
	}

	@Override
	public ScdVo scdView(int scd_no) {
		return template.selectOne("scd.scdView", scd_no);
	}

	@Override
	public int modifyCalendar(ScdVo vo) {
		return template.update("scd.modifyCalendar", vo);
	}

	@Override
	public int deleteCalendar(int scd_no) {
		return template.delete("scd.deleteCalendar", scd_no);
	}

	@Override
	public List<ScdVo> selectAll(ScdVo vo) {
		return template.selectList("scd.selectAll",vo);
	}

	//검색 & 페이징 처리
	@Override
	public List<ScdVo> searchPagingCalendar(Map<String, Object> map) {
		return template.selectList("scd.searchPagingCalendar", map);
	}

	//검색에 의해 조회된 행의 수 
	@Override
	public int SearchCalendar(Map<String, Object> map) {
		return template.selectOne("scd.SearchCalendar", map);
	}

	@Override
	public int registPmsCalendar(ScdVo scdVo) {
		// TODO Auto-generated method stub
		return template.insert("scd.registPmsCalendar", scdVo);
	}

	@Override
	public List<CommCdVo> selectComm_cd() {
		// TODO Auto-generated method stub
		return template.selectList("scd.selectComm_cd");
	}

	@Override
	public List<ScdVo> selectScdDivVo() {
		// TODO Auto-generated method stub
		return template.selectList("scd.selectScdDivVo");
	}

	@Override
	public List<ScdVo> selectMainScd(ScdVo scdVo) {
		// TODO Auto-generated method stub
		return template.selectList("scd.selectMainScd", scdVo);
	}

}
