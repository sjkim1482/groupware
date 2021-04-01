package kr.or.ddit.groupware.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.approval.model.AppFileVo;
import kr.or.ddit.groupware.approval.model.AppLineVo;
import kr.or.ddit.groupware.approval.model.AppVo;
import kr.or.ddit.groupware.approval.model.PerAppLineInfoVo;
import kr.or.ddit.groupware.approval.model.PerAppLineVo;
import kr.or.ddit.groupware.approval.service.AppService;
import kr.or.ddit.groupware.contoller.EmpController;
import kr.or.ddit.groupware.model.AttFileVo;
import kr.or.ddit.groupware.model.EmpVo;
import kr.or.ddit.groupware.model.PmsEmpVo;
import kr.or.ddit.groupware.model.PmsVo;
import kr.or.ddit.groupware.model.ScdVo;
import kr.or.ddit.groupware.model.VacationVo;
import kr.or.ddit.groupware.service.AttFileService;
import kr.or.ddit.groupware.service.EmpService;
import kr.or.ddit.groupware.service.PmsService;
import kr.or.ddit.groupware.service.ScdService;
import kr.or.ddit.groupware.service.VacationService;
import kr.or.ddit.groupware.util.FileUtil;


@Controller
@RequestMapping("app")
public class AppController {
	
	private static final Logger logger = LoggerFactory.getLogger(AppController.class);
	
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
	
	@Resource(name="scdService")
	private ScdService scdService;
	
	@RequestMapping(path="appView", method = RequestMethod.GET)
	public String appView() {
		
		return "tiles.app.appView";
	}
	// 기안서 폼 가져오기
	@RequestMapping(path="registApp", method = RequestMethod.GET)
	public String registApp(EmpVo empVo, int app_div_no, int app_det_no, Model model) {
		
		
		
		Date date = new Date();
		
		model.addAttribute("empInfo", empService.detailUserAjax(empVo));
		model.addAttribute("today", date);
		model.addAttribute("app_det_no", app_det_no);
		model.addAttribute("app_div_no", app_div_no);
		if(app_det_no==2) {
			return "tiles.app.appALRegist";
		}else if(app_det_no==3) {
			return "tiles.app.appSRVRegist";
		}else if(app_det_no==4){
			return "tiles.app.appPmsRegist";
		}
		else {
			return "tiles.app.appRegist";			
		}
	}
	// 결재선 불러오기
	@RequestMapping(path="empInfoList", method = RequestMethod.GET)
	public String empInfo(Model model) {

	    model.addAttribute("deptList", empService.selectDept());
		logger.debug("deptVo : {}",empService.selectDept());
		model.addAttribute("organizationList", empService.selectOrganization());

		
		return "app/empInfoList";
	}
	
	//개인 결재선 만들기 창
	@RequestMapping(path="addAppLine", method = RequestMethod.GET)
	public String addAppLine(Model model) {
		
		model.addAttribute("deptList", empService.selectDept());
		logger.debug("deptVo : {}",empService.selectDept());
		model.addAttribute("organizationList", empService.selectOrganization());
	
		return "app/addAppLineList";
	}
	//개인 결재선 만들기
	@RequestMapping(path="addAppLine", method = RequestMethod.POST)
	public String addAppLine(PerAppLineInfoVo perAppLineInfoVo, Model model) {
		
		int appLineInfoCnt = appService.registPerAppLineInfo(perAppLineInfoVo);
		int cnt = 0;
		if(appLineInfoCnt == 1) {
			PerAppLineVo perAppLineVo = new PerAppLineVo();
			perAppLineVo.setPer_app_line_no(appService.selectMaxAppLineInfo());
			perAppLineVo.setEmp_no(perAppLineInfoVo.getEmp_no());
			for(int i = 0; i<perAppLineInfoVo.getEmpList().size(); i++) {
				perAppLineVo.setEmp_no(perAppLineInfoVo.getEmpList().get(i));
				perAppLineVo.setPer_app_step(i+1);
				cnt += appService.registPerAppLine(perAppLineVo);
			}
		}
		
		model.addAttribute("cnt", cnt);
		
		return "jsonView";
	}
	//개인 결재선 정보 불러오기
	@RequestMapping(path="selectAppLineInfo", method = RequestMethod.GET)
	public String selectAppLineInfo(int emp_no, Model model) {
		
		model.addAttribute("appLineInfoList", appService.selectAppLineInfo(emp_no));
		
		return "app/appLineInfo";
	}
	
	//개인 결재선 상제정보 불러오기
	@RequestMapping(path="selectAppLineInfoList", method = RequestMethod.GET)
	public String selectAppLineInfoList(int per_app_line_no, Model model) {
		
		List<Integer> appLineList = appService.selectAppLineListInfo(per_app_line_no);
		List<EmpVo> empList = new ArrayList<>();
		for(int i = 0; i<appLineList.size(); i++) {
			empList.add(empService.selectEmpDetail(appLineList.get(i)));
		}
		
		model.addAttribute("empList", empList);
 		
		return "app/perAppListAjax";
	}
	
	// PSM 참여인원 조직도 불러오기
	@RequestMapping(path="empInfoPMSList", method = RequestMethod.GET)
	public String empInfoPMSList(Model model) {

	    model.addAttribute("deptList", empService.selectDept());
		logger.debug("deptVo : {}",empService.selectDept());
		model.addAttribute("organizationList", empService.selectOrganization());

		return "app/empInfoPMSList";
	}
	// 문서등록
	@RequestMapping(path="registApp", method = RequestMethod.POST)
	public synchronized String registApp(AppVo appVo, RedirectAttributes ra , MultipartHttpServletRequest fileList) {
		List<MultipartFile> files = fileList.getFiles("fileName");
		
		appVo.setApp_sta_cd(306);
		int cnt = appService.appCnt();
		
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		
		String toYear = sdf.format(date);
		toYear += "-"+cnt;
		
		appVo.setApp_char(toYear);
		
		
		int insertCnt = 0;
		try {
			insertCnt = appService.registApp(appVo);
		} catch (Exception e) {
			insertCnt = 0;
			e.printStackTrace();
		}
		
		if(insertCnt == 1) {
			int empCnt = 1;
			AppLineVo appLineVo = new AppLineVo();
			appLineVo.setApp_char(toYear);
			appLineVo.setEmp_no(appVo.getEmp_no());
			appLineVo.setApp_cd(301);
			appLineVo.setBefo_app_cd(301);
			appLineVo.setApp_step(empCnt);
			appLineVo.setFin_app_cd(306);
			for(int i = 0; i<appVo.getAppLineList().size(); i++) {
				if(!"".equals(appVo.getAppLineList().get(i))){
					if(i==0) {
						appService.registAppLine(appLineVo);
					}else {
						int empNo = Integer.parseInt(appVo.getAppLineList().get(i));
						appLineVo.setEmp_no(empNo);
						appLineVo.setApp_cd(302);
						if(i == 1) {
							appLineVo.setBefo_app_cd(301);
						}else {
							appLineVo.setBefo_app_cd(302);
						}
						appLineVo.setApp_step(empCnt);
						appService.registAppLine(appLineVo);
					}
					empCnt++;
				}
			}
			String filename = "";
			//파일등록
			AttFileVo attFileVo = new AttFileVo();
			AppFileVo appFileVo = new AppFileVo();
			appFileVo.setApp_char(toYear);
			int fileNo = 0;
			if(files!=null) {
				for(MultipartFile file : files) {
					if(!("".equals(file.getOriginalFilename()))) {
						try {
							String uploadPath = "d:" + File.separator + "uploadFile/";
							
							File uploadDir = new File(uploadPath);
							
							if(!uploadDir.exists()) {
								uploadDir.mkdirs();
							}
							String fileExtension = FileUtil.getFileExtension(file.getOriginalFilename());
							String realfilename = uploadPath + UUID.randomUUID().toString()+fileExtension;
							filename = file.getOriginalFilename();
							
							file.transferTo(new File(realfilename));
							
							attFileVo.setFile_nm(filename);
							attFileVo.setFile_route(realfilename);
							attFileVo.setFile_size((int)file.getSize());
							attFileService.registFile(attFileVo);
							fileNo = attFileService.maxFileNo();
							appFileVo.setFile_no(fileNo);
							appService.registAppFile(appFileVo);
							
						} catch (IllegalStateException | IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
			//파일등록끝
			
		}
		ra.addAttribute("app_char", toYear);
		return "redirect:/app/appDetailView";
	}
	
	// 프로젝트기안등록
	@RequestMapping(path="registPmsApp", method = RequestMethod.POST)
	public synchronized String registPmsApp(AppVo appVo, RedirectAttributes ra , MultipartHttpServletRequest fileList) {
		List<MultipartFile> files = fileList.getFiles("fileName");
		
		appVo.setApp_sta_cd(306);
		int cnt = appService.appCnt();
		
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		
		String toYear = sdf.format(date);
		toYear += "-"+cnt;
		
		appVo.setApp_char(toYear);
		
		
		int insertCnt = 0;
		try {
			insertCnt = appService.registProjectApp(appVo);
		} catch (Exception e) {
			insertCnt = 0;
			e.printStackTrace();
		}
		int empNo = 0;
		if(insertCnt == 1) {
			int empCnt = 1;
			AppLineVo appLineVo = new AppLineVo();
			appLineVo.setApp_char(toYear);
			appLineVo.setEmp_no(appVo.getEmp_no());
			appLineVo.setApp_cd(301);
			appLineVo.setBefo_app_cd(301);
			appLineVo.setApp_step(empCnt);
			appLineVo.setFin_app_cd(306);
			for(int i = 0; i<appVo.getAppLineList().size(); i++) {
				if(!"".equals(appVo.getAppLineList().get(i))){
					if(i==0) {
						appService.registAppLine(appLineVo);
					}else {
						empNo = Integer.parseInt(appVo.getAppLineList().get(i));
						appLineVo.setEmp_no(empNo);
						appLineVo.setApp_cd(302);
						if(i == 1) {
							appLineVo.setBefo_app_cd(301);
						}else {
							appLineVo.setBefo_app_cd(302);
						}
						appLineVo.setApp_step(empCnt);
						appService.registAppLine(appLineVo);
					}
					empCnt++;
				}
			}
			//PSM 등록
			PmsVo pmsVo = new PmsVo();
			pmsVo.setApp_char(toYear);
			pmsVo.setEmp_no(appVo.getEmp_no());
			pmsVo.setApp_emp_no(empNo);
			pmsVo.setPms_nm(appVo.getTitle());
			pmsVo.setCont(appVo.getCont());
			pmsVo.setS_dt(appVo.getS_dt());
			pmsVo.setE_dt(appVo.getE_dt());
			pmsVo.setSta_cd(503);
			int pmsInsertCnt = pmsService.registPsm(pmsVo);
			if(pmsInsertCnt==1) {
				//PSM 참여자 등록
				int pms_no = pmsService.selectPmsMaxNo();
				PmsEmpVo pmsEmpVo = new PmsEmpVo();
				pmsEmpVo.setPms_no(pms_no);
				for(int i = 0; i<appVo.getPmsEmpList().size(); i++) {
					pmsEmpVo.setAttend_emp_no(appVo.getPmsEmpList().get(i));
					pmsService.registPsmEmp(pmsEmpVo);
				}
			}
			
			// 첨부파일 등록
			String filename = "";
			AttFileVo attFileVo = new AttFileVo();
			AppFileVo appFileVo = new AppFileVo();
			appFileVo.setApp_char(toYear);
			int fileNo = 0;
			if(files!=null) {
				for(MultipartFile file : files) {
					if(!("".equals(file.getOriginalFilename()))) {
						try {
							String uploadPath = "d:" + File.separator + "uploadFile/";
							
							File uploadDir = new File(uploadPath);
							
							if(!uploadDir.exists()) {
								uploadDir.mkdirs();
							}
							String fileExtension = FileUtil.getFileExtension(file.getOriginalFilename());
							String realfilename = uploadPath + UUID.randomUUID().toString()+fileExtension;
							filename = file.getOriginalFilename();
							
							file.transferTo(new File(realfilename));
							
							attFileVo.setFile_nm(filename);
							attFileVo.setFile_route(realfilename);
							attFileVo.setFile_size((int)file.getSize());
							attFileService.registFile(attFileVo);
							fileNo = attFileService.maxFileNo();
							appFileVo.setFile_no(fileNo);
							appService.registAppFile(appFileVo);
							
							
						} catch (IllegalStateException | IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
			
		}
		ra.addAttribute("app_char", toYear);
		return "redirect:/app/appDetailView";
	}
	
	// 휴가계문서등록
	@RequestMapping(path="registALApp", method = RequestMethod.POST)
	public synchronized String registALApp(AppVo appVo, RedirectAttributes ra , MultipartHttpServletRequest fileList) {
		List<MultipartFile> files = fileList.getFiles("fileName");
		
		appVo.setApp_sta_cd(306);
		int cnt = appService.appCnt();
		
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		
		String toYear = sdf.format(date);
		toYear += "-"+cnt;
		
		appVo.setApp_char(toYear);
		
		
		int insertCnt = 0;
		try {
			insertCnt = appService.registALApp(appVo);
		} catch (Exception e) {
			insertCnt = 0;
			e.printStackTrace();
		}
		
		if(insertCnt == 1) {
			int empCnt = 1;
			AppLineVo appLineVo = new AppLineVo();
			appLineVo.setApp_char(toYear);
			appLineVo.setEmp_no(appVo.getEmp_no());
			appLineVo.setApp_cd(301);
			appLineVo.setBefo_app_cd(301);
			appLineVo.setApp_step(empCnt);
			appLineVo.setFin_app_cd(306);
			for(int i = 0; i<appVo.getAppLineList().size(); i++) {
				if(!"".equals(appVo.getAppLineList().get(i))){
					if(i==0) {
						appService.registAppLine(appLineVo);
					}else {
						int empNo = Integer.parseInt(appVo.getAppLineList().get(i));
						appLineVo.setEmp_no(empNo);
						appLineVo.setApp_cd(302);
						if(i == 1) {
							appLineVo.setBefo_app_cd(301);
						}else {
							appLineVo.setBefo_app_cd(302);
						}
						appLineVo.setApp_step(empCnt);
						appService.registAppLine(appLineVo);
					}
					empCnt++;
				}
			}
			String filename = "";
			AttFileVo attFileVo = new AttFileVo();
			AppFileVo appFileVo = new AppFileVo();
			appFileVo.setApp_char(toYear);
			int fileNo = 0;
			if(files!=null) {
				for(MultipartFile file : files) {
					if(!("".equals(file.getOriginalFilename()))) {
						try {
							String uploadPath = "d:" + File.separator + "uploadFile/";
							
							File uploadDir = new File(uploadPath);
							
							if(!uploadDir.exists()) {
								uploadDir.mkdirs();
							}
							String fileExtension = FileUtil.getFileExtension(file.getOriginalFilename());
							String realfilename = uploadPath + UUID.randomUUID().toString()+fileExtension;
							filename = file.getOriginalFilename();
							
							file.transferTo(new File(realfilename));
							
							attFileVo.setFile_nm(filename);
							attFileVo.setFile_route(realfilename);
							attFileVo.setFile_size((int)file.getSize());
							attFileService.registFile(attFileVo);
							fileNo = attFileService.maxFileNo();
							appFileVo.setFile_no(fileNo);
							appService.registAppFile(appFileVo);
							
						} catch (IllegalStateException | IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
			
		}
		ra.addAttribute("app_char", toYear);
		return "redirect:/app/appDetailView";
	}
	
	
	
	// 임시저장문서 등록
	@RequestMapping(path="registTempApp", method = RequestMethod.POST)
	public String registTempApp(AppVo appVo, RedirectAttributes ra) {
		
		appVo.setApp_sta_cd(306);
		
		int insertCnt = 0;
		try {
			insertCnt = appService.registTempApp(appVo);
		} catch (Exception e) {
			insertCnt = 0;
			e.printStackTrace();
		}
		
		if(insertCnt == 1) {
			int empCnt = 1;
			AppLineVo appLineVo = new AppLineVo();
			appLineVo.setApp_char(appVo.getApp_char());
			appLineVo.setEmp_no(appVo.getEmp_no());
			appLineVo.setApp_cd(301);
			appLineVo.setBefo_app_cd(301);
			appLineVo.setApp_step(empCnt);
			appLineVo.setFin_app_cd(306);
			for(int i = 0; i<appVo.getAppLineList().size(); i++) {
				if(!"".equals(appVo.getAppLineList().get(i))){
					if(i==0) {
						appService.registAppLine(appLineVo);
					}else {
						int empNo = Integer.parseInt(appVo.getAppLineList().get(i));
						appLineVo.setEmp_no(empNo);
						appLineVo.setApp_cd(302);
						if(i == 1) {
							appLineVo.setBefo_app_cd(301);
						}else {
							appLineVo.setBefo_app_cd(302);
						}
						appLineVo.setApp_step(empCnt);
						appService.registAppLine(appLineVo);
					}
					empCnt++;
				}
			}
		}
		ra.addAttribute("app_char", appVo.getApp_char());
		return "redirect:/app/appDetailView";
	}
	
	// 반려 재상신
	@RequestMapping(path="registReApp", method = RequestMethod.POST)
	public String registReApp(AppVo appVo, RedirectAttributes ra, MultipartHttpServletRequest fileList) {
		List<MultipartFile> files = fileList.getFiles("fileName");
		appVo.setApp_sta_cd(306);
		
		int insertCnt = 0;
		try {
			insertCnt = appService.registTempApp(appVo);
		} catch (Exception e) {
			insertCnt = 0;
			e.printStackTrace();
		}
		
		if(insertCnt == 1) {
			int empCnt = 1;
			AppLineVo appLineVo = new AppLineVo();
			appLineVo.setApp_char(appVo.getApp_char());
			appLineVo.setEmp_no(appVo.getEmp_no());
			appLineVo.setApp_cd(301);
			appLineVo.setBefo_app_cd(301);
			appLineVo.setApp_step(empCnt);
			appLineVo.setFin_app_cd(306);
			for(int i = 0; i<appVo.getAppLineList().size(); i++) {
				if(!"".equals(appVo.getAppLineList().get(i))){
					if(i==0) {
						appService.updateAppLine(appLineVo);
					}else {
						int empNo = Integer.parseInt(appVo.getAppLineList().get(i));
						appLineVo.setEmp_no(empNo);
						appLineVo.setApp_cd(302);
						if(i == 1) {
							appLineVo.setBefo_app_cd(301);
						}else {
							appLineVo.setBefo_app_cd(302);
						}
						appLineVo.setApp_step(empCnt);
						appService.updateAppLine(appLineVo);
					}
					empCnt++;
				}
			}
			String filename = "";
			AttFileVo attFileVo = new AttFileVo();
			AppFileVo appFileVo = new AppFileVo();
			appFileVo.setApp_char(appVo.getApp_char());
			int fileNo = 0;
			if(files!=null) {
				for(MultipartFile file : files) {
					if(!("".equals(file.getOriginalFilename()))) {
						try {
							String uploadPath = "d:" + File.separator + "uploadFile";
							
							File uploadDir = new File(uploadPath);
							
							if(!uploadDir.exists()) {
								uploadDir.mkdirs();
							}
							String fileExtension = FileUtil.getFileExtension(file.getOriginalFilename());
							String realfilename = uploadPath + UUID.randomUUID().toString()+fileExtension;
							filename = file.getOriginalFilename();
							
							file.transferTo(new File(realfilename));
							
							attFileVo.setFile_nm(filename);
							attFileVo.setFile_route(realfilename);
							attFileVo.setFile_size((int)file.getSize());
							attFileService.registFile(attFileVo);
							fileNo = attFileService.maxFileNo();
							appFileVo.setFile_no(fileNo);
							appService.registAppFile(appFileVo);
							
						} catch (IllegalStateException | IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
		}
		ra.addAttribute("app_char", appVo.getApp_char());
		return "redirect:/app/appDetailView";
	}
	
	// 임시저장
	@RequestMapping(path="tempApp", method = RequestMethod.POST)
	public String tempApp(AppVo appVo) {
		appVo.setApp_sta_cd(307);
		int cnt = appService.appCnt();
		
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		
		String toYear = sdf.format(date);
		toYear += "-"+cnt;
		
		appVo.setApp_char(toYear);
		
		
		int insertCnt = 0;
		try {
			insertCnt = appService.registApp(appVo);
		} catch (Exception e) {
			insertCnt = 0;
			e.printStackTrace();
		}
		
		return "redirect:/app/appView";
	}
	
	//임시저장에 임시저장
	@RequestMapping(path="tempSaveApp", method = RequestMethod.POST)
	public String tempSaveApp(AppVo appVo) {
		appVo.setApp_sta_cd(307);
		
		
		
		int insertCnt = 0;
		try {
			insertCnt = appService.registTempApp(appVo);
		} catch (Exception e) {
			insertCnt = 0;
			e.printStackTrace();
		}
		
		return "redirect:/app/appView";
	}
	
	//임시저장 삭제
	@RequestMapping(path="deleteApp", method = RequestMethod.POST)
	public String deleteApp(String app_char) {

		appService.deleteApp(app_char);
		
		
		
		return "redirect:/app/appView";
	}
	
	
	@RequestMapping(path="pagingAppWaitAjax", method = RequestMethod.GET)
	public String pagingAppWaitAjax(PageVo pageVo, Model model) {
		
		model.addAllAttributes(appService.appWaitingList(pageVo));
		
		
		return "app/pagingAppAjaxHtml";
	}

	@RequestMapping(path="pagingAppProAjax", method = RequestMethod.GET)
	public String pagingAppProAjax(PageVo pageVo, Model model) {
		
		model.addAllAttributes(appService.pagingAppProList(pageVo));
		
		
		return "app/pagingAppProAjaxHtml";
	}	
	
	@RequestMapping(path="pagingAppCompleAjax", method = RequestMethod.GET)
	public String pagingAppCompleAjax(PageVo pageVo, Model model) {
		
		model.addAllAttributes(appService.pagingAppCompleList(pageVo));
		
		
		return "app/pagingAppCompleAjaxHtml";
	}	
	
	
	@RequestMapping(path="pagingAppTempAjax", method = RequestMethod.GET)
	public String pagingAppTempAjax(PageVo pageVo, Model model) {
		
		model.addAllAttributes(appService.pagingAppTempList(pageVo));
		
		
		return "app/pagingAppTempAjax";
	}
	
	// 기안서 결재 상세정보
	@RequestMapping(path="appDetail", method = RequestMethod.GET)
	public String appDetail(String app_char, Model model) {
		
		AppVo appVo = appService.appDetail(app_char);
		
		appVo.setCont(appService.appCont(app_char));
		
		List<Integer> appFileList = appService.appFileList(app_char);
		
		List<AttFileVo> attFileList = new ArrayList<AttFileVo>();
		if(appFileList!=null) {
			for(int i = 0; i<appFileList.size(); i++){
				attFileList.add(attFileService.selectFile(appFileList.get(i)));
			}
		}
		if(appVo.getApp_det_no()==4) {
			int pms_no = pmsService.selectPmsNo(app_char);
			List<Integer> empNoList = pmsService.selectPsmEmpList(pms_no);
			List<EmpVo> empList = new ArrayList<EmpVo>();
			for(int i = 0; i<empNoList.size(); i++) {
				empList.add(empService.selectEmpDetail(empNoList.get(i)));
			}
			model.addAttribute("psmEmpList", empList);
		}
		
		model.addAttribute("appDetail", appVo);
		model.addAttribute("appDetailLine", appService.appDetailLine(app_char));
		model.addAttribute("attFileList", attFileList);
		
		
		
		return "tiles.app.appDetail";
	}
	
	// 기안서 상세정보
	@RequestMapping(path="appDetailView", method = RequestMethod.GET)
	public String appDetailView(String app_char, Model model) {
		
		AppVo appVo = appService.appDetail(app_char);
		
		appVo.setCont(appService.appCont(app_char));
		
		
		
		List<Integer> appFileList = appService.appFileList(app_char);
		
		List<AttFileVo> attFileList = new ArrayList<AttFileVo>();
		if(appFileList!=null) {
			for(int i = 0; i<appFileList.size(); i++){
				attFileList.add(attFileService.selectFile(appFileList.get(i)));
			}
		}
		if(appVo.getApp_det_no()==4) {
			int pms_no = pmsService.selectPmsNo(app_char);
			List<Integer> empNoList = pmsService.selectPsmEmpList(pms_no);
			List<EmpVo> empList = new ArrayList<EmpVo>();
			for(int i = 0; i<empNoList.size(); i++) {
				empList.add(empService.selectEmpDetail(empNoList.get(i)));
			}
			model.addAttribute("psmEmpList", empList);
		}
		
		
		model.addAttribute("appDetail", appVo);
		model.addAttribute("appDetailLine", appService.appDetailLine(app_char));
		model.addAttribute("attFileList", attFileList);
		
		
		return "tiles.app.appDetailView";
	}	
	// 완료된 기안서상세정보
	@RequestMapping(path="appDetailCompleView", method = RequestMethod.GET)
	public String appDetailCompleView(String app_char, Model model) {
		
		AppVo appVo = appService.appDetail(app_char);
		
		appVo.setCont(appService.appCont(app_char));
		
		appVo.setTurn_rea(appService.appTurnRea(app_char));
		int turnReaCheck = 0;
		
		if(appVo.getTurn_rea()!=null) {
			turnReaCheck = 1;
		}
		
		List<Integer> appFileList = appService.appFileList(app_char);
		
		List<AttFileVo> attFileList = new ArrayList<AttFileVo>();
		if(appFileList!=null) {
			for(int i = 0; i<appFileList.size(); i++){
				attFileList.add(attFileService.selectFile(appFileList.get(i)));
			}
		}
		
		if(appVo.getApp_det_no()==4) {
			int pms_no = pmsService.selectPmsNo(app_char);
			List<Integer> empNoList = pmsService.selectPsmEmpList(pms_no);
			List<EmpVo> empList = new ArrayList<EmpVo>();
			for(int i = 0; i<empNoList.size(); i++) {
				empList.add(empService.selectEmpDetail(empNoList.get(i)));
			}
			model.addAttribute("psmEmpList", empList);
		}
		model.addAttribute("turnReaCheck", turnReaCheck);
		model.addAttribute("appDetail", appVo);
		model.addAttribute("appDetailLine", appService.appDetailLine(app_char));
		model.addAttribute("attFileList", attFileList);
		
		
		return "tiles.app.appDetailCompleView";
	}
	
	//기안서 임시저장 상세정보
	@RequestMapping(path="appDetailTempView", method = RequestMethod.GET)
	public String appDetailTempView(String app_char, Model model) {
		
		logger.debug("app_char : {}",app_char);
		
		Date date = new Date();
		
		
		AppVo appVo = appService.appTempDetail(app_char);
		
		logger.debug("appVo : {}",appVo);
		
		appVo.setCont(appService.appCont(app_char));
		
		model.addAttribute("appDetail", appVo);
		
		EmpVo empVo = new EmpVo();
		empVo.setEmp_no(appVo.getEmp_no());
		
		model.addAttribute("empInfo", empService.detailUserAjax(empVo));
		model.addAttribute("today", date);
		
		return "tiles.app.appDetailTempView";
	}
	
	// 반려기안서 재상신 폼
	@RequestMapping(path="appRewrite", method = RequestMethod.GET)
	public String appRewrite(String app_char, Model model) {
		
		logger.debug("app_char : {}",app_char);
		
		Date date = new Date();
		
		
		AppVo appVo = appService.appDetail(app_char);
		
		logger.debug("appVo : {}",appVo);
		
		appVo.setCont(appService.appCont(app_char));
		
		

		
		List<Integer> appFileList = appService.appFileList(app_char);
		
		List<AttFileVo> attFileList = new ArrayList<AttFileVo>();
		if(appFileList!=null) {
			for(int i = 0; i<appFileList.size(); i++){
				attFileList.add(attFileService.selectFile(appFileList.get(i)));
			}
		}
		if(appVo.getApp_det_no()==4) {
			int pms_no = pmsService.selectPmsNo(app_char);
			List<Integer> empNoList = pmsService.selectPsmEmpList(pms_no);
			List<EmpVo> empList = new ArrayList<EmpVo>();
			for(int i = 0; i<empNoList.size(); i++) {
				empList.add(empService.selectEmpDetail(empNoList.get(i)));
			}
			model.addAttribute("psmEmpList", empList);
		}
		
		logger.debug("반려 재 기안 appVo : {}",appVo);
		model.addAttribute("appDetail", appVo);
		model.addAttribute("appDetailLine", appService.appDetailLine(app_char));
		model.addAttribute("attFileList", attFileList);
		
		return "tiles.app.appRewrite";
	}
	
	
	// 결재승인
	@RequestMapping(path="ackApp", method = RequestMethod.POST)
	public synchronized String ackApp(AppLineVo appLineVo, Model model, RedirectAttributes ra) {
		
		AppVo appVo = appService.appDetail(appLineVo.getApp_char());
		
		int myStep = appService.checkMyAppStep(appLineVo);
		
		int appStep = appService.checkAppStep(appLineVo);
		
		
		if(myStep < appStep) {
			appService.ackApp(appLineVo);
			appLineVo.setApp_step(myStep+1);
			appService.beforeAckApp(appLineVo);
		}else {
			if(appVo.getApp_det_no()==2) {
				appService.finalAckApp(appLineVo);
				appLineVo.setApp_sta_cd(301);
				appService.completeApp(appLineVo);
				VacationVo vacationVo = new VacationVo();
				vacationVo.setS_dt(appVo.getS_dt());
				vacationVo.setE_dt(appVo.getE_dt());
				vacationVo.setEmp_no(appVo.getEmp_no());
				vacationVo.setVac_cd(200);
				int vacCnt = vacationService.registVacation(vacationVo);
				if(vacCnt==1) {
					int vac_no = vacationService.vacationMaxNo();
					vacationVo.setVac_no(vac_no);
					logger.debug("vacationVo : {}",vacationVo);
					int vacationTime = vacationService.vacationTime(vacationVo);
					logger.debug("vacationTime : {}",vacationTime);
					vacationVo.setVacationday(vacationTime+1);
					vacationService.subVacCnt(vacationVo);
				}
			}else if(appVo.getApp_det_no()==3) {
				appService.finalAckApp(appLineVo);
				appLineVo.setApp_sta_cd(301);
				appService.completeApp(appLineVo);
				VacationVo vacationVo = new VacationVo();
				vacationVo.setS_dt(appVo.getS_dt());
				vacationVo.setE_dt(appVo.getE_dt());
				vacationVo.setEmp_no(appVo.getEmp_no());
				vacationVo.setVac_cd(201);
				int vacCnt = vacationService.registVacation(vacationVo);
				if(vacCnt==1) {
					int vac_no = vacationService.vacationMaxNo();
					vacationVo.setVac_no(vac_no);
					logger.debug("vacationVo : {}",vacationVo);
		
					vacationService.subVacSrvCnt(vacationVo);
				}
			}else if(appVo.getApp_det_no()==4) {
				appService.finalAckApp(appLineVo);
				appLineVo.setApp_sta_cd(301);
				appService.completeApp(appLineVo);
				pmsService.approvePms(appVo.getApp_char());
				
				int pms_no = pmsService.selectPmsNo(appVo.getApp_char());
				
				AppVo pmsAppVo = appService.appDetail(appVo.getApp_char());
				String pmsAppCont = appService.appCont(appVo.getApp_char());
				ScdVo scdVo = new ScdVo();
				scdVo.setScd_div_no(3);
				scdVo.setS_dt(pmsAppVo.getS_dt());
				scdVo.setE_dt(pmsAppVo.getE_dt());
				scdVo.setPlc("사내");
				scdVo.setTitle(pmsAppVo.getTitle());
				scdVo.setCont(pmsAppCont);
				scdVo.setPms_no(pms_no);
				scdVo.setSta_cd(404);
				
				List<Integer> pmsEmpList = pmsService.selectPsmEmpList(pms_no);
				
				for(int i = 0; i<pmsEmpList.size(); i++) {
					scdVo.setEmp_no(pmsEmpList.get(i));
					scdService.registPmsCalendar(scdVo);
				}
				
			}else {
				appService.finalAckApp(appLineVo);
				appLineVo.setApp_sta_cd(301);
				appService.completeApp(appLineVo);
			}
		}
		
		ra.addAttribute("app_char", appLineVo.getApp_char());
		return "redirect:/app/appDetailView";
	}
	// 결재 반려
	@RequestMapping(path="comApp", method = RequestMethod.POST)
	public String comApp(AppLineVo appLineVo, Model model, RedirectAttributes ra) {
		
		int appStep = appService.checkAppStep(appLineVo);

		appService.comApp(appLineVo);
		appService.finalComApp(appLineVo);
		appLineVo.setApp_sta_cd(303);
		appService.completeApp(appLineVo);
		
		
		ra.addAttribute("app_char", appLineVo.getApp_char());
		return "redirect:/app/appDetailView";
	}
	// 결재 전결
	@RequestMapping(path="preApp", method = RequestMethod.POST)
	public String preApp(AppLineVo appLineVo, Model model, RedirectAttributes ra) {
		
		int myStep = appService.checkMyAppStep(appLineVo);
		int appStep = appService.checkAppStep(appLineVo);
		AppVo appVo = appService.appDetail(appLineVo.getApp_char());
		appService.preApp(appLineVo);
		
		
		for(int i = myStep+1; i<=appStep; i++) {
			appLineVo.setApp_step(i);
			appService.beforePreLineApp(appLineVo);
		}
		
		appService.finalPreApp(appLineVo);
		appLineVo.setApp_sta_cd(301);
		appService.completeApp(appLineVo);
		
		if(appVo.getApp_det_no()==2) {
			VacationVo vacationVo = new VacationVo();
			vacationVo.setS_dt(appVo.getS_dt());
			vacationVo.setE_dt(appVo.getE_dt());
			vacationVo.setEmp_no(appVo.getEmp_no());
			vacationVo.setVac_cd(200);
			int vacCnt = vacationService.registVacation(vacationVo);
			if(vacCnt==1) {
				
				int vac_no = vacationService.vacationMaxNo();
				vacationVo.setVac_no(vac_no);
				logger.debug("vacationVo : {}",vacationVo);
				int vacationTime = vacationService.vacationTime(vacationVo);
				logger.debug("vacationTime : {}",vacationTime);
				vacationVo.setVacationday(vacationTime+1);
				vacationService.subVacCnt(vacationVo);
			}
		}else if(appVo.getApp_det_no()==3) {
			appService.finalAckApp(appLineVo);
			appLineVo.setApp_sta_cd(301);
			appService.completeApp(appLineVo);
			VacationVo vacationVo = new VacationVo();
			vacationVo.setS_dt(appVo.getS_dt());
			vacationVo.setE_dt(appVo.getE_dt());
			vacationVo.setEmp_no(appVo.getEmp_no());
			vacationVo.setVac_cd(201);
			int vacCnt = vacationService.registVacation(vacationVo);
			if(vacCnt==1) {
				int vac_no = vacationService.vacationMaxNo();
				vacationVo.setVac_no(vac_no);
				logger.debug("vacationVo : {}",vacationVo);
	
				vacationService.subVacSrvCnt(vacationVo);
			}
		}else if(appVo.getApp_det_no()==4) {
			pmsService.approvePms(appVo.getApp_char());
		}
		
		ra.addAttribute("app_char", appLineVo.getApp_char());
		return "redirect:/app/appDetailView";
	}
	
	// 문서 첨부파일 삭재
	
	@RequestMapping(path="deleteAppFile", method = RequestMethod.POST)
	public String deleteAppFile(int file_no, Model model) {
		
		int deleteCnt = appService.deleteAppFile(file_no);
		
		model.addAttribute("cnt", deleteCnt);
		
		return "jsonView";
	}
	
	
	
}
