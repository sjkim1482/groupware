package kr.or.ddit.groupware.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.groupware.model.MeetInfoVo;
import kr.or.ddit.groupware.model.MeetingVo;

@Repository("meetingDao")
public class MeetingDao implements MeetingDaoI {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public int registMeeting(MeetingVo meetingVo) {
		// TODO Auto-generated method stub
		return template.insert("meeting.registMeeting",meetingVo);
	}

	@Override
	public int registMeetInfo(MeetInfoVo meetInfoVo) {
		// TODO Auto-generated method stub
		return template.insert("meeting.registMeetInfo",meetInfoVo);
	}

	@Override
	public int maxMeetingNo() {
		// TODO Auto-generated method stub
		return template.selectOne("meeting.maxMeetingNo");
	}

	@Override
	public List<Integer> selectMeetInfoList(int emp_no) {
		// TODO Auto-generated method stub
		return template.selectList("meeting.selectMeetInfoList",emp_no);
	}

	@Override
	public MeetingVo selectMeeting(int meet_no) {
		// TODO Auto-generated method stub
		return template.selectOne("meeting.selectMeeting",meet_no);
	}

	@Override
	public int closeMeeting(int meet_no) {
		// TODO Auto-generated method stub
		return template.update("meeting.closeMeeting", meet_no);
	}
	
}
