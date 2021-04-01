package kr.or.ddit.groupware.repository;

import java.util.List;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.MsgBoxVo;
import kr.or.ddit.groupware.model.MsgFileVo;
import kr.or.ddit.groupware.model.MsgVo;

public interface MsgDaoI {
	
	//쪽지전송
	int sentMsg(MsgVo msgVo);
	
	//등록한 쪽지 호출
	int maxMsgNo();
	
	//첨부파일 등록
	int registMsgFile(MsgFileVo msgFileVo);
	
	//첨부파일 확인
	List<Integer> msgFileList(int file_no);
	
	//받은쪽지 확인
	List<MsgVo> recMsgList(PageVo pageVo);
	
	//받은쪽지 개수
	int recMsgCnt(PageVo pageVo);
	
	//보낸쪽지 확인
	List<MsgVo> sentMsgList(PageVo pageVo);
	
	//보낸쪽지 개수
	int sentMsgCnt(PageVo pageVo);
	
	//안읽은 쪽지 개수
	int noReadMsgCnt(int emp_no);
	
	//쪽지 읽음처리
	int readMsg(int msg_no);
	
	//쪽지 상세정보
	MsgVo msgView(int msg_no);
	
	//쪽지 임시저장
	int tempMsg(MsgVo msgVo);
	
	//임시저장 쪽지 리스트
	List<MsgVo> tempMsgList(PageVo pageVo);
	
	//임시저장 쪽지 개수
	int tempMsgCnt(PageVo pageVo);
	
	// 임시저장 쪽지 삭제
	int deleteTempMsg(MsgVo msgVo);
	
	//임시저장 쪽지 재임시 저장
	int tempTempMsg(MsgVo msgVo);
	
	//쪽지 휴지통 이동
	int deleteMsg(int msg_no);
	
	//휴지통 쪽지 리스트
	List<MsgVo> deleteMsgList(PageVo pageVo);
	
	//휴지통 쪽지 개수
	int deleteMsgCnt(PageVo pageVo);
	
	//쪽지함 등록
	int registMsgBox(MsgBoxVo msgBoxVo);
	
	//쪽지함 리스트
	List<MsgBoxVo> msgBoxList(int emp_no);
		
	//쪽지함 쪽지 리스트
	List<MsgVo> selectMsgBoxView(PageVo pageVo);
	
	//쪽지함 쪽지 리스트 개수
	int selectMsgBoxCnt(PageVo pageVo);
	
	//쪽지함으로 이동
	int moveMsgBox(MsgVo msgVo);
	
	//휴지통 쪽지 복원
	int returnMsg(MsgVo msgVo);
	
}
