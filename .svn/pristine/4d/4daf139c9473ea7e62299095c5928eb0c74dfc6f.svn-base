package kr.or.ddit.groupware.approval.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.approval.model.AppFileVo;
import kr.or.ddit.groupware.approval.model.AppLineVo;
import kr.or.ddit.groupware.approval.model.AppVo;
import kr.or.ddit.groupware.approval.model.PerAppLineInfoVo;
import kr.or.ddit.groupware.approval.model.PerAppLineVo;
import kr.or.ddit.groupware.model.EmpVo;

@Repository("appDao")
public class AppDao implements AppDaoI {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<EmpVo> userInfoList(PageVo pageVO) {
		// TODO Auto-generated method stub
		return template.selectList("app.userInfoList", pageVO);
	}

	@Override
	public int appCnt() {
		// TODO Auto-generated method stub
		return template.selectOne("app.appCnt");
	}

	@Override
	public int registApp(AppVo appvo) {
		// TODO Auto-generated method stub
		return template.insert("app.registApp", appvo);
	}

	@Override
	public int registAppLine(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.insert("app.registAppLine", appLineVo);
	}

	@Override
	public List<AppLineVo> appWaitingList(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectList("app.appWaitingList", pageVo);
	}

	@Override
	public int appWaitingCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectOne("app.appWaitingCnt", pageVo);
	}

	@Override
	public AppVo appWaitingListView(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.selectOne("app.appWaitingListView",appLineVo);
	}

	@Override
	public AppVo appDetail(String app_char) {
		// TODO Auto-generated method stub
		return template.selectOne("app.appDetail",app_char);
	}

	@Override
	public List<AppLineVo> appDetailLine(String app_char) {
		// TODO Auto-generated method stub
		return template.selectList("app.appDetailLine",app_char);
	}

	@Override
	public int ackApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.update("app.ackApp",appLineVo);
	}

	@Override
	public int beforeAckApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.update("app.beforeAckApp",appLineVo);
	}

	@Override
	public int checkAppStep(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.selectOne("app.checkAppStep",appLineVo);
	}

	@Override
	public int checkMyAppStep(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.selectOne("app.checkMyAppStep", appLineVo);
	}

	@Override
	public int finalAckApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.update("app.finalAckApp",appLineVo);
	}

	@Override
	public int completeApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.update("app.completeApp",appLineVo);
	}

	@Override
	public String appCont(String app_char) {
		// TODO Auto-generated method stub
		return template.selectOne("app.appCont",app_char);
	}

	@Override
	public int comApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.update("app.comApp",appLineVo);
	}

	@Override
	public int finalComApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.update("app.finalComApp",appLineVo);
	}

	@Override
	public int preApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.update("app.preApp",appLineVo);
	}

	@Override
	public int beforePreLineApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.update("app.beforePreLineApp",appLineVo);
	}

	@Override
	public int finalPreApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.update("app.finalPreApp",appLineVo);
	}

	@Override
	public List<AppVo> pagingAppProList(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectList("app.pagingAppProList",pageVo);
	}

	@Override
	public int appProCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectOne("app.appProCnt",pageVo);
	}

	@Override
	public List<AppVo> pagingAppCompleList(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectList("app.pagingAppCompleList",pageVo);
	}

	@Override
	public int appCompleCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectOne("app.appCompleCnt",pageVo);
	}

	@Override
	public List<AppVo> pagingAppTempList(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectList("app.pagingAppTempList",pageVo);
	}

	@Override
	public int appTempCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectOne("app.appTempCnt",pageVo);
	}

	@Override
	public AppVo appTempDetail(String app_char) {
		// TODO Auto-generated method stub
		return template.selectOne("app.appTempDetail",app_char);
	}

	@Override
	public int registTempApp(AppVo appVo) {
		// TODO Auto-generated method stub
		return template.update("app.registTempApp",appVo);
	}

	@Override
	public int deleteApp(String app_char) {
		// TODO Auto-generated method stub
		return template.update("app.deleteApp", app_char);
	}

	@Override
	public int registAppFile(AppFileVo appFileVo) {
		// TODO Auto-generated method stub
		return template.insert("app.registAppFile",appFileVo);
	}

	@Override
	public List<Integer> appFileList(String app_char) {
		// TODO Auto-generated method stub
		return template.selectList("app.appFileList",app_char);
	}

	@Override
	public int deleteAppFile(int file_no) {
		// TODO Auto-generated method stub
		return template.delete("app.deleteAppFile",file_no);
	}

	@Override
	public int updateAppLine(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return template.update("app.updateAppLine", appLineVo);
	}

	@Override
	public String appTurnRea(String app_char) {
		// TODO Auto-generated method stub
		return template.selectOne("app.appTurnRea",app_char);
	}

	@Override
	public int registProjectApp(AppVo appvo) {
		// TODO Auto-generated method stub
		return template.insert("app.registProjectApp",appvo);
	}

	@Override
	public int registALApp(AppVo appvo) {
		// TODO Auto-generated method stub
		return template.insert("app.registALApp", appvo);
	}

	@Override
	public int registPerAppLineInfo(PerAppLineInfoVo perAppLineInfoVo) {
		// TODO Auto-generated method stub
		return template.insert("app.registPerAppLineInfo", perAppLineInfoVo);
	}

	@Override
	public int registPerAppLine(PerAppLineVo perAppLineVo) {
		// TODO Auto-generated method stub
		return template.insert("app.registPerAppLine", perAppLineVo);
	}

	@Override
	public int selectMaxAppLineInfo() {
		// TODO Auto-generated method stub
		return template.selectOne("app.selectMaxAppLineInfo");
	}

	@Override
	public List<PerAppLineInfoVo> selectAppLineInfo(int emp_no) {
		// TODO Auto-generated method stub
		return template.selectList("app.selectAppLineInfo", emp_no);
	}

	@Override
	public List<Integer> selectAppLineListInfo(int per_app_line_no) {
		// TODO Auto-generated method stub
		return template.selectList("app.selectAppLineListInfo",per_app_line_no);
	}

}
