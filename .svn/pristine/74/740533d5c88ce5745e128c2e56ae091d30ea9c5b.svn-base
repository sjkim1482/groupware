package kr.or.ddit.groupware.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.AttFileVo;
import kr.or.ddit.groupware.model.BoardCommVo;
import kr.or.ddit.groupware.model.BoardPostFileVo;
import kr.or.ddit.groupware.model.BoardPostVo;
import kr.or.ddit.groupware.model.BoardVo;
import kr.or.ddit.groupware.model.PopDisVo;
import kr.or.ddit.groupware.model.PopUpVo;
import kr.or.ddit.groupware.repository.BoardDao;


@Service("boardService")
public class BoardService implements BoardServiceI{

	@Resource(name = "boardDao")
	private BoardDao boardDao;
	
	// 관리자 게시판 관리
	@Override
	public List<BoardVo> selectBoard() {
		
		return boardDao.selectBoard();
	}
	// 관리자 게시판 등록
	@Override
	public int insertBoard(BoardVo vo) {
		return boardDao.insertBoard(vo);
	}
	// 관리자 게시판 수정
	@Override
	public int updateBoard(BoardVo vo) {
		return boardDao.updateBoard(vo);
	}
    //게시글 등록
	@Override
	public int insertPost(BoardPostVo vo) {
		return boardDao.insertPost(vo);
	}
	//게시글 상세보기
	@Override
	public BoardPostVo postDetail(BoardPostVo vo) {
		return boardDao.postDetail(vo);
	}
	// 조회수
	@Override
	public int hitsupdate(int post_seq) {
		return boardDao.hitsupdate(post_seq);
	}
	
	
	@Override
	public int maxPostNo() {
		return boardDao.maxPostNo();
	}
	//게시글 리스트
	@Override
	public Map<String, Object> postListView(PageVo vo) {
		
		Map<String, Object> map = new HashMap<>();
		List<BoardPostVo> postList = boardDao.postListView(vo);
		int postCnt = boardDao.selectPostCnt(vo);
		
		map.put("postList", postList);
		map.put("postCnt", postCnt);
		
		return map;
	}
	//게시글 수정
	@Override
	public int modifyPost(BoardPostVo vo) {
		return boardDao.modifyPost(vo);
	}
	@Override
	public BoardPostVo selectPost(BoardPostVo vo) {
		return boardDao.selectPost(vo);
	}
	@Override
	public int deletePost(BoardPostVo vo) {
		return boardDao.deletePost(vo); 
	}
	@Override
	public int insertComm(BoardCommVo vo) {
		return boardDao.insertComm(vo);
	}
	@Override
	public List<BoardCommVo> selectComm(BoardCommVo vo) {
		return boardDao.selectComm(vo);
	}
	@Override
	public int deleteComm(BoardCommVo vo) {
		return boardDao.deleteComm(vo);
	}
	@Override
	public int insertReply(BoardPostVo vo) {
		return boardDao.insertReply(vo);
	}

	@Override
	public List<BoardVo> selectEmpBoard(int emp_no) {
		return boardDao.selectEmpBoard(emp_no);
	}
	@Override
	public int insertAttFile(AttFileVo vo) {
		return boardDao.insertAttFile(vo);
	}
	@Override
	public int insertPostFile(BoardPostFileVo vo) {
		return boardDao.insertPostFile(vo);
	}
	@Override
	public int maxFileNo() {
		return boardDao.maxFileNo();
	}
	@Override
	public AttFileVo selectFile(int file_no) {
		return boardDao.selectFile(file_no);
	}
	@Override
	public List<Integer> postFileList(int post_no) {
		return boardDao.postFileList(post_no);
	}
	@Override
	public int deletePostFile(BoardPostFileVo vo) {
		return boardDao.deletePostFile(vo);
	}
	@Override
	public String selectBorNm(int bor_no) {
		return boardDao.selectBorNm(bor_no);
	}
	@Override
	public int insertPopup(PopUpVo vo) {
		return boardDao.insertPopup(vo);
	}
	@Override
	public List<PopUpVo> selectPopup(int popup_no) {
		return boardDao.selectPopup(popup_no);
	}
	@Override
	public int insertPopDis(PopDisVo vo) {
		return boardDao.insertPopDis(vo);
	}
	@Override
	public List<PopDisVo> selectPopDis(int act_cd) {
		return boardDao.selectPopDis(act_cd);
	}
	@Override
	public PopUpVo selectPopUpList(int popup_no) {
		return boardDao.selectPopUpList(popup_no);
	}
	@Override
	public List<PopUpVo> selectTodayPopUpList() {
		return boardDao.selectTodayPopUpList();
	}
	// 게시물 검색
	@Override
	public Map<String, Object> SearchPost(PageVo vo) {
		Map<String, Object> map = new HashMap<>();
		List<BoardPostVo> postList = boardDao.SearchPost(vo);
		int postCnt = boardDao.searchCnt(vo);
		
		map.put("postList", postList);
		map.put("postCnt", postCnt);
		
		return map;
	}
	// 작성자 검색
	@Override
	public Map<String, Object> SearchWriter(PageVo vo) {
		Map<String, Object> map = new HashMap<>();
		List<BoardPostVo> postList = boardDao.SearchWriter(vo);
		int postCnt = boardDao.searchWCnt(vo);
		
		map.put("postList", postList);
		map.put("postCnt", postCnt);
		
		return map;
	}
	// 팝업관리 : 팝업삭제
	@Override
	public int deletePopup(PopUpVo vo) {
		return boardDao.deletePopup(vo);
	}
	// 팝업리스트
	@Override
	public List<PopUpVo> popupListView() {
		return boardDao.popupListView();
	}
	@Override
	public int searchCnt(PageVo vo) {
		return boardDao.searchCnt(vo);
	}
	@Override
	public int searchWCnt(PageVo vo) {
		return boardDao.searchWCnt(vo);
	}
	


}
