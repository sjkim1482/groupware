package kr.or.ddit.groupware.contoller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.BoardPostVo;
import kr.or.ddit.groupware.model.PopUpVo;
import kr.or.ddit.groupware.service.AttFileService;
import kr.or.ddit.groupware.service.BoardService;
import kr.or.ddit.groupware.service.EmpService;
import kr.or.ddit.groupware.service.PopupService;

@RequestMapping("popup")
@Controller
public class PopupController {
	private static final Logger logger = LoggerFactory.getLogger(PopupController.class);

	@Resource(name = "boardService")
	private BoardService boardService;

	@Resource(name = "popupService")
	private PopupService popupService;

	// 공지사항 글에서 팝업 등록창 띄우기
	@RequestMapping(path = "popUp", method = RequestMethod.GET)
	public String popUp(int post_no, Model model) {

		BoardPostVo vo = new BoardPostVo();
		vo.setPost_no(post_no);

		model.addAttribute("postVo", boardService.selectPost(vo));

		return "board/popUp";
	}

	// 공지사항 글에서 팝업 등록하기
	@RequestMapping(path = "popUp", method = RequestMethod.POST)
	public String popUp(PopUpVo vo, Model model) {

		model.addAttribute("cnt", boardService.insertPopup(vo));

		return "jsonView";

	}

	@RequestMapping(path = "popUpView", method = RequestMethod.GET)
	public String popUpView(int popup_no, Model model) {

		model.addAttribute("popUp", boardService.selectPopUpList(popup_no));

		return "board/popUpList";
	}

	// 팝업 관리 : 팝업 리스트 보기
	@RequestMapping(path = "popupListView", method = RequestMethod.GET)
	public String popupListView(Model model) {

		model.addAttribute("popupList", popupService.popupListView());

		return "tiles.popup.popupListView";
	}

	// 팝업 관리 : 상세화면
	@RequestMapping(path = "popupDetail", method = RequestMethod.GET)
	public String popupDetail(int popup_no, Model model) {

		PopUpVo popupDetail = popupService.popupDetail(popup_no);

		model.addAttribute("popup", popupDetail);

		return "tiles.popup.popupDetail";
	}

	// 팝업 관리 : 팝업 삭제
	@RequestMapping(path = "deletePopup", method = RequestMethod.POST)
	public String deletePopup(int popup_no) {

		PopUpVo vo = new PopUpVo();
		vo.setPopup_no(popup_no);

		int deleteCnt = popupService.deletePopup(vo);

		return "redirect:/popup/popupListView";
	}

	// 팝업 관리 : 팝업 수정 화면
	@RequestMapping(path = "modifyPopup", method = RequestMethod.GET)
	public String modifyPopup(int popup_no, Model model) {

		PopUpVo vo = new PopUpVo();
		vo.setPopup_no(popup_no);

		List<PopUpVo> popup = boardService.selectPopup(popup_no);
		model.addAttribute("popup", popup);

		return "tiles.popup.modifyPopup";
	}
	
	// 팝업 관리 : 팝업 수정
//	@RequestMapping(path = "modifyPopup", method = RequestMethod.POST)
//	 public String modifyPopup(int popup_no){
//		
//		PopUpVo vo = new PopUpVo();
//		vo.setPopup_no(popup_no);
//		
//		int modifyPopup = popupService.modifyPopup(vo);
//		
//		return "redirect:/popup/popupListView";
//	}

}
