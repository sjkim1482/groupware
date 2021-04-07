package kr.or.ddit.groupware.contoller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.EmpVo;
import kr.or.ddit.groupware.model.OnOffVo;
import kr.or.ddit.groupware.model.VacationVo;
import kr.or.ddit.groupware.service.EmpServiceI;
import kr.or.ddit.groupware.service.OnOffServiceI;
import kr.or.ddit.groupware.service.VacationService;
import kr.or.ddit.groupware.service.VacationServiceI;

@RequestMapping("vacController")
@Controller
public class VacationController {
	
	private static final Logger logger = LoggerFactory.getLogger(VacationController.class);

	@Resource(name="onoffService")
	private OnOffServiceI onoffService;
	
	@Resource(name="vacationService")
	private VacationServiceI vacService;
	
	@Resource(name="empService")
	private EmpServiceI empService;
	
	@RequestMapping("goVacjsp")
	public String goVacJsp(@RequestParam(defaultValue="1") int page,
						   @RequestParam(defaultValue="15") int pageSize,
						   int emp_no, String emp_id, Model model) {
		
		PageVo pageVo = new PageVo(page, pageSize);
		
		OnOffVo onVo = new OnOffVo(); 
		OnOffVo onVo1 = new OnOffVo(); 	
		
		int attendCnt = onoffService.checkAttendCnt(emp_no);
		
		try {
			onVo = onoffService.checkOffTime(emp_no);
			onVo1 = onoffService.selectWorktime(emp_no);
			model.addAttribute("offTime", onVo.getOffwork_time());
			model.addAttribute("workTime", onVo1.getAttend_time());
		} catch (Exception e) {
			model.addAttribute("hi", "-");
		}
		
		if(attendCnt == 0) {
			model.addAttribute("attendCnt", 0);
		}else {
			model.addAttribute("attendCnt", 1);
		}
		
		Map<String, Object> mapParam = new HashMap<>();
		mapParam.put("page", page);
		mapParam.put("pageSize", pageSize);
	
		Map<String, Object> map = vacService.selectVacInfoPaging(mapParam);
		
		model.addAllAttributes(map);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("workStatus", onoffService.selectWorkStatus());
		model.addAttribute("emp_no", emp_no);
		model.addAttribute("emp_id", emp_id);

		
		return "tiles.admin.vacationlist";
	}
	
	@RequestMapping("pagingVacAjaxHtml")
	public String pagingVacAjaxHtml(@RequestParam(defaultValue="1") int page,
			   					  @RequestParam(defaultValue="15") int pageSize,
			   					  Model model, String data1, String data2, int emp_no, String emp_id, String date1, String date2) {
		
		logger.debug("pagingVacAjaxHtml() ====================================== \n");
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today1 = sdf.format(today);
		
		logger.debug("emp_no : {}", emp_no);
		
		String datas1 = "%%";
		String datas2 = "%%";
		
		String date11 = "";
		String date22 = "";
		
		if(date1 != null && date2 != null) {
			date11 = date1.replaceAll("-", "");
			date22 = date2.replaceAll("-", "");			
		}
	
		logger.debug("date11 : {}, data22 : {}", date11, date22);
		logger.debug("data1 : {}, data2 : {}", data1, data2);
		
		PageVo pageVo = new PageVo(page, pageSize);

		// 기본 페이징 맵 param
		Map<String, Object> mapParam = new HashMap<>();
		mapParam.put("page", page);
		mapParam.put("pageSize", pageSize);
			
			
		Map<String, Object> map = new HashMap<>();
			
		Map<String, Object> mapmap = new HashMap<>();
		mapmap.put("page", page);
		mapmap.put("pageSize", pageSize);
		mapmap.put("emp_no", emp_no);
			
		if(emp_no == 0) {
			map = vacService.selectVacInfoPaging(mapParam);
			model.addAllAttributes(map);				
		}else {
			map = vacService.selectDetVacInfoPaging(mapmap);
			model.addAllAttributes(map);
		}
		
		// 검색 페이징 맵 카운트
		Map<String, Object> map1 = new HashMap<>();
		map1.put("page", page);
		map1.put("pageSize", pageSize);
		
		if(data1 == null || data1.equals("")) {
			map1.put("data1", datas1);
		}else {
			map1.put("data1", "%" + data1 + "%");
		}
		
		if(data2 == null || data2.equals("")) {
			map1.put("data2", datas2);
		}else {
			map1.put("data2","%" + data2 + "%");			
		}
			
		// 날짜
		if(date1 == null || date1.equals("") && date2 == null || date2.equals("")) {
			map1.put("date1", "19700101");
			map1.put("date2", today1);
		}else {
			map1.put("date1", date11);
			map1.put("date2", date22);
		}
		
		Map<String, Object> searchMap = vacService.searchempVacPaging(map1);
		
		List<VacationVo> vacationList = (List<VacationVo>)searchMap.get("vaclist");
		
		model.addAttribute("vaclist", vacationList);
		
		int pagination = (int)searchMap.get("pagination");			
		model.addAttribute("pagination", pagination);
		model.addAttribute("pageVo", pageVo);
		
		model.addAttribute("data1", data1);
		model.addAttribute("data2", date2);
	
		return "ajax/pagingVacAjaxHtml";
	}

	// 연차 사용내역 jsp 이동
	@RequestMapping("goVacStatus")
	public String goVacStatus(@RequestParam(defaultValue="1") int page,
			   				  @RequestParam(defaultValue="15") int pageSize,
			   			int emp_no, String emp_id, Model model) {
		
		PageVo pageVo = new PageVo(page, pageSize);
		
		OnOffVo onVo = new OnOffVo(); 
		OnOffVo onVo1 = new OnOffVo(); 	
		
		int attendCnt = onoffService.checkAttendCnt(emp_no);
		
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
		
		Map<String, Object> mapParam = new HashMap<>();
		mapParam.put("page", page);
		mapParam.put("pageSize", pageSize);
		
		Map<String, Object> map = vacService.vacationStaPaging(mapParam);
		
		VacationVo vacVo = vacService.selectDetVacinfo(emp_no);
		
		model.addAttribute("vacVo", vacVo);
		model.addAllAttributes(map);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("workStatus", onoffService.selectWorkStatus());
		model.addAttribute("emp_no", emp_no);
		model.addAttribute("emp_id", emp_id);
		
		return "tiles.admin.vacationuselist";
	}
		
	@RequestMapping("vacStatusAjaxHtml")
	public String vacStatusAjaxHtml(@RequestParam(defaultValue="1") int page,
									@RequestParam(defaultValue="15") int pageSize,
									int emp_no, String emp_id, Model model, 
									String data1, String data2, String date1, String date2) {
		
		logger.debug("연차내역 ========================================= \n");
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today1 = sdf.format(today);
		
		logger.debug("emp_no : {}", emp_no);
		
		String datas1 = "%%";
		String datas2 = "%%";
		
		String date11 = "";
		String date22 = "";
		
		if(date1 != null && date2 != null) {
			date11 = date1.replaceAll("-", "");
			date22 = date2.replaceAll("-", "");			
		}
	
		logger.debug("date11 : {}, data22 : {}", date11, date22);
		logger.debug("data1 : {}, data2 : {}", data1, data2);
		
		PageVo pageVo = new PageVo(page, pageSize);

		// 기본 페이징 맵 
		Map<String, Object> mapParam = new HashMap<>();
		mapParam.put("page", page);
		mapParam.put("pageSize", pageSize);
		mapParam.put("emp_no", emp_no);
		
		// 기본 페이징 끝
		
		// 검색 페이징 맵 카운트
		Map<String, Object> map1 = new HashMap<>();
		map1.put("page", page);
		map1.put("pageSize", pageSize);
		map1.put("emp_no", emp_no);
					
		if (data1 == null || data1.equals("")) {
			map1.put("data1", datas1);
		} else {
			map1.put("data1", "%" + data1 + "%");
		}

		if (data2 == null || data2.equals("")) {
			map1.put("data2", datas2);
		} else {
			map1.put("data2", "%" + data2 + "%");
		}

		// 날짜
		if (date1 == null || date1.equals("") && date2 == null || date2.equals("")) {
			map1.put("date1", "19700101");
			map1.put("date2", "20991231");
			
		} else {
			map1.put("date1", date11);
			map1.put("date2", date22);
		}
		
		// 검색 상세 연차내역 맵
		Map<String, Object> mapmap = new HashMap<>();
		mapmap.put("page", page);
		mapmap.put("pageSize", pageSize);
		mapmap.put("emp_no", emp_no);
		
		// 날짜
		if (date1 == null || date1.equals("") && date2 == null || date2.equals("")) {
			mapmap.put("date1", "19700101");
			mapmap.put("date2", "20991231");		
		} else {
			mapmap.put("date1", date11);
			mapmap.put("date2", date22);
		}
		
		// 관리자용 , 사원용 검색 페이징
		if(emp_no == 0) {

			Map<String, Object> searchMap1 = vacService.searchVacStaPaging(map1);
			model.addAllAttributes(searchMap1);

		}else {

			Map<String, Object> searchMap3 = vacService.searchDetStaPaging(mapmap);
			model.addAllAttributes(searchMap3);
			
		}
		
		model.addAttribute("data1", data1);
		model.addAttribute("data2", date2);
		
		return "ajax/vacStatusAjaxHtml";
	}
	
	// 연차리스트에서 상세조회
	@RequestMapping("vacDetail")
	public String vacDetail(@RequestParam(defaultValue="1") int page,
						 	@RequestParam(defaultValue="15") int pageSize,
						 	Model model, int emp_no, String emp_id) {
		EmpVo empVo = empService.selectUser(emp_id);

		// 기본 페이징 맵 
		Map<String, Object> mapParam = new HashMap<>();
		mapParam.put("page", page);
		mapParam.put("pageSize", pageSize);
		mapParam.put("emp_no", emp_no);

		Map<String, Object> searchMap2 = vacService.vacationDetStaPaging(mapParam);
		model.addAllAttributes(searchMap2);
		model.addAttribute("empVo", empVo);

		return "admin/vacUseDetail";
	}
	
	@RequestMapping("vacDetailAjaxHtml")
	public String vacDetailAjaxHtml(@RequestParam(defaultValue="1") int page,
		 							@RequestParam(defaultValue="15") int pageSize,
		 							Model model, int emp_no, String date1, String date2) {
		
		String date11 = "";
		String date22 = "";
		
		if(date1 != null && date2 != null) {
			date11 = date1.replaceAll("-", "");
			date22 = date2.replaceAll("-", "");			
		}
		
		logger.debug("상제조회 아작스 =========================== \n");
		logger.debug("emp_no : {}", emp_no);
		logger.debug("data1 : {}, date2 : {}", date1, date2);
		
		// 기본 페이징 맵 
		Map<String, Object> mapParam = new HashMap<>();
		mapParam.put("page", page);
		mapParam.put("pageSize", pageSize);
		mapParam.put("emp_no", emp_no);
		
		// 검색 상세 연차내역 맵
		Map<String, Object> mapmap = new HashMap<>();
		mapmap.put("page", page);
		mapmap.put("pageSize", pageSize);
		mapmap.put("emp_no", emp_no);
				
		// 날짜
		if (date1 == null || date1.equals("") && date2 == null || date2.equals("")) {
			mapmap.put("date1", "19700101");
			mapmap.put("date2", "20991231");		
		} else {
			mapmap.put("date1", date11);
			mapmap.put("date2", date22);
		}
		
		Map<String, Object> searchMap3 = vacService.searchDetStaPaging(mapmap);
		model.addAllAttributes(searchMap3);
		
		return "ajax/vacDetailStatusAjaxHtml";
	}
	
	// 연차 리스트 엑셀 다운로드
	@RequestMapping("vaclistExcel")
	public void empVacation(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) 
			throws Exception, Exception {

		List<VacationVo> vacList = vacService.selectVacList();

		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put("AllvacList", vacList);

		EmpController me = new EmpController();

		me.download(request, response, beans, "AllvacList", "VacTemplate.xlsx", "");

	}
	
	// 연차 사용내역 엑셀 다운로드
	@RequestMapping("vacUsedlistExcel")
	public void vacUsedlistExcel(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) 
			throws Exception, Exception {
	
		List<VacationVo> vacUsedList = vacService.selectUsedVacList();

		// 받은 데이터를 맵에 담는다.
		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put("vacUsedList", vacUsedList);

		// 엑셀 다운로드 메소드가 담겨 있는 객체
		EmpController me = new EmpController();

		me.download(request, response, beans, "vacUsedList", "vacUsedTemplate.xlsx", "");

	}
	
	// 연차 사용내역 상세조회 엑셀 다운로드
	@RequestMapping("vacDetUsedlistExcel")
	public void vacDetUsedlistExcel(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap, int emp_no) 
			throws Exception, Exception {
		
		logger.debug("연차 사용내역 상세조회 엑셀 다운 ==== ");
		logger.debug("emp_no : {}", emp_no);
		
		List<VacationVo> vacDetUsedList = vacService.selectDetvacUsedList(emp_no);
	
		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put("vacDetUsedList", vacDetUsedList);

		// 엑셀 다운로드 메소드가 담겨 있는 객체
		EmpController me = new EmpController();

		me.download(request, response, beans, "vacDetUsedList", "vacDetUsedTemplate.xlsx", "");
	}

}





















