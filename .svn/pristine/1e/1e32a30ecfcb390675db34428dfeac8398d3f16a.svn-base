package kr.or.ddit.groupware.repository;

import java.util.List;
import java.util.Map;

import kr.or.ddit.groupware.model.VacationVo;

public interface VacationDaoI {
	
	//휴가등록
	int registVacation(VacationVo vacationVo);
	// 휴가등록 성공시 해당휴가번호를 불러옴
	int vacationMaxNo();
	// 휴가등록시 사원 연차 감소를 위한 휴가기간 구하기
	int vacationTime(VacationVo vacationVo);
	// 휴가시 사원 연차수 감소
	int subVacCnt(VacationVo vacationVo);
	// 휴가시 사원 반차수 감소
	int subVacSrvCnt(VacationVo vacationVo);
	// 사원 근속연수별 연차부여
	int updateVac();
	// 연차리스트
	List<VacationVo> selectVacInfoPaging(Map<String, Object> map);
	// 연차리스트 카운트
	int selectVacInfoCnt();
	// 사원, 부서 검색 페이징
	List<VacationVo> searchempVacPaging(Map<String, Object> map);
	// 사원, 부서 검색 페이징 카운트
	int searchempVacCnt(Map<String, Object> map);
	// 연차리스트 상세조회
	List<VacationVo> selectDetVacInfoPaging(Map<String, Object> map);
	// 상세조회 카운트
	int selectDetVacInfoCnt(Map<String, Object> map);
	// 연차사용내역 페이징
	List<VacationVo> vacationStaPaging(Map<String, Object> map);
	// 연차사용내역 카운트
	int vacationStaPagingCnt(Map<String, Object> map);
	// 연차사용내역 검색 페이징
	List<VacationVo> searchVacStaPaging(Map<String, Object> map);
	// 연차사용내역 검색 카운트
	int searchVacStaPagingCnt(Map<String, Object> map);
	// 상세연차사용내역 페이징
	List<VacationVo> vacationDetStaPaging(Map<String, Object> map);
	// 상제연차사용내역 카운트
	int vacationDetStaPagingCnt(int emp_no);
	// 상세연차사용내역 기간 검색 페이징
	List<VacationVo> searchDetStaPaging(Map<String, Object> map);
	// 상세연차사용내역 기간 검색 페이징 카운트
	int searchDetStaPagingCnt(Map<String, Object> map);
	// 기본 연차 리스트
	List<VacationVo> selectVacList();
	// 연차 사용내역 리스트
	List<VacationVo> selectUsedVacList();
	// 연차 사용내역 상세조회 리스트
	List<VacationVo> selectDetvacUsedList(int emp_no);
	// 개인 연차 정보
	VacationVo selectDetVacinfo(int emp_no);
	
	
}
