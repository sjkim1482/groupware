package kr.or.ddit.groupware.repository;

import kr.or.ddit.groupware.model.AttFileVo;

public interface AttFileDaoI {
	// 파일 등록
	int registFile(AttFileVo attFileVo);
	
	// 파일 최대번호 불러오기
	int maxFileNo();
	// 파일정보 불러오기
	AttFileVo selectFile(int file_no);
}
