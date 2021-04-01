package kr.or.ddit.groupware.contoller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.groupware.model.MeetInfoVo;
import kr.or.ddit.groupware.model.MeetingVo;
import kr.or.ddit.groupware.service.EmpService;
import kr.or.ddit.groupware.service.MeetingService;

@RequestMapping("meeting")
@Controller
public class MeetingController {

	@Resource(name="meetingService")
	private MeetingService meetingService;
	
	@Resource(name="empService")
	private EmpService empService;
	
	@RequestMapping("main")
	public String main(int emp_no, Model model) {
		
		List<Integer> meetingNoList = meetingService.selectMeetInfoList(emp_no);
		List<MeetingVo> meetingList = new ArrayList<MeetingVo>();
 		if(meetingNoList!=null) {
			for(int i = 0; i<meetingNoList.size(); i++) {
				meetingList.add(meetingService.selectMeeting(meetingNoList.get(i)));
			}
			model.addAttribute("meetingList", meetingList);
		}
		
		return "tiles.meeting.main";
	}
	
	@RequestMapping("empInfoMsgList")
	public String empInfoMsgList(Model model) {
		model.addAttribute("deptList", empService.selectDept());

		model.addAttribute("organizationList", empService.selectOrganization());
		
		return "meeting/empInfoMsgList";
	}
	
	@RequestMapping(path = "registMeeting",method = RequestMethod.POST)
	public synchronized String registMeeting(MeetingVo meetingVo, Model model) {
		
		int insertCnt = meetingService.registMeeting(meetingVo);
		
		if(insertCnt==1) {
			int meet_no = meetingService.maxMeetingNo();
			MeetInfoVo meetInfoVo = new MeetInfoVo();
			meetInfoVo.setMeet_no(meet_no);
			for(int i=0; i<meetingVo.getEmpList().size(); i++) {
				meetInfoVo.setEmp_no(meetingVo.getEmpList().get(i));
				meetingService.registMeetInfo(meetInfoVo);
			}
		}
		
		model.addAttribute("cnt", insertCnt);
		
		return "jsonView";
	}
	
	@RequestMapping(path = "closeMeeting",method = RequestMethod.POST)
	public synchronized String closeMeeting(int meet_no,int emp_no, RedirectAttributes ra) {
		
		meetingService.closeMeeting(meet_no);
		
		ra.addAttribute("emp_no", emp_no);
		return "redirect:/meeting/main";
	}
	
	
}
