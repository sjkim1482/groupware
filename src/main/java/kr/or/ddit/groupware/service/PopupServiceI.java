package kr.or.ddit.groupware.service;

import java.util.List;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.PopDisVo;
import kr.or.ddit.groupware.model.PopUpVo;

public interface PopupServiceI {
	
	// 팝업등록
		int insertPopup(PopUpVo vo);
			
		List<PopUpVo> selectPopup(int popup_no);
			
		// 팝업 표시
		int insertPopDis(PopDisVo vo);
			
		List<PopDisVo> selectPopDis(int act_cd);
		
		// 로그인시 메인화면에 팝업창 띄우기
		PopUpVo selectPopUpList(int popup_no);
		
		List<PopUpVo> selectTodayPopUpList();
		
		// 팝업관리 : 팝업삭제
		int deletePopup(PopUpVo vo);
		
		// 팝업 리스트
		List<PopUpVo> popupListView();
		
		// 팝업 상세보기
		PopUpVo popupDetail(int popup_no); 
		
		

}
