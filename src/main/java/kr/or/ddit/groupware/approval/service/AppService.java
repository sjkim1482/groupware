package kr.or.ddit.groupware.approval.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.approval.model.AppFileVo;
import kr.or.ddit.groupware.approval.model.AppLineVo;
import kr.or.ddit.groupware.approval.model.AppVo;
import kr.or.ddit.groupware.approval.model.PerAppLineInfoVo;
import kr.or.ddit.groupware.approval.model.PerAppLineVo;
import kr.or.ddit.groupware.approval.repository.AppDao;
import kr.or.ddit.groupware.model.EmpVo;
import kr.or.ddit.groupware.repository.EmpDao;

@Service("appService")
public class AppService implements AppServiceI {
	
	@Resource(name = "appDao")
	private AppDao appDao;
	
	@Resource(name = "empDao")
	private EmpDao empDao;
	

	@Override
	public Map<String, Object> userInfoList(PageVo pageVo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("userList", appDao.userInfoList(pageVo));
		map.put("userCnt", empDao.selectAllUserCount());
		
		
		return map;
	}


	@Override
	public int appCnt() {
		// TODO Auto-generated method stub
		return appDao.appCnt();
	}


	@Override
	public int registApp(AppVo appvo) {
		// TODO Auto-generated method stub
		return appDao.registApp(appvo);
	}


	@Override
	public int registAppLine(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.registAppLine(appLineVo);
	}


	@Override
	public Map<String, Object> appWaitingList(PageVo pageVo) {
		Map<String, Object> map = new HashMap<>();
		
		List<AppLineVo> appLineVoList = appDao.appWaitingList(pageVo);
		List<AppVo> appVoList = new ArrayList<>();
		
		for(int i = 0; i<appLineVoList.size(); i++) {
			appVoList.add(appDao.appWaitingListView(appLineVoList.get(i)));
		}
		
		map.put("appList", appVoList);
		map.put("appCnt", appDao.appWaitingCnt(pageVo));
		map.put("pagination", (int)Math.ceil( (double)appDao.appWaitingCnt(pageVo) / pageVo.getPageSize()));
		map.put("pageVo", pageVo);
		
		
		return map;
	}


	@Override
	public AppVo appDetail(String app_char) {
		// TODO Auto-generated method stub
		return appDao.appDetail(app_char);
	}


	@Override
	public List<AppLineVo> appDetailLine(String app_char) {
		// TODO Auto-generated method stub
		return appDao.appDetailLine(app_char);
	}


	@Override
	public int ackApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.ackApp(appLineVo);
	}


	@Override
	public int beforeAckApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.beforeAckApp(appLineVo);
	}


	@Override
	public int checkAppStep(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.checkAppStep(appLineVo);
	}


	@Override
	public int checkMyAppStep(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.checkMyAppStep(appLineVo);
				
	}


	@Override
	public int finalAckApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.finalAckApp(appLineVo);
	}


	@Override
	public int completeApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.completeApp(appLineVo);
	}


	@Override
	public String appCont(String app_char) {
		// TODO Auto-generated method stub
		return appDao.appCont(app_char);
	}


	@Override
	public int comApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.comApp(appLineVo);
	}


	@Override
	public int finalComApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.finalComApp(appLineVo);
	}


	@Override
	public int preApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.preApp(appLineVo);
	}


	@Override
	public int beforePreLineApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.beforePreLineApp(appLineVo);
	}


	@Override
	public int finalPreApp(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.finalPreApp(appLineVo);
	}


	@Override
	public Map<String, Object> pagingAppProList(PageVo pageVo) {
		Map<String, Object> map = new HashMap<>();
		
		
		
		map.put("appList", appDao.pagingAppProList(pageVo));
		map.put("appCnt", appDao.appProCnt(pageVo));
		map.put("pagination", (int)Math.ceil( (double)appDao.appProCnt(pageVo) / pageVo.getPageSize()));
		map.put("pageVo", pageVo);
		
		
		return map;
	}


	@Override
	public Map<String, Object> pagingAppCompleList(PageVo pageVo) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("appList", appDao.pagingAppCompleList(pageVo));
		map.put("appCnt", appDao.appCompleCnt(pageVo));
		map.put("pagination", (int)Math.ceil( (double)appDao.appCompleCnt(pageVo) / pageVo.getPageSize()));
		map.put("pageVo", pageVo);
		
		return map;
	}


	@Override
	public Map<String, Object> pagingAppTempList(PageVo pageVo) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("appList", appDao.pagingAppTempList(pageVo));
		map.put("appCnt", appDao.appTempCnt(pageVo));
		map.put("pagination", (int)Math.ceil( (double)appDao.appTempCnt(pageVo) / pageVo.getPageSize()));
		map.put("pageVo", pageVo);
		
		return map;
	}


	@Override
	public AppVo appTempDetail(String app_char) {
		// TODO Auto-generated method stub
		return appDao.appTempDetail(app_char);
	}


	@Override
	public int registTempApp(AppVo appVo) {
		// TODO Auto-generated method stub
		return appDao.registTempApp(appVo);
	}


	@Override
	public int deleteApp(String app_char) {
		// TODO Auto-generated method stub
		return appDao.deleteApp(app_char);
	}


	@Override
	public int registAppFile(AppFileVo appFileVo) {
		// TODO Auto-generated method stub
		return appDao.registAppFile(appFileVo);
	}


	@Override
	public List<Integer> appFileList(String app_char) {
		// TODO Auto-generated method stub
		return appDao.appFileList(app_char);
	}


	@Override
	public int deleteAppFile(int file_no) {
		// TODO Auto-generated method stub
		return appDao.deleteAppFile(file_no);
	}


	@Override
	public int updateAppLine(AppLineVo appLineVo) {
		// TODO Auto-generated method stub
		return appDao.updateAppLine(appLineVo);
	}


	@Override
	public String appTurnRea(String app_char) {
		// TODO Auto-generated method stub
		return appDao.appTurnRea(app_char);
	}


	@Override
	public int registProjectApp(AppVo appvo) {
		// TODO Auto-generated method stub
		return appDao.registProjectApp(appvo);
	}


	@Override
	public int registALApp(AppVo appvo) {
		// TODO Auto-generated method stub
		return appDao.registALApp(appvo);
	}


	@Override
	public int registPerAppLineInfo(PerAppLineInfoVo perAppLineInfoVo) {
		// TODO Auto-generated method stub
		return appDao.registPerAppLineInfo(perAppLineInfoVo);
	}


	@Override
	public int registPerAppLine(PerAppLineVo perAppLineVo) {
		// TODO Auto-generated method stub
		return appDao.registPerAppLine(perAppLineVo);
	}


	@Override
	public int selectMaxAppLineInfo() {
		// TODO Auto-generated method stub
		return appDao.selectMaxAppLineInfo();
	}


	@Override
	public List<PerAppLineInfoVo> selectAppLineInfo(int emp_no) {
		// TODO Auto-generated method stub
		return appDao.selectAppLineInfo(emp_no);
	}


	@Override
	public List<Integer> selectAppLineListInfo(int per_app_line_no) {
		// TODO Auto-generated method stub
		return appDao.selectAppLineListInfo(per_app_line_no);
	}


	
	
}
