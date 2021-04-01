package kr.or.ddit.groupware.approval.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.approval.model.AppFileVo;
import kr.or.ddit.groupware.approval.model.AppLineVo;
import kr.or.ddit.groupware.approval.model.AppVo;
import kr.or.ddit.groupware.approval.model.PerAppLineInfoVo;
import kr.or.ddit.groupware.approval.model.PerAppLineVo;
import kr.or.ddit.groupware.model.EmpVo;

public interface AppServiceI {

	//���缱 ���� ��� ����Ʈ
	Map<String, Object> userInfoList(PageVo pageVo);
	//문서번호에 필요한 정보
	int appCnt();
	//결재 등록
	int registApp(AppVo appvo);
	// 프로젝트 기안서 등록
	int registProjectApp(AppVo appvo);
	// 휴가등록
	int registALApp(AppVo appvo);
	// 결재선 등록
	int registAppLine(AppLineVo appLineVo);
	
	Map<String, Object> appWaitingList(PageVo pageVo);
	
	AppVo appDetail(String app_char);
	
	List<AppLineVo> appDetailLine(String app_char);
	
	int ackApp(AppLineVo appLineVo);
	
	int beforeAckApp(AppLineVo appLineVo);
	
	int checkAppStep(AppLineVo appLineVo);
	
	int checkMyAppStep(AppLineVo appLineVo);
	
	int finalAckApp(AppLineVo appLineVo);
	
	int completeApp(AppLineVo appLineVo);
	
	String appCont(String app_char);
	
	String appTurnRea(String app_char);
	
	int comApp(AppLineVo appLineVo);
	
	int finalComApp(AppLineVo appLineVo);
	
	int preApp(AppLineVo appLineVo);
	
	int beforePreLineApp(AppLineVo appLineVo);
	
	int finalPreApp(AppLineVo appLineVo);
	
	Map<String, Object> pagingAppProList(PageVo pageVo);
	
	Map<String, Object> pagingAppCompleList(PageVo pageVo);
	
	Map<String, Object> pagingAppTempList(PageVo pageVo);
	// 문서 임시저장 상세정보
	AppVo appTempDetail(String app_char);
	
	int registTempApp(AppVo appVo);
	
	int deleteApp(String app_char);
	
	int registAppFile(AppFileVo appFileVo);
	
	List<Integer> appFileList(String app_char);
	
	int deleteAppFile(int file_no);
	
	int updateAppLine(AppLineVo appLineVo);
	
	int registPerAppLineInfo(PerAppLineInfoVo perAppLineInfoVo);
	
	int registPerAppLine(PerAppLineVo perAppLineVo);
	
	int selectMaxAppLineInfo();

	List<PerAppLineInfoVo> selectAppLineInfo(int emp_no);
	
	List<Integer> selectAppLineListInfo(int per_app_line_no);
	
	
	
}
