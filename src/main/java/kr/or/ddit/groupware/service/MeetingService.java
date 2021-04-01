package kr.or.ddit.groupware.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.model.MeetInfoVo;
import kr.or.ddit.groupware.model.MeetingVo;
import kr.or.ddit.groupware.repository.MeetingDao;

@Service("meetingService")
public class MeetingService implements MeetingServiceI {
	
	@Resource(name = "meetingDao")
	private MeetingDao meetingDao;

	@Override
	public int registMeeting(MeetingVo meetingVo) {
		// TODO Auto-generated method stub
		return meetingDao.registMeeting(meetingVo);
	}

	@Override
	public int registMeetInfo(MeetInfoVo meetInfoVo) {
		// TODO Auto-generated method stub
		return meetingDao.registMeetInfo(meetInfoVo);
	}

	@Override
	public int maxMeetingNo() {
		// TODO Auto-generated method stub
		return meetingDao.maxMeetingNo();
	}

	@Override
	public List<Integer> selectMeetInfoList(int emp_no) {
		// TODO Auto-generated method stub
		return meetingDao.selectMeetInfoList(emp_no);
	}

	@Override
	public MeetingVo selectMeeting(int meet_no) {
		// TODO Auto-generated method stub
		return meetingDao.selectMeeting(meet_no);
	}

	@Override
	public int closeMeeting(int meet_no) {
		// TODO Auto-generated method stub
		return meetingDao.closeMeeting(meet_no);
	}
	
}
