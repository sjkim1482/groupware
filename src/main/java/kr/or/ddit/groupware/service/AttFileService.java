package kr.or.ddit.groupware.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.model.AttFileVo;
import kr.or.ddit.groupware.repository.AttFileDao;

@Service("attFileService")
public class AttFileService implements AttFileServiceI{
	@Resource(name = "attFileDao")
	private AttFileDao attFileDao;

	//파일 등록
	@Override
	public int registFile(AttFileVo attFileVo) {
		// TODO Auto-generated method stub
		return attFileDao.registFile(attFileVo);
	}

	// 파일 최대 번호 불러오기
	@Override
	public int maxFileNo() {
		// TODO Auto-generated method stub
		return attFileDao.maxFileNo();
	}

	// 파일정보 불러오기
	@Override
	public AttFileVo selectFile(int file_no) {
		// TODO Auto-generated method stub
		return attFileDao.selectFile(file_no);
	}
	
	
	
}
