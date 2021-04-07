package kr.or.ddit.groupware.repository;

import java.util.List;
import java.util.Map;

import kr.or.ddit.groupware.model.CommCdVo;
import kr.or.ddit.groupware.model.ScdVo;

public interface ScdDaoI {
	    //일정 전체 조회
		List<ScdVo> selectAll(ScdVo vo);
		
		//일정 분류 조회
		List<ScdVo> selectScd(ScdVo vo);
		
		//일정 등록 
		int registCalendar(ScdVo vo);

		//상세정보
		ScdVo scdView(int scd_no);
		
		//일정 수정
		int modifyCalendar(ScdVo vo);
		
		//일정 삭제
		int deleteCalendar(int scd_no);
		
		//일정 검색
		List<ScdVo> searchPagingCalendar(Map<String, Object> map);
		
		//일정 검색 개수
		int SearchCalendar(Map<String, Object> map);
		
		//프로젝트 일감등록
		int registPmsCalendar(ScdVo scdVo);
		
		/*상태코드*/
		List<CommCdVo> selectComm_cd();
		
		/*일정 구분*/
		List<ScdVo> selectScdDivVo();
		
		//메인 일정 리스트 조회 
		List<ScdVo> selectMainScd(ScdVo scdVo);
	
}
