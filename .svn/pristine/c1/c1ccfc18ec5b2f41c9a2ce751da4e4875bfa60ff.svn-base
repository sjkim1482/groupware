package kr.or.ddit.groupware.contoller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.groupware.model.AttFileVo;
import kr.or.ddit.groupware.model.BoardCommVo;
import kr.or.ddit.groupware.model.BoardPostFileVo;
import kr.or.ddit.groupware.model.BoardPostVo;
import kr.or.ddit.groupware.model.BoardVo;
import kr.or.ddit.groupware.model.PopUpVo;
import kr.or.ddit.groupware.service.AttFileService;
import kr.or.ddit.groupware.service.BoardService;
import kr.or.ddit.groupware.service.EmpService;
import kr.or.ddit.util.FileUtil;

@RequestMapping("board")
@Controller
public class BoardController {
private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name="empService")
	private EmpService empService;
	
	@Resource(name="attFileService")
	private AttFileService attFileService;
	
	
	@RequestMapping(path = "boardmain", method = RequestMethod.GET)
	public String main(Model model) {
		
		List<BoardVo> board = boardService.selectBoard();
		
		model.addAttribute("boardList", board);
		
		return "tiles.board.boardMain";
	}
	
	@RequestMapping(path = "mainEmployee", method = RequestMethod.GET)
	public String mainEmployee(int emp_no,Model model) {
		
		logger.debug("emp_no:{}",emp_no);
		List<BoardVo> board = boardService.selectEmpBoard(emp_no);
		
		model.addAttribute("boardList", board);
		
		return "tiles.board.mainEmployee";
	}

	@RequestMapping(path = "boardCreate", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardCreate(int emp_no, String bor_nm, String active) {
		
		int ad = 2;
		
		if(active.equals("activation")) {
			ad = 1;
		}
				
		BoardVo board = new BoardVo();
		
		board.setAct_cd(ad);
		board.setBor_nm(bor_nm);
		board.setEmp_no(emp_no);
		logger.debug("board:{}",board);
		
		boardService.insertBoard(board);
		
		return "redirect:/board/boardmain";
	
	}
	
	
	  @RequestMapping(path = "boardModify", method = {RequestMethod.GET, RequestMethod.POST})
	  public String boardModify(String bor_nm, String active){
	  
	  int ad = 2;
	  
	  if(active.equals("activation")) { 
		  ad = 1; 
	 }
	  
	  BoardVo board = new BoardVo();
	  
	  board.setBor_nm(bor_nm); 
	  board.setAct_cd(ad);
	  
	  boardService.updateBoard(board);
	  
	  return "redirect:/board/boardmain";
	  
	  }
	  
	  @RequestMapping(path="insertPost", method = RequestMethod.GET) 
	  public String insertBoard(int emp_no, Model model) {
		  
		  Date date = new Date();
		  
		  if(emp_no==0) {
			  
		 
			logger.debug("get:{}", "get");
			  model.addAttribute("boardList", boardService.selectBoard());
			  
		  }else {
			  model.addAttribute("boardList", boardService.selectEmpBoard(emp_no));
			 
		  }
		  model.addAttribute("date",date);
		  return "tiles.board.insertPost"; 
	 
	  }
	  
	  @RequestMapping(path="boardView", method = RequestMethod.GET) 
	  public String boardView() {
		  
		  return "tiles.board.boardView"; 
		  
	  }

	@RequestMapping(path = "insertPost", method =  RequestMethod.POST)
	public synchronized String insertPost(int bor_no, int emp_no, String title, String cont, Model model, MultipartHttpServletRequest fileList) {
		
		logger.debug("post{}", "post");
		
		
		BoardPostVo post = new BoardPostVo();
		
		post.setBor_no(bor_no);
		post.setEmp_no(emp_no);
		post.setTitle(title);
		post.setCont(cont);
		
		logger.debug("postVo:{}", post);
		
		
		int insertPost = boardService.insertPost(post);
		logger.debug("post:{}", post);	
		
		if(insertPost==1) {
			String file_nm = "";
			int post_no = boardService.maxPostNo();
			
			List<MultipartFile> files = fileList.getFiles("fileName");
			AttFileVo attFileVo = new AttFileVo();
			BoardPostFileVo postFileVo = new BoardPostFileVo();
			postFileVo.setPost_no(post_no);
			
			int file_no = 0;
			
			for(MultipartFile multiFile:files) {
				if(!multiFile.getOriginalFilename().equals("")){
					try {
						String uploadPath = "d:" + File.separator + "uploadFile/";
						
						File uploadDir = new File(uploadPath);
						
						if(!uploadDir.exists()) {
							uploadDir.mkdirs();
						}
						String FileExtension = FileUtil.getFileExtension(multiFile.getOriginalFilename());
						String fileRoute = uploadPath + UUID.randomUUID().toString() + FileExtension;
						file_nm = multiFile.getOriginalFilename();

						multiFile.transferTo(new File(fileRoute));

						attFileVo.setFile_nm(file_nm);
						attFileVo.setFile_route(fileRoute);
						attFileVo.setFile_size((int) multiFile.getSize());
						attFileService.registFile(attFileVo);
						file_no = attFileService.maxFileNo();
						postFileVo.setFile_no(file_no);
						boardService.insertPostFile(postFileVo);
					
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
			}
			logger.debug("insertPost{}", insertPost);
			
			
			return "redirect:/board/postDetail?post_no="+post_no;
		}else {
			return "board/insertPost";
		}
	}
	// 관리자 게시글 상세화면
	@RequestMapping(path = "postDetail", method = RequestMethod.GET)
	public String postDetail(int post_no, Model model) {

		List<BoardVo> board = boardService.selectBoard();
		
		BoardPostVo boardPost = new BoardPostVo();
		boardPost.setPost_no(post_no);
		
		boardService.hitsupdate(post_no);
		BoardPostVo boardPostVo = boardService.postDetail(boardPost);
		
		List<BoardVo> boardVo = boardService.selectBoard();
		List<Integer> postFileList = boardService.postFileList(post_no);
		List<AttFileVo> selectFile = new ArrayList<AttFileVo>();
		if(postFileList!=null) {
			for(int i = 0; i<postFileList.size(); i++){
				selectFile.add(boardService.selectFile(postFileList.get(i)));
			}
				
		}
		logger.debug("fileList:{}", selectFile);
		
		model.addAttribute("boardPost", boardPostVo);
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("FileList", selectFile);
		model.addAttribute("boardList", board);
		
		BoardCommVo vo = new BoardCommVo();
		vo.setPost_no(post_no);
		
		List<BoardCommVo> commList = boardService.selectComm(vo);
		model.addAttribute("commList", commList);
		
		return "tiles.board.postDetail";
	}
	
	
	
	@RequestMapping(path = "postListView", method = RequestMethod.GET)
	public String postListView(PageVo pageVo, int bor_no, Model model) {
		
		Map<String, Object> map = boardService.postListView(pageVo);
	
		List<BoardPostVo> postList = (List<BoardPostVo>)map.get("postList");
		
		
		int postCnt = (int)map.get("postCnt");
		int pagination = (int)Math.ceil((double) postCnt / pageVo.getPageSize());
		
		
		
		model.addAttribute("postList", postList);
		model.addAttribute("pagination", pagination); 
//		model.addAttribute("boardListView", boardListView);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("bor_nm",boardService.selectBorNm(bor_no));
		
		return "tiles.board.postList";
		
	}

	@RequestMapping(path = "modifyPost", method = RequestMethod.GET)
	public String modifyPost(int emp_no, int post_no, Model model) {
		
		Date date = new Date();
		
		BoardPostVo vo = new BoardPostVo();
		vo.setPost_no(post_no);
		vo.setEmp_no(emp_no);
		logger.debug("get:{}", "get");
		
		BoardPostVo boardPost =  boardService.selectPost(vo);
		
		model.addAttribute("boardPost", boardPost);
		model.addAttribute("date", date);

		List<Integer> postFileList = boardService.postFileList(post_no);
		List<AttFileVo> selectFile = new ArrayList<AttFileVo>();
		if (postFileList != null) {
			for (int i = 0; i < postFileList.size(); i++) {
				selectFile.add(boardService.selectFile(postFileList.get(i)));
			}

		}
		model.addAttribute("FileList", selectFile);
		
		return "tiles.board.modifyPost";
	}
	
	@RequestMapping(path = "modifyPost", method = RequestMethod.POST)
	public String modifyPost(BoardPostVo boardPostVo,  Model model, MultipartHttpServletRequest multiFile) {

		int updateCnt = boardService.modifyPost(boardPostVo);
		
		logger.debug("post:{}", "post");
		if(updateCnt == 1) {
			String file_nm = "";
			int post_no = boardService.maxPostNo();
			
			List<MultipartFile> files = multiFile.getFiles("fileName");
			AttFileVo attFileVo = new AttFileVo();
			BoardPostFileVo postFileVo = new BoardPostFileVo();
			postFileVo.setPost_no(post_no);
			
			int file_no = 0;
			
			for(MultipartFile multiFile1:files) {
				if(!multiFile1.getOriginalFilename().equals("")){
					try {
						String uploadPath = "d:" + File.separator + "uploadFile/";
						
						File uploadDir = new File(uploadPath);
						
						if(!uploadDir.exists()) {
							uploadDir.mkdirs();
						}
						String FileExtension = FileUtil.getFileExtension(multiFile1.getOriginalFilename());
						String fileRoute = uploadPath + UUID.randomUUID().toString() + FileExtension;
						file_nm = multiFile1.getOriginalFilename();

						multiFile1.transferTo(new File(fileRoute));

						attFileVo.setFile_nm(file_nm);
						attFileVo.setFile_route(fileRoute);
						attFileVo.setFile_size((int) multiFile1.getSize());
						attFileService.registFile(attFileVo);
						file_no = attFileService.maxFileNo();
						postFileVo.setFile_no(file_no);
						boardService.insertPostFile(postFileVo);
					
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
			}
	}
		int post_no = boardPostVo.getPost_no();
		
		return "redirect:/board/postDetail?post_no="+post_no;
	}
	
	// 파일 삭제
	@RequestMapping(path = "deletePostFile", method = RequestMethod.POST)
	public String deletePostFile(int file_no, Model model) {

		BoardPostFileVo vo = new BoardPostFileVo();
		vo.setFile_no(file_no);

		int deleteCnt = boardService.deletePostFile(vo);
		model.addAttribute("deleteCnt", deleteCnt);

		return "jsonView";
	}
	
	@RequestMapping(path = "deletePost", method = RequestMethod.POST)
	public String deletePost(int post_no, int bor_no) {
		
		BoardPostVo boardPost = new BoardPostVo();
		
		boardPost.setPost_no(post_no);
		boardPost.setBor_no(bor_no);
		
		logger.debug("post:{}",boardPost);
		int updateCnt = boardService.deletePost(boardPost);
		
		if(updateCnt == 1) {
			return "redirect:/board/postListView?bor_no="+bor_no;
			
		}else {
			return "redirect:/board/postDetail?post_no="+post_no;
		}
	}

		@RequestMapping(path="insertComm", method = RequestMethod.POST)
		public String insertComm(String cont,int emp_no, int post_no, String commcont) {
			
			BoardCommVo vo = new BoardCommVo();
			
			vo.setPost_no(post_no);
			vo.setEmp_no(emp_no);
			vo.setCont(cont);
			
//			logger.debug("post_no : {}", post_no );
//			logger.debug("emp_no : {}", emp_no );
//			logger.debug("cont : {}", cont );
			
			boardService.insertComm(vo);
			
			return "redirect:/board/postDetail?post_no="+post_no;
		
		}
		
		@RequestMapping(path = "deleteComm", method = RequestMethod.POST)
		public String deleteReply(int com_no, int emp_no, int post_no) {

			BoardCommVo vo = new BoardCommVo();
			
			vo.setCom_no(com_no);
			vo.setEmp_no(emp_no);
			vo.setPost_no(post_no);
			logger.debug("vo:{}", vo);
			int updateCnt = boardService.deleteComm(vo);

			return "redirect:/board/postDetail?post_no=" + post_no;

		}
		// 답글 등록
		@RequestMapping(path = "insertReply", method = RequestMethod.GET)
		public String insertReply(int post_no, int bor_no, Model model) {
			
			model.addAttribute("post_no", post_no);
			model.addAttribute("bor_no", bor_no);
			
			return "tiles.board.insertReply";
		}
		// 답글 등록
		@RequestMapping(path = "insertReply", method = RequestMethod.POST)
		public synchronized String insertReply(int higher_post_no, int bor_no, int emp_no, String title, String cont) {
			
			BoardPostVo postVo = new BoardPostVo();
			postVo.setPost_no(higher_post_no);
			postVo.setTitle(title);
			postVo.setCont(cont);
			postVo.setEmp_no(emp_no);
			postVo.setBor_no(bor_no);
			
			// 답글 대상 게시글
			postVo.setHigher_post_no(higher_post_no);
			
			int insertCnt = boardService.insertReply(postVo);
			
			if(insertCnt == 1) {
				int post_no = boardService.maxPostNo();
				return "redirect:/board/postDetail?post_no="+post_no;
				
			}else {
				
				return "redirect:/board/insertReply?post_no="+higher_post_no;
			}
			
		}
		// 파일 다운로드
		@RequestMapping("fileDownload")
		public void fileDownload(int file_no, HttpServletResponse resp) throws IOException {
			
			AttFileVo attFileVo = boardService.selectFile(file_no);
			
			
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
		
		// 팝업 등록창 띄우기
		@RequestMapping(path = "popUp", method = RequestMethod.GET)
		public String popUp(int post_no, Model model) {
			
			BoardPostVo vo = new BoardPostVo();
			vo.setPost_no(post_no);
			
			model.addAttribute("postVo", boardService.selectPost(vo));
			
		return "board/popUp";
		}
		
		@RequestMapping(path = "popUp", method = RequestMethod.POST)
		public String popUp(PopUpVo vo, Model model) {
//			int cnt= boardService.insertPopup(vo);
//			logger.debug("popup:{}",boardService.insertPopup(vo));
			
			model.addAttribute("cnt", boardService.insertPopup(vo));
			
			return "jsonView";
			
		}
		
		@RequestMapping(path = "popUpView", method = RequestMethod.GET)
		public String popUpView(int popup_no, Model model) {
			
			model.addAttribute("popUp", boardService.selectPopUpList(popup_no));
			
			return "board/popUpList";
		}
		
			
		
		@RequestMapping(path = "SearchPost", method = RequestMethod.GET)
		public String SearchPost(String page, String pageSize, String searchType, String keyword, Model model) {
			
			int PostPage = page == null ? 1 : Integer.parseInt(page);
			int PostPageSize = pageSize == null || pageSize.equals("") ? 5 : Integer.parseInt(pageSize);
			
			if(pageSize!=null) {
				pageSize = "";
			}
			if(searchType==null) {
				searchType="";
			}
			if(keyword==null) {
				keyword = "";
			}
			
			PageVo vo = new PageVo(PostPage, PostPageSize);
			vo.setKeyword(keyword);
			
			List<BoardPostVo> map = null;
			 if(searchType.equals("t")) {
				map = boardService.SearchPost(vo);
			}else if(searchType.equals("w")) {
				map = boardService.SearchPost(vo);
			}
			
			return "board/postListView";
		}
		
		
}
	