package kr.or.ddit.groupware.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.groupware.model.VacationVo;

public interface VacationServiceI {

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
	// 사원 근속연수별 연차부여h
	int updateVac();
	// 연차리스트
	Map<String, Object> selectVacInfoPaging(Map<String, Object> map);
	// 사원, 부서 검색 페이징
	Map<String, Object> searchempVacPaging(Map<String, Object> map);
	// 연차리스트 상세조회
	Map<String, Object> selectDetVacInfoPaging(Map<String, Object> map);
	// 연차사용내역 페이징
	Map<String, Object> vacationStaPaging(Map<String, Object> map);
	// 연차사용내역 검색 페이징
	Map<String, Object> searchVacStaPaging(Map<String, Object> map);
	// 상세연차사용내역 페이징
	Map<String, Object> vacationDetStaPaging(Map<String, Object> map);
	// 상세연차사용내역 기간 검색 페이징
	Map<String, Object> searchDetStaPaging(Map<String, Object> map);
	// 기본 연차 리스트
	List<VacationVo> selectVacList();
	// 연차 사용내역 리스트
	List<VacationVo> selectUsedVacList();
	// 연차 사용내역 상세조회 리스트
	List<VacationVo> selectDetvacUsedList(int emp_no);
	// 개인 연차 정보
	VacationVo selectDetVacinfo(int emp_no);

}
