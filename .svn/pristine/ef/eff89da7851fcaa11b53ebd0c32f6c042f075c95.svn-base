package kr.or.ddit.groupware.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.CommCdVo;
import kr.or.ddit.groupware.model.EmpVo;
import kr.or.ddit.groupware.model.OnOffVo;

public interface OnOffServiceI {
	
	// 근태 페이징 리스트 출력
	Map<String, Object> selectOnOffPaging(PageVo pageVo);
		
	// 근태 상세조회 페이징 리스트 출력
	Map<String, Object> selectOnOffDetailPaging(Map<String, Object> map);
		
	// 사원 근태 상세정보
	OnOffVo selectonoff(int emp_no);
		
	// 근태 기본 리스트 (엑셀)
	List<OnOffVo> selectOnOfflist();
		
	// 사원근태 상세 리스트 (엑셀)
	List<OnOffVo> selectOnOffDetaillist(int emp_no);
	
	// 출근하기
	int insertAttend(int emp_no);
	
	// 출근시간 출력
	OnOffVo selectEmpAttend(int emp_no);
	
	// max값 출력
	int selectOnoffMax();
	
	// 출근여부확인
	int checkAttendCnt(int emp_no);
	
	// 출근시간 재출력
	OnOffVo checkAttendTime(int emp_no);
	
	// 퇴근하기
	int updateOffwork(int emp_no);
	
	// 퇴근여부 확인
	OnOffVo checkOffTime(int emp_no);
	
	// 당일 근로시간 출력
	OnOffVo selectWorktime(int emp_no);
	
	// 퇴근여부 또확인
	int checkoffCnt(int emp_no);
	
	// 현재 근무상태 리스트
	List<CommCdVo> selectWorkStatus();
	
	// 현재 근무상태 업데이트
	int updateWorkStatus(Map<String, Object> map);
	
	// 사원 현재 근무상태 출력
	EmpVo selectEmpWorkSta(int emp_no);
	
	// 사원명, 부서명 검색 리스트 페이징
	List<OnOffVo> searchOnoffPaging(Map<String, Object> map);
	
	// 사원명, 부서명 검색 카운트
	int searchPagingCnt(Map<String, Object> map);
	
	// 사원 디테일 검색 페이징
	List<OnOffVo> searchDetailPaging(Map<String, Object> map);
	
	// 사원 디테일 검색 페이징 카운트
	int searchDetailPagingCnt(Map<String, Object> map);
	

}
