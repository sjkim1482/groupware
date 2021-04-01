package kr.or.ddit.groupware.repository;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.groupware.model.AttFileVo;

@Repository("attFileDao")
public class AttFileDao implements AttFileDaoI {
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate template;

	// 파일 등록
	@Override
	public int registFile(AttFileVo attFileVo) {
		// TODO Auto-generated method stub
		return template.insert("attFile.registFile", attFileVo);
	}

	// 파일 최대 번호 불러오기
	@Override
	public int maxFileNo() {
		// TODO Auto-generated method stub
		return template.selectOne("attFile.maxFileNo");
	}

	// 파일정보 불러오기
	@Override
	public AttFileVo selectFile(int file_no) {
		// TODO Auto-generated method stub
		return template.selectOne("attFile.selectFile",file_no);
	}
	
}
