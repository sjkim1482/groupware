package kr.or.ddit.groupware.repository;

import java.util.List;

import kr.or.ddit.groupware.model.MeetInfoVo;
import kr.or.ddit.groupware.model.MeetingVo;

public interface MeetingDaoI {
	
	//회의 생성
	int registMeeting(MeetingVo meetingVo);
	
	//화의 참여자 등록
	int registMeetInfo(MeetInfoVo meetInfoVo);
	
	//가장최근 회의 호출
	int maxMeetingNo();
	
	//참여된 회의 리스트
	List<Integer> selectMeetInfoList(int emp_no);
	
	//회의 정보
	MeetingVo selectMeeting(int meet_no);
	
	//화상회의 종료
	int closeMeeting(int meet_no);
	
}
