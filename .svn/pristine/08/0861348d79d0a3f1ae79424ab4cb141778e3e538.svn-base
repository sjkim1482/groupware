package kr.or.ddit;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.groupware.service.BoardService;

@RequestMapping("test")
@Controller
public class MainControllerTest {
	@Resource(name = "boardService")
	private BoardService boardService;
	
	
	@RequestMapping("main")
	public String mainPage(Model model) {
		
		model.addAttribute("popUpList", boardService.selectTodayPopUpList());
		
		return "tiles.test.main";
	}
	
}
