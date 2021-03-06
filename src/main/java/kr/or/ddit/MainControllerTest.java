package kr.or.ddit;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.approval.service.AppService;
import kr.or.ddit.groupware.model.BoardPostVo;
import kr.or.ddit.groupware.model.EmpVo;
import kr.or.ddit.groupware.model.OnOffVo;
import kr.or.ddit.groupware.model.PmsVo;
import kr.or.ddit.groupware.model.ScdVo;
import kr.or.ddit.groupware.service.AttFileService;
import kr.or.ddit.groupware.service.BoardService;
import kr.or.ddit.groupware.service.EmpService;
import kr.or.ddit.groupware.service.MsgService;
import kr.or.ddit.groupware.service.OnOffServiceI;
import kr.or.ddit.groupware.service.PmsService;
import kr.or.ddit.groupware.service.ScdService;
import kr.or.ddit.groupware.service.VacationService;

@RequestMapping("test")
@Controller
public class MainControllerTest {
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name="empService")
	private EmpService empService;
	
	@Resource(name="appService")
	private AppService appService;
	
	@Resource(name="attFileService")
	private AttFileService attFileService;
	
	@Resource(name="pmsService")
	private PmsService pmsService;
	
	@Resource(name="vacationService")
	private VacationService vacationService;
	
	@Resource(name="msgService")
	private MsgService msgService;
	
	@Resource(name="scdService")
	private ScdService scdService;
	
	@Resource(name="onoffService")
	private OnOffServiceI onoffService;
	
	@RequestMapping("main")
	public String mainPage(Model model, int emp_no) {
		
		int attendCnt = onoffService.checkAttendCnt(emp_no);
		
		OnOffVo onVo = new OnOffVo(); 
		OnOffVo onVo1 = new OnOffVo(); 		
		
		try {
			onVo = onoffService.checkOffTime(emp_no);
			onVo1 = onoffService.selectWorktime(emp_no);
			model.addAttribute("offTime", onVo.getOffwork_time());
			model.addAttribute("workTime", onVo1.getAttend_time());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(attendCnt == 0) {
			model.addAttribute("attendCnt", 0);
		}else {
			model.addAttribute("attendCnt", 1);
		}
		
		PageVo pageVo = new PageVo();
		
		EmpVo empVo = empService.selectEmpDetail(emp_no);
		
		pageVo.setPage(1);
		pageVo.setPageSize(5);
		pageVo.setEmp_no(emp_no);
		pageVo.setBor_no(-1);
		
		ScdVo scdVo = new ScdVo();
		scdVo.setEmp_no(emp_no);
		scdVo.setDept_no(empVo.getDept_no());
		scdVo.setScd_div_no(2);
		
		model.addAttribute("userCnt", empService.selectAllUserCount());
		model.addAttribute("noReadMsgCnt", msgService.noReadMsgCnt(emp_no));
		int attend_emp_no = emp_no;
		model.addAttribute("bor_nm",boardService.selectBorNm(-1));
		List<Integer> List = pmsService.selectPms(attend_emp_no);
	
		model.addAttribute("scdList", scdService.selectMainScd(scdVo));
		List<PmsVo> pmsList = new ArrayList<>(); 
		for (int i = 0; i < List.size(); i++) {
			pmsList.add(pmsService.selectPmsemp(List.get(i)));

		}
		model.addAttribute("pmsList", pmsList);
		
		
		Map<String, Object> map = boardService.postListView(pageVo);
		List<BoardPostVo> postList = (List<BoardPostVo>)map.get("postList");
		
		
		int postCnt = (int)map.get("postCnt");
		int pagination = (int)Math.ceil((double) postCnt / pageVo.getPageSize());

		
		model.addAttribute("postList", postList);
		model.addAttribute("pagination", pagination); 
		
		
		model.addAllAttributes(appService.appWaitingList(pageVo));
		
		model.addAttribute("popUpList", boardService.selectTodayPopUpList());
		
		model.addAttribute("workStatus", onoffService.selectWorkStatus());
		
		return "tiles.test.main";
	}
	
}
