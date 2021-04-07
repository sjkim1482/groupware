package kr.or.ddit.groupware.repository;

import java.util.List;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.AttFileVo;
import kr.or.ddit.groupware.model.BoardCommVo;
import kr.or.ddit.groupware.model.BoardPostFileVo;
import kr.or.ddit.groupware.model.BoardPostVo;
import kr.or.ddit.groupware.model.BoardVo;
import kr.or.ddit.groupware.model.PopDisVo;
import kr.or.ddit.groupware.model.PopUpVo;



public interface BoardDaoI {
	
	// 게시판 선택-관리자
	List<BoardVo> selectBoard();
	
	// 게시판 선택-사원
	List<BoardVo> selectEmpBoard(int emp_no);
	
	// 게시판 생성
	int insertBoard(BoardVo vo);
	
	// 게시판 수정
	int updateBoard(BoardVo vo);
	
	//게시글 등록
	int insertPost(BoardPostVo vo);
	
	//게시글 상세보기
	BoardPostVo postDetail(BoardPostVo vo);
	
	// 게시글 번호
	int maxPostNo();
	
	//게시글 리스트 보기
	List<BoardPostVo> postListView(PageVo vo); 
	
	//게시글 개수
	int selectPostCnt(PageVo vo);
	
	//게시글조회
	BoardPostVo selectPost(BoardPostVo vo);
	
	//게시글 수정
	int modifyPost(BoardPostVo vo);
	
	// 조회수 증가
	int hitsupdate(int post_seq);
	
	// 게시글 삭제
	int deletePost(BoardPostVo vo); 
	
	// 댓글 작성
	int insertComm(BoardCommVo vo);
	
	// 댓글리스트
	List<BoardCommVo> selectComm(BoardCommVo vo);
	
	// 댓글 삭제
	int deleteComm(BoardCommVo vo);
	
	// 답글 등록
	int insertReply(BoardPostVo vo);
	
	// 파일등록
	int insertAttFile(AttFileVo vo);
	
	int insertPostFile(BoardPostFileVo vo);
	
	//파일 최대번호 
	int maxFileNo();
	
	// 파일리스트
	AttFileVo selectFile(int file_no);
	
	List<Integer> postFileList(int post_no);
	
	//파일삭제
	int deletePostFile(BoardPostFileVo vo);
	
	//게시판 제목 불러오기
	String selectBorNm(int bor_no);
	
	// 팝업등록
	int insertPopup(PopUpVo vo);
	
	List<PopUpVo> selectPopup(int popup_no);
	
	// 팝업 표시
	int insertPopDis(PopDisVo vo);
	
	List<PopDisVo> selectPopDis(int act_cd);
	
	// 로그인시 메인화면에 팝업창 띄우기
	PopUpVo selectPopUpList(int popup_no);
	
	
	List<PopUpVo> selectTodayPopUpList();
	
	// 게시물 검색
	List<BoardPostVo> SearchPost(PageVo vo);
	
	int searchCnt(PageVo vo);
	
	// 작성자 검색
	List<BoardPostVo> SearchWriter(PageVo vo);
	
	int searchWCnt(PageVo vo);
	
	// 팝업관리 : 팝업삭제
	int deletePopup(PopUpVo vo);

	// 팝업 리스트
	List<PopUpVo> popupListView();
	
	
	
	
	
	
	

}
