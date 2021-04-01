package kr.or.ddit.groupware.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.MsgBoxVo;
import kr.or.ddit.groupware.model.MsgFileVo;
import kr.or.ddit.groupware.model.MsgVo;

@Repository("msgDao")
public class MsgDao implements MsgDaoI{
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public int sentMsg(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return template.insert("msg.sentMsg",msgVo);
	}

	@Override
	public int maxMsgNo() {
		// TODO Auto-generated method stub
		return template.selectOne("msg.maxMsgNo");
	}

	@Override
	public int registMsgFile(MsgFileVo msgFileVo) {
		// TODO Auto-generated method stub
		return template.insert("msg.registMsgFile",msgFileVo);
	}

	@Override
	public List<Integer> msgFileList(int file_no) {
		// TODO Auto-generated method stub
		return template.selectList("msg.msgFileList",file_no);
	}

	@Override
	public List<MsgVo> recMsgList(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectList("msg.recMsgList",pageVo);
	}

	@Override
	public int recMsgCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectOne("msg.recMsgCnt",pageVo);
	}

	@Override
	public List<MsgVo> sentMsgList(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectList("msg.sentMsgList",pageVo);
	}

	@Override
	public int sentMsgCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectOne("msg.sentMsgCnt",pageVo);
	}

	@Override
	public int noReadMsgCnt(int emp_no) {
		// TODO Auto-generated method stub
		return template.selectOne("msg.noReadMsgCnt", emp_no);
	}

	@Override
	public int readMsg(int msg_no) {
		// TODO Auto-generated method stub
		return template.update("msg.readMsg",msg_no);
	}

	@Override
	public MsgVo msgView(int msg_no) {
		// TODO Auto-generated method stub
		return template.selectOne("msg.msgView",msg_no);
	}

	@Override
	public int tempMsg(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return template.insert("msg.tempMsg",msgVo);
	}

	@Override
	public int tempMsgCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectOne("msg.tempMsgCnt",pageVo);
	}

	@Override
	public List<MsgVo> tempMsgList(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectList("msg.tempMsgList",pageVo);
	}

	@Override
	public int deleteTempMsg(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return template.update("msg.deleteTempMsg",msgVo);
	}

	@Override
	public int tempTempMsg(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return template.update("msg.tempTempMsg",msgVo);
	}

	@Override
	public int deleteMsg(int msg_no) {
		// TODO Auto-generated method stub
		return template.update("msg.deleteMsg", msg_no);
	}

	@Override
	public List<MsgVo> deleteMsgList(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectList("msg.deleteMsgList", pageVo);
	}

	@Override
	public int deleteMsgCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectOne("msg.deleteMsgCnt",pageVo);
	}

	@Override
	public int registMsgBox(MsgBoxVo msgBoxVo) {
		// TODO Auto-generated method stub
		return template.insert("msg.registMsgBox",msgBoxVo);
	}

	@Override
	public List<MsgBoxVo> msgBoxList(int emp_no) {
		// TODO Auto-generated method stub
		return template.selectList("msg.msgBoxList",emp_no);
	}

	@Override
	public List<MsgVo> selectMsgBoxView(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectList("msg.selectMsgBoxView",pageVo);
	}

	@Override
	public int selectMsgBoxCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectOne("msg.selectMsgBoxCnt",pageVo);
	}

	@Override
	public int moveMsgBox(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return template.update("msg.moveMsgBox",msgVo);
	}

	@Override
	public int returnMsg(MsgVo msgVo) {
		// TODO Auto-generated method stub
		return template.update("msg.returnMsg",msgVo);
	}
	
}
