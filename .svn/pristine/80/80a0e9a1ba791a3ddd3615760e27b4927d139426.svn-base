package kr.or.ddit.groupware.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.PopDisVo;
import kr.or.ddit.groupware.model.PopUpVo;
import kr.or.ddit.groupware.repository.PopupDao;

@Service("popupService")
public class PopupService implements PopupServiceI {

	@Resource(name = "popupDao")
	private PopupDao popupDao;
	
	// 팝업등록
	@Override
	public int insertPopup(PopUpVo vo) {
		return popupDao.insertPopup(vo);
	}
	// 팝업선택
	@Override
	public List<PopUpVo> selectPopup(int popup_no) {
		return popupDao.selectPopup(popup_no);
	}
	// 팝업 표시
	@Override
	public int insertPopDis(PopDisVo vo) {
		return popupDao.insertPopDis(vo);
	}
	//팝업 표시
	@Override
	public List<PopDisVo> selectPopDis(int act_cd) {
		return popupDao.selectPopDis(act_cd);
	}
	//로그인시 메인화면에 팝업창 띄우기
	@Override
	public PopUpVo selectPopUpList(int popup_no) {
		return popupDao.selectPopUpList(popup_no);
	}
	// 로그인시 메인화면에 팝업창 띄우기
	@Override
	public List<PopUpVo> selectTodayPopUpList() {
		return popupDao.selectTodayPopUpList();
	}
	// 팝업관리 : 팝업삭제
	@Override
	public int deletePopup(PopUpVo vo) {
		return popupDao.deletePopup(vo);
	}
	//팝업관리 : 팝업리스트
	@Override
	public List<PopUpVo> popupListView() {
		return popupDao.popupListView();
	}
	//팝업관리 : 팝업 상세보기
	@Override
	public PopUpVo popupDetail(int popup_no) {
		return popupDao.popupDetail(popup_no);
	}

}
