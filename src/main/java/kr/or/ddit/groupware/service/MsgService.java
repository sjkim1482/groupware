package kr.or.ddit.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.MsgBoxVo;
import kr.or.ddit.groupware.model.MsgFileVo;
import kr.or.ddit.groupware.model.MsgVo;
import kr.or.ddit.groupware.repository.MsgDao;

@Service("msgService")
public class MsgService implements MsgServiceI{
	
	private static final Logger logger = LoggerFactory.getLogger(MsgService.class);
	
	@Resource(name = "msgDao")
	private MsgDao msgDao;

	@Override
	public int sentMsg(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return msgDao.sentMsg(msgVo);
	}

	@Override
	public int maxMsgNo() {
		// TODO Auto-generated method stub
		return msgDao.maxMsgNo();
	}

	@Override
	public int registMsgFile(MsgFileVo msgFileVo) {
		// TODO Auto-generated method stub
		return msgDao.registMsgFile(msgFileVo);
	}

	@Override
	public List<Integer> msgFileList(int file_no) {
		// TODO Auto-generated method stub
		return msgDao.msgFileList(file_no);
	}

	@Override
	public Map<String, Object> recMsgList(PageVo pageVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("msgList", msgDao.recMsgList(pageVo));
		map.put("msgCnt", msgDao.recMsgCnt(pageVo));
		map.put("pagination", (int)Math.ceil( (double)msgDao.recMsgCnt(pageVo) / pageVo.getPageSize()));
		map.put("pageVo", pageVo);
		
		logger.debug("msgList : {} ",map.get("msgList"));
		
		return map;
	}

	@Override
	public int recMsgCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return msgDao.recMsgCnt(pageVo);
	}

	@Override
	public Map<String, Object> sentMsgList(PageVo pageVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("msgList", msgDao.sentMsgList(pageVo));
		map.put("msgCnt", msgDao.sentMsgCnt(pageVo));
		map.put("pagination", (int)Math.ceil( (double)msgDao.sentMsgCnt(pageVo) / pageVo.getPageSize()));
		map.put("pageVo", pageVo);
		
		return map;
	}

	@Override
	public int sentMsgCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return msgDao.sentMsgCnt(pageVo);
	}

	@Override
	public int noReadMsgCnt(int emp_no) {
		// TODO Auto-generated method stub
		return msgDao.noReadMsgCnt(emp_no);
	}


	@Override
	public MsgVo msgView(int msg_no) {
		msgDao.readMsg(msg_no);
		return msgDao.msgView(msg_no);
	}

	@Override
	public MsgVo sentMsgView(int msg_no) {
		// TODO Auto-generated method stub
		return msgDao.msgView(msg_no);
	}

	@Override
	public int tempMsg(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return msgDao.tempMsg(msgVo);
	}

	@Override
	public int tempMsgCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return msgDao.tempMsgCnt(pageVo);
	}

	@Override
	public Map<String, Object> tempMsgList(PageVo pageVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("msgList", msgDao.tempMsgList(pageVo));
		map.put("msgCnt", msgDao.tempMsgCnt(pageVo));
		map.put("pagination", (int)Math.ceil( (double)msgDao.tempMsgCnt(pageVo) / pageVo.getPageSize()));
		map.put("pageVo", pageVo);
		
		return map;
	}

	@Override
	public int deleteTempMsg(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return msgDao.deleteTempMsg(msgVo);
	}

	@Override
	public int tempTempMsg(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return msgDao.tempTempMsg(msgVo);
	}

	@Override
	public int deleteMsg(int msg_no) {
		// TODO Auto-generated method stub
		return msgDao.deleteMsg(msg_no);
	}

	@Override
	public Map<String, Object> deleteMsgList(PageVo pageVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("msgList", msgDao.deleteMsgList(pageVo));
		map.put("msgCnt", msgDao.deleteMsgCnt(pageVo));
		map.put("pagination", (int)Math.ceil( (double)msgDao.deleteMsgCnt(pageVo) / pageVo.getPageSize()));
		map.put("pageVo", pageVo);
		
		return map;
	}

	@Override
	public int registMsgBox(MsgBoxVo msgBoxVo) {
		// TODO Auto-generated method stub
		return msgDao.registMsgBox(msgBoxVo);
	}

	@Override
	public List<MsgBoxVo> msgBoxList(int emp_no) {
		// TODO Auto-generated method stub
		return msgDao.msgBoxList(emp_no);
	}

	@Override
	public Map<String, Object> selectMsgBoxView(PageVo pageVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("msgList", msgDao.selectMsgBoxView(pageVo));
		map.put("msgCnt", msgDao.selectMsgBoxCnt(pageVo));
		map.put("pagination", (int)Math.ceil( (double)msgDao.selectMsgBoxCnt(pageVo) / pageVo.getPageSize()));
		map.put("pageVo", pageVo);
		
		
		return map;
	}

	@Override
	public int moveMsgBox(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return msgDao.moveMsgBox(msgVo);
	}

	@Override
	public int returnMsg(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return msgDao.returnMsg(msgVo);
	}
	
	

}
