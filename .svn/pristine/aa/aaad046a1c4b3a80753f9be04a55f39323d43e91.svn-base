package kr.or.ddit.groupware.contoller;

import java.io.FileInputStream;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.groupware.model.AttFileVo;
import kr.or.ddit.groupware.service.AttFileService;

@RequestMapping("file")
@Controller
public class FileController {
	
	@Resource(name="attFileService")
	private AttFileService attFileService;
	
	// 파일 다운로드
	@RequestMapping("fileDownload")
	public void fileDownload(int file_no, HttpServletResponse resp) throws IOException {
		
		AttFileVo attFileVo = attFileService.selectFile(file_no);
		
		
		String fileName = attFileVo.getFile_nm();
		
		
		String path = attFileVo.getFile_route();
		
		resp.setHeader("Content-Disposition", "attachment; filename="+fileName);
		


		FileInputStream fis = new FileInputStream(path);
		ServletOutputStream sos = resp.getOutputStream();
		
		byte[] buff = new byte[512];
		while(fis.read(buff)!=-1) {
			
			sos.write(buff);
			
		}
		
		
		fis.close();
		sos.flush();
		sos.close();
	}
	
}
