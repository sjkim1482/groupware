package kr.or.ddit.groupware.repository;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.AttFileVo;
import kr.or.ddit.groupware.model.BoardCommVo;
import kr.or.ddit.groupware.model.BoardPostFileVo;
import kr.or.ddit.groupware.model.BoardPostVo;
import kr.or.ddit.groupware.model.BoardVo;
import kr.or.ddit.groupware.model.PopDisVo;
import kr.or.ddit.groupware.model.PopUpVo;

@Repository("boardDao")
public class BoardDao implements BoardDaoI{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<BoardVo> selectBoard() {
		return template.selectList("board.selectBoard");
	}

	@Override
	public int insertBoard(BoardVo vo) {
		return template.insert("board.insertBoard", vo);
	}

	@Override
	public int updateBoard(BoardVo vo) {
		return template.update("board.updateBoard", vo);
	}

	@Override
	public int insertPost(BoardPostVo vo) {
		return template.insert("board.insertPost", vo);
	}

	@Override
	public int hitsupdate(int post_seq) {
		return template.update("board.hitsupdate", post_seq);
	}
	@Override
	public BoardPostVo postDetail(BoardPostVo vo) {
		return template.selectOne("board.postDetail", vo);
	}

	@Override
	public int maxPostNo() {
		return template.selectOne("board.maxPostNo");
	}

	@Override
	public List<BoardPostVo> postListView(PageVo vo) {
		return template.selectList("board.postListView", vo);
	}

	@Override
	public int selectPostCnt(PageVo vo) {
		return template.selectOne("board.selectPostCnt", vo);
	}

	@Override
	public int modifyPost(BoardPostVo vo) {
		return template.update("board.modifyPost", vo);
	}

	@Override
	public BoardPostVo selectPost(BoardPostVo vo) {
		return template.selectOne("board.selectPost", vo);
	}

	@Override
	public int deletePost(BoardPostVo vo) {
		return template.update("board.deletePost", vo);
	}

	@Override
	public int insertComm(BoardCommVo vo) {
		return template.insert("board.insertComm", vo);
	}

	@Override
	public List<BoardCommVo> selectComm(BoardCommVo vo) {
		return template.selectList("board.selectComm", vo);
	}

	@Override
	public int deleteComm(BoardCommVo vo) {
		return template.update("board.deleteComm", vo);
	}

	@Override
	public int insertReply(BoardPostVo vo) {
		return template.insert("board.insertReply", vo);
	}

	@Override
	public List<BoardVo> selectEmpBoard(int emp_no) {
		return template.selectList("board.selectEmpBoard", emp_no);
	}

	@Override
	public int insertAttFile(AttFileVo vo) {
		return template.insert("board.insertAttFile", vo);
	}

	@Override
	public int insertPostFile(BoardPostFileVo vo) {
		return template.insert("board.insertPostFile", vo);
	}

	@Override
	public int maxFileNo() {
		return template.selectOne("board.maxFileNo");
	}

	@Override
	public AttFileVo selectFile(int file_no) {
		return template.selectOne("board.selectFile", file_no);
	}

	@Override
	public List<Integer> postFileList(int post_no) {
		return template.selectList("board.postFileList", post_no);
	}

	@Override
	public int deletePostFile(BoardPostFileVo vo) {
		return template.delete("board.deletePostFile", vo);
	}

	@Override
	public String selectBorNm(int bor_no) {
		return template.selectOne("board.selectBorNm", bor_no);
	}

	@Override
	public int insertPopup(PopUpVo vo) {
		return template.insert("board.insertPopup", vo);
	}

	@Override
	public List<PopUpVo> selectPopup(int popup_no) {
		return template.selectList("board.selectPopup", popup_no);
	}

	@Override
	public int insertPopDis(PopDisVo vo) {
		return template.insert("board.insertPopDis", vo);
	}

	@Override
	public List<PopDisVo> selectPopDis(int act_cd) {
		return template.selectList("board.selectPopDis", act_cd);
	}

	@Override
	public PopUpVo selectPopUpList(int popup_no) {
		return (PopUpVo) template.selectOne("board.selectPopUpList", popup_no);
	}

	@Override
	public List<PopUpVo> selectTodayPopUpList() {
		return template.selectList("board.selectTodayPopUpList");
	}
	// 게시글 검색
	@Override
	public List<BoardPostVo> SearchPost(PageVo vo) {
		return template.selectList("board.SearchPost", vo);
	}
	// 작성자 검색
	@Override
	public List<BoardPostVo> SearchWriter(PageVo vo) {
		return template.selectList("board.SearchWriter", vo);
	}
	
	@Override
	public int deletePopup(PopUpVo vo) {
		return template.update("board.deletePopup", vo);
	}
	
	@Override
	public List<PopUpVo> popupListView() {
		return template.selectList("board.popupListView");
	}

	@Override
	public int searchCnt(PageVo vo) {
		return template.selectOne("board.searchCnt", vo);
	}

	@Override
	public int searchWCnt(PageVo vo) {
		return template.selectOne("board.searchWCnt", vo);
	}


	
	
	
	
	


}
