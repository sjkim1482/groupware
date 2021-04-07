package kr.or.ddit.groupware.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.CommCdVo;
import kr.or.ddit.groupware.model.PmsEmpVo;
import kr.or.ddit.groupware.model.PmsVo;
import kr.or.ddit.groupware.model.WorkFileVo;
@Repository("pmsDao")
public class PmsDao implements PmsDaoi{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	/** pms 전체조회 */
	@Override
	public PmsVo selectPmsemp(int emp_no) {
		return template.selectOne("pms.selectPmsemp",emp_no);
	}

	@Override
	public int registPsm(PmsVo pmsVo) {
		// TODO Auto-generated method stub
		return template.insert("pms.registPsm",pmsVo);
	}

	@Override
	public int selectPmsMaxNo() {
		// TODO Auto-generated method stub
		return template.selectOne("pms.selectPmsMaxNo");
	}

	@Override
	public int registPsmEmp(PmsEmpVo pmsEmpVo) {
		// TODO Auto-generated method stub
		return template.insert("pms.registPsmEmp",pmsEmpVo);
	}

	@Override
	public List<Integer> selectPsmEmpList(int pms_no) {
		// TODO Auto-generated method stub
		return template.selectList("pms.selectPsmEmpList",pms_no);
	}

	@Override
	public List<Integer> selectPms(int attend_emp_no) {
		// TODO Auto-generated method stub
		return template.selectList("pms.selectPms", attend_emp_no);
	}
	@Override
	public int selectPmsNo(String app_char) {
		// TODO Auto-generated method stub
		return template.selectOne("pms.selectPmsNo",app_char);
	}

	@Override
	public int approvePms(String app_char) {
		// TODO Auto-generated method stub
		return template.update("pms.approvePms",app_char);
	}

	@Override
	public List<PmsVo> pmsEmpList(int pms_no) {
		// TODO Auto-generated method stub
		return template.selectList("pms.pmsEmpList", pms_no);
	}

	@Override
	public List<PmsVo> workAllList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return template.selectList("pms.workAllList", map);
	}

	@Override
	public int workAllCnt(int pms_no) {
		// TODO Auto-generated method stub
		return template.selectOne("pms.workAllCnt", pms_no);
	}

	@Override
	public PmsVo workDetail(PmsVo pmsVo) {
		// TODO Auto-generated method stub
		return  template.selectOne("pms.workDetail", pmsVo);
	}

	@Override
	public int registWork(PmsVo pmsVo) {
		// TODO Auto-generated method stub
		return template.insert("pms.registWork", pmsVo);
	}

	@Override
	public List<CommCdVo> selectComm_cd() {
		// TODO Auto-generated method stub
		return template.selectList("pms.selectComm_cd");
	}
	@Override
	public List<CommCdVo> selectComm_cdPri() {
		// TODO Auto-generated method stub
		return template.selectList("pms.selectComm_cdPri");
	}

	@Override
	public int modifyWork(PmsVo pmsVo) {
		// TODO Auto-generated method stub
		return template.update("pms.modifyWork", pmsVo);
	}

	@Override
	public int deleteWork(int work_no) {
		// TODO Auto-generated method stub
		return template.delete("pms.deleteWork", work_no);
	}

	@Override
	public int selectWork() {
		// TODO Auto-generated method stub
		return template.selectOne("pms.selectWork");
	}

	@Override
	public int registLowerWork(PmsVo pmsVo) {
		// TODO Auto-generated method stub
		return template.insert("pms.registLowerWork", pmsVo);
	}

	@Override
	public List<PmsVo> selectListChart(int pms_no) {
		// TODO Auto-generated method stub
		return template.selectList("pms.selectListChart", pms_no);
	}

	@Override
	public List<PmsVo> selectAppList() {
		// TODO Auto-generated method stub
		return template.selectList("pms.selectAppList");
	}

	@Override
	public List<PmsVo> selectAppPmsempList(int emp_no) {
		// TODO Auto-generated method stub
		return template.selectList("pms.selectAppPmsempList", emp_no);
	}

	@Override
	public List<PmsVo> selectAll(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectList("pms.selectAll", pageVo);
	}

	@Override
	public int PmsAllCnt() {
		// TODO Auto-generated method stub
		return template.selectOne("pms.PmsAllCnt");
				
	}

	@Override
	public List<PmsVo> SelectLowerWork(int higher_work_no) {
		// TODO Auto-generated method stub
		return template.selectList("pms.SelectLowerWork", higher_work_no);
	}

	@Override
	public int registWorkFile(WorkFileVo workFileVo) {
		// TODO Auto-generated method stub
		return template.insert("pms.registWorkFile", workFileVo);
	}

	@Override
	public int modifyWorkProg(int work_no) {
		// TODO Auto-generated method stub
		return template.update("pms.modifyWorkProg", work_no);
	}

	@Override
	public List<Integer> workFileList(int file_no) {
		// TODO Auto-generated method stub
		return template.selectList("pms.workFileList", file_no);
	}


}
