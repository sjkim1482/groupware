package kr.or.ddit.groupware.contoller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.groupware.model.OnOffVo;
import kr.or.ddit.groupware.service.OnOffService;

@RequestMapping("onoffController")
@Controller
public class OnoffController {
	
	private static final Logger logger = LoggerFactory.getLogger(OnoffController.class);

	@Resource(name="onoffService")
	private OnOffService onoffService;
	
	@RequestMapping("doattend")
	public String doattend(int emp_no, Model model) {
		
		int insertCnt = onoffService.insertAttend(emp_no);
		
		if(insertCnt == 1) {
			int max = onoffService.selectOnoffMax();
			emp_no = max;
			OnOffVo onVo = onoffService.selectEmpAttend(emp_no);
			
			model.addAttribute("attend_time", onVo.getAttend_time());
			model.addAttribute("Cnt", insertCnt);
		}
		
		return "jsonView";
	}
	
	@RequestMapping("checkAttend")
	public String checkAttend(int emp_no,int attendCnt, Model model) {
		logger.debug("attendCnt : {}", attendCnt);

		OnOffVo onVo = onoffService.checkAttendTime(emp_no);
		
		if(attendCnt == 0) {
			try {
				model.addAttribute("empStatus", onoffService.selectEmpWorkSta(emp_no).getReal_wk_cd());
				model.addAttribute("attendTime", onVo.getAttend_time());				
			} catch (Exception e) {
				model.addAttribute("empStatus", onoffService.selectEmpWorkSta(emp_no).getReal_wk_cd());
				model.addAttribute("hi", "-");
			}
		}else {
			model.addAttribute("attendTime", onVo.getAttend_time());
			model.addAttribute("empStatus", onoffService.selectEmpWorkSta(emp_no).getReal_wk_cd());
		}
		
		return "jsonView";
	}
	
	@RequestMapping("dooff")
	public String dooff(Model model, int emp_no) {
		
		int updateCnt = onoffService.updateOffwork(emp_no);
		
		logger.debug("updateCnt : {}", updateCnt);
		
		OnOffVo onVo = onoffService.checkOffTime(emp_no);
		OnOffVo onVo1 = onoffService.selectWorktime(emp_no);
		
		if(updateCnt == 1) {
			model.addAttribute("offTime", onVo.getOffwork_time());
			model.addAttribute("workTime", onVo1.getAttend_time());
		}else {
			model.addAttribute("offTime", "-");
		}
		
		return "jsonView";
	}
	
	@RequestMapping("checkOff")
	public String checkoff(int emp_no, Model model) {
		
		int offCnt = onoffService.checkoffCnt(emp_no);
		OnOffVo onVo = onoffService.checkOffTime(emp_no);
		OnOffVo onVo1 = onoffService.selectWorktime(emp_no);
		
		if(offCnt == 0) {
			model.addAttribute("offCnt", offCnt);
		}else {
			model.addAttribute("offTime", onVo.getOffwork_time());
			model.addAttribute("workTime", onVo1.getAttend_time());
		}

		return "jsonView";
	}
	
	@RequestMapping("workStatus")
	public String workStatus(int comm_cd, int emp_no, Model model) {
		logger.debug("comm_cd : {}, emp_no : {}", comm_cd, emp_no);
		
		Map<String, Object> map = new HashMap<>();
		map.put("emp_no", emp_no);
		map.put("comm_cd", comm_cd);
		
		int updateCnt = onoffService.updateWorkStatus(map);
		
		if(updateCnt == 1) {
			model.addAttribute("empSta", onoffService.selectEmpWorkSta(emp_no).getReal_wk_cd()); 
		}else {
			model.addAttribute("empSta", 130);
		}
		
		return "jsonView";
	}

}
