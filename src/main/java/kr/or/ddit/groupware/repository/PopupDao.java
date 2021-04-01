package kr.or.ddit.groupware.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.PopDisVo;
import kr.or.ddit.groupware.model.PopUpVo;

@Repository("popupDao")
public class PopupDao implements PopupDaoI{
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public int insertPopup(PopUpVo vo) {
		return template.insert("popup.insertPopup", vo);
	}

	@Override
	public List<PopUpVo> selectPopup(int popup_no) {
		return template.selectList("popup.selectPopup", popup_no);
	}

	@Override
	public int insertPopDis(PopDisVo vo) {
		return template.insert("popup.insertPopDis", vo);
	}

	@Override
	public List<PopDisVo> selectPopDis(int act_cd) {
		return template.selectList("popup.selectPopDis", act_cd);
	}

	@Override
	public PopUpVo selectPopUpList(int popup_no) {
		return (PopUpVo) template.selectOne("popup.selectPopUpList", popup_no);
	}

	@Override
	public List<PopUpVo> selectTodayPopUpList() {
		return template.selectList("popup.selectTodayPopUpList");
	}

	@Override
	public int deletePopup(PopUpVo vo) {
		return template.delete("popup.deletePopup", vo);
	}

	@Override
	public List<PopUpVo> popupListView() {
		return template.selectList("popup.popupListView");
	}

	@Override
	public PopUpVo popupDetail(int popup_no) {
		return template.selectOne("popup.popupDetail", popup_no);
	}
	
	
	


}
