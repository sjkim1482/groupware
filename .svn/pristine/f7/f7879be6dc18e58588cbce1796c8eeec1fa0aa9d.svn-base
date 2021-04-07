package kr.or.ddit.groupware.contoller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.approval.controller.AppController;
import kr.or.ddit.groupware.approval.model.AppFileVo;
import kr.or.ddit.groupware.model.AttFileVo;
import kr.or.ddit.groupware.model.MsgBoxVo;
import kr.or.ddit.groupware.model.MsgFileVo;
import kr.or.ddit.groupware.model.MsgVo;
import kr.or.ddit.groupware.service.AttFileService;
import kr.or.ddit.groupware.service.EmpService;
import kr.or.ddit.groupware.service.MsgService;
import kr.or.ddit.groupware.util.FileUtil;


@RequestMapping("msg")
@Controller
public class MsgController {
	
	private static final Logger logger = LoggerFactory.getLogger(MsgController.class);
	
	@Resource(name="msgService")
	private MsgService msgService;
	
	@Resource(name="empService")
	private EmpService empService;
	
	@Resource(name="attFileService")
	private AttFileService attFileService;
	
	@RequestMapping(path="msgMain", method = RequestMethod.GET)
	public String msgMain(int emp_no, Model model) {
		
		//model.addAttribute("noReadMsgCnt", msgService.noReadMsgCnt(emp_no));
		
		return "tiles.msg.msgMain";
	}
	// 사이드바 불러오기
	@RequestMapping(path="msgSideAjaxHtml", method = RequestMethod.GET)
	public String msgSideAjaxHtml(int emp_no, Model model) {
		PageVo vo = new PageVo();
		vo.setEmp_no(emp_no);
		model.addAttribute("noReadMsgCnt", msgService.noReadMsgCnt(emp_no));
		model.addAttribute("tempMsgCnt", msgService.tempMsgCnt(vo));
		model.addAttribute("msgBoxList", msgService.msgBoxList(emp_no));
		return "msg/msgSideAjaxHtml";
	}
	// 쪽지 작성창
	@RequestMapping(path="sentMsg", method = RequestMethod.GET)
	public String sentMsg() {
		
		return "msg/sentMsg";
	}
	// 쪽지 전송
	@RequestMapping(path="sentMsg", method = RequestMethod.POST)
	public synchronized String sentMsg(MsgVo msgVo, RedirectAttributes ra , MultipartHttpServletRequest fileList) {
		List<MultipartFile> files = fileList.getFiles("fileName");
		
		
		msgVo.setMsg_sta_cd(702);
		int insertCnt =  0;
		for(int i = 0; i<msgVo.getMsgEmpList().size(); i++) {
			msgVo.setRc_emp_no(msgVo.getMsgEmpList().get(i));
			insertCnt = msgService.sentMsg(msgVo);
			if(insertCnt==1) {
				String filename = "";
				AttFileVo attFileVo = new AttFileVo();
				MsgFileVo msgFileVo = new MsgFileVo();
				msgFileVo.setMsg_no(msgService.maxMsgNo());
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
								msgFileVo.setFile_no(fileNo);
								msgService.registMsgFile(msgFileVo);
								
							} catch (IllegalStateException | IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}
				}
				
			}
		}
		
		
		ra.addAttribute("emp_no", msgVo.getSd_emp_no());
		return "redirect:/msg/msgMain";
	}
	
	// 임시저장 쪽지 전송
	@RequestMapping(path="registTempMsg", method = RequestMethod.POST)
	public synchronized String registTempMsg(MsgVo msgVo, RedirectAttributes ra , MultipartHttpServletRequest fileList) {
		List<MultipartFile> files = fileList.getFiles("fileName");
		
		msgService.deleteTempMsg(msgVo);
		
		msgVo.setMsg_sta_cd(702);
		int insertCnt =  0;
		for(int i = 0; i<msgVo.getMsgEmpList().size(); i++) {
			msgVo.setRc_emp_no(msgVo.getMsgEmpList().get(i));
			insertCnt = msgService.sentMsg(msgVo);
			if(insertCnt==1) {
				String filename = "";
				AttFileVo attFileVo = new AttFileVo();
				MsgFileVo msgFileVo = new MsgFileVo();
				msgFileVo.setMsg_no(msgService.maxMsgNo());
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
								msgFileVo.setFile_no(fileNo);
								msgService.registMsgFile(msgFileVo);
								
							} catch (IllegalStateException | IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}
				}
				
			}
		}
		
		
		ra.addAttribute("emp_no", msgVo.getSd_emp_no());
		return "redirect:/msg/msgMain";
	}
	
	// 쪽지 임시저장
	@RequestMapping(path="tempMsg", method = RequestMethod.POST)
	public synchronized String tempMsg(MsgVo msgVo, RedirectAttributes ra , MultipartHttpServletRequest fileList) {
		List<MultipartFile> files = fileList.getFiles("fileName");
		
		msgVo.setMsg_sta_cd(704);
		int insertCnt =  0;
		
		insertCnt = msgService.tempMsg(msgVo);
//		if(insertCnt==1) {
//			String filename = "";
//			AttFileVo attFileVo = new AttFileVo();
//			MsgFileVo msgFileVo = new MsgFileVo();
//			msgFileVo.setMsg_no(msgService.maxMsgNo());
//			int fileNo = 0;
//			if(files!=null) {
//				for(MultipartFile file : files) {
//					if(!("".equals(file.getOriginalFilename()))) {
//						try {
//							String uploadPath = "d:" + File.separator + "uploadFile/";
//							
//							File uploadDir = new File(uploadPath);
//							
//							if(!uploadDir.exists()) {
//								uploadDir.mkdirs();
//							}
//							String fileExtension = FileUtil.getFileExtension(file.getOriginalFilename());
//							String realfilename = uploadPath + UUID.randomUUID().toString()+fileExtension;
//							filename = file.getOriginalFilename();
//							
//							file.transferTo(new File(realfilename));
//							
//							attFileVo.setFile_nm(filename);
//							attFileVo.setFile_route(realfilename);
//							attFileVo.setFile_size((int)file.getSize());
//							attFileService.registFile(attFileVo);
//							fileNo = attFileService.maxFileNo();
//							msgFileVo.setFile_no(fileNo);
//							msgService.registMsgFile(msgFileVo);
//							
//						} catch (IllegalStateException | IOException e) {
//							// TODO Auto-generated catch block
//							e.printStackTrace();
//						}
//					}
//				}
//			}
//			
//		}
		
		
		
		ra.addAttribute("emp_no", msgVo.getSd_emp_no());
		return "redirect:/msg/msgMain";
	}
	
	// 쪽지 재임시저장
	@RequestMapping(path="tempTempMsg", method = RequestMethod.POST)
	public synchronized String tempTempMsg(MsgVo msgVo, RedirectAttributes ra , MultipartHttpServletRequest fileList) {
		List<MultipartFile> files = fileList.getFiles("fileName");
		
		int insertCnt =  0;
		
		insertCnt = msgService.tempTempMsg(msgVo);

		
		
		
		ra.addAttribute("emp_no", msgVo.getSd_emp_no());
		return "redirect:/msg/msgMain";
	}	
	// 임시저장 쪽지 삭제
	@RequestMapping(path="deleteTempMsg", method = RequestMethod.POST)
	public synchronized String deleteTempMsg(MsgVo msgVo, RedirectAttributes ra ) {
	
		
		int insertCnt =  0;
		
		insertCnt = msgService.deleteTempMsg(msgVo);

		
		
		
		ra.addAttribute("emp_no", msgVo.getEmp_no());
		return "redirect:/msg/msgMain";
	}		
	
	// 휴지통 쪽지 복원
	@RequestMapping(path="returnMsg", method = RequestMethod.POST)
	public synchronized String returnMsg(MsgVo msgVo, RedirectAttributes ra) {
		
		int insertCnt =  0;
		
		insertCnt = msgService.returnMsg(msgVo);

		
		
		
		ra.addAttribute("emp_no", msgVo.getSd_emp_no());
		return "redirect:/msg/msgMain";
	}			

	// 수신자 지정 조직도 불러오기
	@RequestMapping(path="empInfoMsgList", method = RequestMethod.GET)
	public String empInfoMsgList(Model model) {

	    model.addAttribute("deptList", empService.selectDept());

		model.addAttribute("organizationList", empService.selectOrganization());
		
		return "msg/empInfoMsgList";
	}

	
	// 받은 쪽지함
	@RequestMapping(path="pagingRecMsgAjaxHtml", method = RequestMethod.GET)
	public String pagingRecMsgAjaxHtml(PageVo pageVo,Model model) {
		
	    model.addAllAttributes(msgService.recMsgList(pageVo));
	    model.addAttribute("msgKind", "받은쪽지함");
		return "msg/pagingRecMsgAjaxHtml";
	}
	
	// 보낸 쪽지함
	@RequestMapping(path="pagingSentMsgAjaxHtml", method = RequestMethod.GET)
	public String pagingSentMsgAjaxHtml(PageVo pageVo,Model model) {
		pageVo.setPageSize(9);
	    model.addAllAttributes(msgService.sentMsgList(pageVo));
	    model.addAttribute("msgKind", "보낸쪽지함");
		return "msg/pagingSentMsgAjaxHtml";
	}
	
	// 임시저장 쪽지함
	@RequestMapping(path="pagingTempMsgAjaxHtml", method = RequestMethod.GET)
	public String pagingTempMsgAjaxHtml(PageVo pageVo,Model model) {
		pageVo.setPageSize(9);
	    model.addAllAttributes(msgService.tempMsgList(pageVo));
	    model.addAttribute("msgKind", "임시저장함");
		return "msg/pagingTempMsgAjaxHtml";
	}
	// 휴지통
	@RequestMapping(path="pagingDeleteMsgAjaxHtml", method = RequestMethod.GET)
	public String pagingDeleteMsgAjaxHtml(PageVo pageVo,Model model) {
		pageVo.setPageSize(9);
	    model.addAllAttributes(msgService.deleteMsgList(pageVo));
	    model.addAttribute("msgKind", "휴지통");
		return "msg/pagingDeleteMsgAjaxHtml";
	}	
	
	// 쪽지함 정보리스트
	@RequestMapping(path="pagingMsgBoxMsgAjaxHtml", method = RequestMethod.GET)
	public String pagingMsgBoxMsgAjaxHtml(PageVo pageVo,String msg_box_nm,Model model) {
		pageVo.setPageSize(9);
	    model.addAllAttributes(msgService.selectMsgBoxView(pageVo));
	    model.addAttribute("msgKind", msg_box_nm);
		return "msg/pagingMsgBoxMsgAjaxHtml";
	}
	// 받은 쪽지 상세정보
	@RequestMapping(path="msgView", method = RequestMethod.GET)
	public String msgView(int msg_no,int emp_no, Model model) {
		
	    model.addAttribute("msg",msgService.msgView(msg_no));
	   
	    List<Integer> msgFileList = msgService.msgFileList(msg_no);
	    logger.debug("msgFileList : {}",msgFileList);
		List<AttFileVo> attFileList = new ArrayList<AttFileVo>();
		if(msgFileList!=null) {
			for(int i = 0; i<msgFileList.size(); i++){
				attFileList.add(attFileService.selectFile(msgFileList.get(i)));
			}
		}
		logger.debug("attFileList : {}",attFileList);
		model.addAttribute("attFileList", attFileList);
		model.addAttribute("msgBoxList", msgService.msgBoxList(emp_no));
		return "msg/msgView";
	}
	
	// 보낸 쪽지 상세정보
	@RequestMapping(path="sentMsgView", method = RequestMethod.GET)
	public String sentMsgView(int msg_no, Model model) {
		
	    model.addAttribute("msg",msgService.sentMsgView(msg_no));
	   
	    List<Integer> msgFileList = msgService.msgFileList(msg_no);
	    logger.debug("msgFileList : {}",msgFileList);
		List<AttFileVo> attFileList = new ArrayList<AttFileVo>();
		if(msgFileList!=null) {
			for(int i = 0; i<msgFileList.size(); i++){
				attFileList.add(attFileService.selectFile(msgFileList.get(i)));
			}
		}
		logger.debug("attFileList : {}",attFileList);
		model.addAttribute("attFileList", attFileList);
	    
		return "msg/sentMsgView";
	}
	
	// 임시저장함 쪽지 상세정보
	@RequestMapping(path="tempMsgView", method = RequestMethod.GET)
	public String tempMsgView(int msg_no, Model model) {
		
	    model.addAttribute("msg",msgService.sentMsgView(msg_no));
	   
	    List<Integer> msgFileList = msgService.msgFileList(msg_no);
	    logger.debug("msgFileList : {}",msgFileList);
		List<AttFileVo> attFileList = new ArrayList<AttFileVo>();
		if(msgFileList!=null) {
			for(int i = 0; i<msgFileList.size(); i++){
				attFileList.add(attFileService.selectFile(msgFileList.get(i)));
			}
		}
		logger.debug("attFileList : {}",attFileList);
		model.addAttribute("attFileList", attFileList);
	    
		return "msg/tempMsgView";
	}
	
	
	// 휴지통 쪽지 상세정보
	@RequestMapping(path="deleteMsgView", method = RequestMethod.GET)
	public String deleteMsgView(int msg_no, Model model) {
		
	    model.addAttribute("msg",msgService.msgView(msg_no));
	   
	    List<Integer> msgFileList = msgService.msgFileList(msg_no);
	    logger.debug("msgFileList : {}",msgFileList);
		List<AttFileVo> attFileList = new ArrayList<AttFileVo>();
		if(msgFileList!=null) {
			for(int i = 0; i<msgFileList.size(); i++){
				attFileList.add(attFileService.selectFile(msgFileList.get(i)));
			}
		}
		logger.debug("attFileList : {}",attFileList);
		model.addAttribute("attFileList", attFileList);
	    
		return "msg/deleteMsgView";
	}
	// 보낸 쪽지 상세정보
	@RequestMapping(path="deleteMsg", method = RequestMethod.POST)
	public String deleteMsg(int msg_no,int emp_no, RedirectAttributes ra) {
		
		msgService.deleteMsg(msg_no);
	    
		ra.addAttribute("emp_no", emp_no);
		return "redirect:/msg/msgMain";
	}
	
	//쪽지함 등록
	@RequestMapping(path="registMsgBox", method = RequestMethod.POST)
	public String registMsgBox(MsgBoxVo msgBoxVo, RedirectAttributes ra) {
		
		msgService.registMsgBox(msgBoxVo);
	    
		ra.addAttribute("emp_no", msgBoxVo.getEmp_no());
		return "redirect:/msg/msgMain";
	}
	
	
	//쪽지함 이동
	@RequestMapping(path="moveMsgBox", method = RequestMethod.POST)
	public String moveMsgBox(MsgVo msgVo, RedirectAttributes ra) {
		
		msgService.moveMsgBox(msgVo);
	    
		ra.addAttribute("emp_no", msgVo.getEmp_no());
		return "redirect:/msg/msgMain";
	}
	
	
	
	
	
}
