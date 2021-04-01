package kr.or.ddit.groupware.approval.repository;

import java.util.List;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.approval.model.AppFileVo;
import kr.or.ddit.groupware.approval.model.AppLineVo;
import kr.or.ddit.groupware.approval.model.AppVo;
import kr.or.ddit.groupware.approval.model.PerAppLineInfoVo;
import kr.or.ddit.groupware.approval.model.PerAppLineVo;
import kr.or.ddit.groupware.model.EmpVo;

public interface AppDaoI {
	
	//���缱 ���� ��� ����Ʈ
	List<EmpVo> userInfoList(PageVo pageVO);
	// 다음결재번호조회
	int appCnt();
	// 문서 등록
	int registApp(AppVo appvo);
	// 프로젝트 기안서 등록
	int registProjectApp(AppVo appvo);
	// 휴가등록
	int registALApp(AppVo appvo);
	// 결재선 등록
	int registAppLine(AppLineVo appLineVo);
	// 결재해야할 결재목록 페이징 리스트
	List<AppLineVo> appWaitingList(PageVo pageVo);
	// 결재해야할 결재목록 수
	int appWaitingCnt(PageVo pageVo);
	
	AppVo appWaitingListView(AppLineVo appLineVo);
	
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
	
	List<AppVo> pagingAppProList(PageVo pageVo);
	
	int appProCnt(PageVo pageVo);

	List<AppVo> pagingAppCompleList(PageVo pageVo);
	
	int appCompleCnt(PageVo pageVo);
	
	List<AppVo> pagingAppTempList(PageVo pageVo);
	
	int appTempCnt(PageVo pageVo);
	
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
