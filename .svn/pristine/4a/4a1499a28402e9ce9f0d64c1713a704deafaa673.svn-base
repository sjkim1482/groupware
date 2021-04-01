package kr.or.ddit.groupware.contoller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.CommCdVo;
import kr.or.ddit.groupware.model.PmsVo;
import kr.or.ddit.groupware.model.ScdVo;
import kr.or.ddit.groupware.service.PmsService;

@RequestMapping("pms")
@Controller
public class PmsController {
	
	private static final Logger logger = LoggerFactory.getLogger(PmsController.class);
	
	@Resource(name = "pmsService")
	private PmsService pmsService;
	
	/*메인 페이지*/
	@RequestMapping("main")
	public String calendar(@RequestParam(defaultValue = "1") int page,
							@RequestParam(defaultValue = "5") int pageSize,
							int attend_emp_no,  Model model) {
		
		
		PageVo pageVo = new PageVo();
		
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
		
		logger.debug("pageVo : {}",pageVo);
		/*전체 사원 프로젝트 - 관리자*/
		List<PmsVo> selectAllList = pmsService.selectAll(pageVo);
		model.addAttribute("selectAllList", selectAllList);
		logger.debug("selectAllList - 관리자 전체조회 : {}",selectAllList);
		int PmsAllCnt = pmsService.PmsAllCnt();
		
		int pagination = (int) Math.ceil((double)PmsAllCnt/pageSize);
		
		model.addAttribute("pagination",pagination);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("PmsAllCnt", PmsAllCnt);
		/*회원 프로젝트*/
		List<Integer> List = pmsService.selectPms(attend_emp_no);
		logger.debug("List : {}",List);
		
		List<PmsVo> pmsList = new ArrayList<>(); 
		for (int i = 0; i < List.size(); i++) {
			pmsList.add(pmsService.selectPmsemp(List.get(i)));
			logger.debug("pmsList : {}", pmsList);
		}
		model.addAttribute("pmsList", pmsList);
		
		// 승인 대기중인 프로젝트 전체 조회 - 관리자
		List<PmsVo> appPmsList = pmsService.selectAppList();
		model.addAttribute("appPmsList", appPmsList);
		logger.debug("appPmsList - 관리자 : {}",appPmsList);
		
		// 승인 대기중인 프로젝트 조회 - 사원
		List<PmsVo> appPmsempList = pmsService.selectAppPmsempList(attend_emp_no);
		model.addAttribute("appPmsempList", appPmsempList);
		logger.debug("appPmsempList - 사원 : {}",appPmsempList);
		
		return "tiles.pms.main";
	}
	
	
	/*상세조회*/
	@RequestMapping("pmsView")
	public String calendarView(@RequestParam(defaultValue = "1") int page,
			  				   @RequestParam(defaultValue = "10") int pageSize,  
			  				   int pms_no, Model model) {
		
		Map<String, Object> paramap = new HashMap<String, Object>();
		PageVo pagevo = new PageVo(page,pageSize);
		paramap.put("page", page);
		paramap.put("pageSize", pageSize);
		paramap.put("pms_no", pms_no);
		logger.debug("pageSize : {}", pageSize);
		logger.debug("pms_no : {}", pms_no);
		
		/*간트차트*/
		List<PmsVo> pmsChartList = pmsService.selectListChart(pms_no);
		model.addAttribute("pmsChartList",pmsChartList);
		logger.debug("pmsChartList :{}",pmsChartList);
		
		/** 구성원 조회 */
		List<PmsVo> empList = pmsService.pmsEmpList(pms_no);
		
		logger.debug("empList :{}",empList);
		model.addAttribute("empList",empList);
		
		Map<String, Object> map = pmsService.workAllList(paramap);
		
		List<PmsVo> pmsList = (List<PmsVo>)map.get("pmsList");
		logger.debug("pmsList :{}",map.get("pmsList"));
		
		PageVo pageVo = (PageVo)map.get("pageVo");
		int pmsCnt = (int)map.get("pmsCnt");
		int pagination = (int) Math.ceil((double)pmsCnt/pageSize);
		
		model.addAttribute("pmsList",pmsList);
		model.addAttribute("pagination",pagination);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pms_no", pms_no);
		model.addAttribute("pmsCnt", pmsCnt);
		
		return "tiles.pms.pmsView";
	}
	
	/*일감 상세정보페이지*/
	@RequestMapping("workDetail")
	public String workDetail(int work_no,int pms_no, Model model) {
		
		logger.debug("work_no:{}", work_no );
		logger.debug("pms_no:{}", pms_no );
		PmsVo pmsVo = new PmsVo();
		
		pmsVo.setPms_no(pms_no);
		pmsVo.setWork_no(work_no);
		
		/* 하위일감 리스트 */
		List<PmsVo> workList = pmsService.SelectLowerWork(work_no);
		/* 일감 상세정보*/
		PmsVo workVo = pmsService.workDetail(pmsVo);
		
		
		logger.debug("workVo : {}",workVo);
		model.addAttribute("workVo",workVo);
		logger.debug("workList : {}",workList);
		model.addAttribute("workList",workList);
		 
		
		return "tiles.pms.workDetail";
	}
	/*일감 등록form 참여 사원번호 프로젝트 번호*/
	@RequestMapping("registPmsForm")
	public String registPmsForm(int pms_no,int attend_emp_no, Model model) {
		
		logger.debug(" pms_no:{}", pms_no);
		logger.debug("attend_emp_no:{}", attend_emp_no);
		
		
		model.addAttribute("pms_no",pms_no);
		model.addAttribute("attend_emp_no",attend_emp_no);
		
		List<CommCdVo> commcdList = pmsService.selectComm_cd();
		List<CommCdVo> commcdPriList = pmsService.selectComm_cdPri();
		
		model.addAttribute("commcdList",commcdList);
		model.addAttribute("commcdPriList",commcdPriList);
		
		return "tiles.pms.registPms";
	}
	/*일감 등록*/
	@RequestMapping(path="registPms", method=RequestMethod.POST)
	public String registPms(int pms_no, int attend_emp_no, PmsVo pmsVo, MultipartHttpServletRequest fileList, Model model) {
		logger.debug(" pms_no:{}", pms_no);
		logger.debug("attend_emp_no:{}", attend_emp_no);
		
		pmsService.registWork(pmsVo);
		int work_no = pmsService.selectWork();	
		logger.debug(" work_no:{}", work_no);
		
		
		
		
		return "redirect:/pms/workDetail?work_no="+work_no+"&pms_no="+pms_no;
	}
	
	/*일감 수정 form 이동*/
	@RequestMapping(path="modifyPmsForm",method=RequestMethod.POST)
	public String modifyPmsForm(int work_no,int pms_no, Model model) {
		PmsVo pmsVo = new PmsVo();
		
		pmsVo.setPms_no(pms_no);
		pmsVo.setWork_no(work_no);
		
		PmsVo workVo = pmsService.workDetail(pmsVo);
		List<CommCdVo> commcdList = pmsService.selectComm_cd();
		List<CommCdVo> commcdPriList = pmsService.selectComm_cdPri();
		
		model.addAttribute("commcdList",commcdList);
		model.addAttribute("commcdPriList",commcdPriList);
		
		logger.debug("workVo : {}",workVo);
		model.addAttribute("workVo",workVo);
		
		return "tiles.pms.modifyPms";
	}
	
	/*일감 수정*/
	@RequestMapping(path="modifyPms",method=RequestMethod.POST)
	public String modifyPms(PmsVo pmsVo, int pms_no,  Model model) {
	
		
		logger.debug("pmsVo222 : {}",pmsVo);
		
		 pmsService.modifyWork(pmsVo);
		
		List<CommCdVo> commcdList = pmsService.selectComm_cd();
		List<CommCdVo> commcdPriList = pmsService.selectComm_cdPri();
		
		model.addAttribute("commcdList",commcdList);
		model.addAttribute("commcdPriList",commcdPriList);
		
		
		
//		logger.debug("workVo : {}",workVo);
//		model.addAttribute("workVo",workVo);
		
//		return "redirect:/pmsworkDetail?pms_no="+pms_no+"&work_no="+work_no;
		return "redirect:/pms/pmsView?pms_no="+pms_no;
	}
	/*일감 삭제*/
		@RequestMapping(path="deleteWork",method=RequestMethod.POST)
		public String deleteWork(int pms_no , int work_no,Model model) {
			
			
			int deleteCnt = pmsService.deleteWork(work_no);
			
			
			return "redirect:/pms/pmsView?pms_no="+pms_no;
	}
	/*하위일감 등록 form 참여 사원번호 프로젝트 번호 일감번호==>상위 일감번호등록  */
	@RequestMapping("registLowerWorkForm")
	public String registLowerWorkForm(int pms_no,int attend_emp_no, int work_no ,Model model) {
		
		logger.debug(" pms_no:{}", pms_no);
		logger.debug("attend_emp_no:{}", attend_emp_no);
		int higher_work_no = work_no;
		
		model.addAttribute("pms_no",pms_no);
		model.addAttribute("attend_emp_no",attend_emp_no);
		model.addAttribute("higher_work_no",higher_work_no);
		
		List<CommCdVo> commcdList = pmsService.selectComm_cd();
		List<CommCdVo> commcdPriList = pmsService.selectComm_cdPri();
		
		model.addAttribute("commcdList",commcdList);
		model.addAttribute("commcdPriList",commcdPriList);
		
		return "tiles.pms.registLowerWork";
	}
	/*하위일감 등록*/
	@RequestMapping(path="registLowerPms", method=RequestMethod.POST)
	public String registLowerPms(int pms_no, int attend_emp_no, int higher_work_no,  PmsVo pmsVo, Model model) {
		logger.debug(" pms_no:{}", pms_no);
		logger.debug("attend_emp_no:{}", attend_emp_no);
		
//		Date date = new Date();
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		
//		s_dt = sdf.format(date);
//		
		pmsService.registLowerWork(pmsVo);
		logger.debug(" higher_work_no:{}", higher_work_no);
		
		return "redirect:/pms/workDetail?work_no="+higher_work_no+"&pms_no="+pms_no;
	}
	
	/*일감 간트차트로 출렷 */
	@RequestMapping("selectListChart")
	public String selectListChart(int pms_no, Model model) {
		logger.debug(" pms_no:{}", pms_no);
		
		
		List<PmsVo> pmsList = pmsService.selectListChart(pms_no);
		logger.debug("pmsList : {}",pmsList);
		
		model.addAttribute("pmsList", pmsList);
		
		return "tiles.pms.pmsGanttChart";
	}
	
}
