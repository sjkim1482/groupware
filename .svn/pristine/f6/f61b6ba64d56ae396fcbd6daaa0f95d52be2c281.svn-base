package kr.or.ddit.groupware.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.approval.model.AppFileVo;
import kr.or.ddit.groupware.model.CommCdVo;
import kr.or.ddit.groupware.model.PmsEmpVo;
import kr.or.ddit.groupware.model.PmsVo;
import kr.or.ddit.groupware.model.WorkFileVo;

public interface PmsServicei {

	// PSM 등록
	int registPsm(PmsVo pmsVo);
	// 가장 최근 등록한 PMS번호
	int selectPmsMaxNo();
	// 프로젝트 참여자 등록
	int registPsmEmp(PmsEmpVo pmsEmpVo);
	//PMS 참여자 리스트 불러오기
	List<Integer> selectPsmEmpList(int pms_no);
	//PMS등록번호 불러오기 
	int selectPmsNo(String app_char);
	//PMS승인처리
	int approvePms(String app_char);

	/*승인 대기중인 프로젝트 - 관리자*/
	List<PmsVo> selectAppList();
	/*승인 대기중인 프로젝트*/
	List<PmsVo> selectAppPmsempList(int emp_no);
	/*참여중인 플젝번호*/
	List<Integer> selectPms(int attend_emp_no);
	/* 해당 사원 프로젝트 리스트 조회*/
	PmsVo selectPmsemp(int emp_no);
	/* 해당 사원 프로젝트 리스트 조회 - 관리자*/
	List<PmsVo> selectAll(PageVo pageVo);
	/*프로젝트 전체 조회 총 행수*/
	int PmsAllCnt();
	
	
	/*구성원 조회*/
	List<PmsVo> pmsEmpList(int pms_no);
	/*일감 리스트*/
	Map<String, Object> workAllList(Map<String, Object> map);
	/*일감 상세정보*/
	PmsVo workDetail(PmsVo pmsVo);
	/*일감 청부파일 조회*/
	List<Integer> workFileList(int file_no);
	/*일감 등록*/
	int registWork (PmsVo pmsVo);
	/*일감 첨부파일  등록 */
	int registWorkFile(WorkFileVo workFileVo);
	/*하위일감 등록*/
	int registLowerWork (PmsVo pmsVo);
	/*하위일감 조회*/
	List<PmsVo> SelectLowerWork (int higher_work_no);
	/*일감 번호*/
	int selectWork();
	/*일감 수정*/
	int modifyWork (PmsVo pmsVo);
	/*진척도에 따른 수정 */
	int modifyWorkProg(int work_no);
	/*일감 삭제*/
	int deleteWork (int work_no);
	
	
	
	/*일감 상태코드*/
	List<CommCdVo> selectComm_cd();
	/*일감 상태코드*/
	List<CommCdVo> selectComm_cdPri();
	/*일감 간트차트*/
	List<PmsVo> selectListChart(int pms_no);
	
}
