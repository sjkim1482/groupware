package com.wedul.pdf;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.StringReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import kr.or.ddit.groupware.approval.controller.AppController;
import kr.or.ddit.groupware.approval.model.AppLineVo;
import kr.or.ddit.groupware.approval.model.AppVo;
import kr.or.ddit.groupware.approval.service.AppService;
import kr.or.ddit.groupware.model.AttFileVo;
import kr.or.ddit.groupware.model.EmpVo;
import kr.or.ddit.groupware.service.EmpService;
import kr.or.ddit.groupware.service.PmsService;

@Component
public class PDFView extends AbstractITextPdfView {

	private static final Logger logger = LoggerFactory.getLogger(AppController.class);
	
	@Resource(name="appService")
	private AppService appService;

	@Resource(name="empService")
	private EmpService empService;
	
	@Resource(name="pmsService")
	private PmsService pmsService;
	
    @SuppressWarnings({ "static-access", "deprecation", "unchecked" })
    protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	//7버전사용
//    	writer = PdfWriter.getInstance(document, response.getOutputStream());
        // Document 오픈
        document.open();
        XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
        
        // CSS
    	CSSResolver cssResolver = new StyleAttrCSSResolver();
    	CssFile cssFile = XMLWorkerHelper.getInstance().getCSS(new FileInputStream(PDFView.class.getClassLoader().getResource("pdf.css").getPath()));
    	cssResolver.addCss(cssFile);
    	     
    	// HTML, 폰트 설정
    	XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
//    	fontProvider.register(PDFView.class.getClassLoader().getResource("malgun.ttf").getPath(), "MalgunGothic"); // MalgunGothic은 alias,
    	fontProvider.register("D:/A_TeachingMaterial/6.JspSpring/workspace/groupware/src/main/resources/malgun.ttf", "MalgunGothic"); // MalgunGothic은 alias,
//    	 BaseFont baseFont = BaseFont.createFont(
//					"D:/A_TeachingMaterial/6.JspSpring/workspace/groupware/src/main/resources/malgun.ttf",
//                 BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
    	
    	CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
    	



    	HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
    	htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
    	 
        // 파일 다운로드 설정
        response.setContentType("application/pdf");
        String fileName = URLEncoder.encode("한글파일명", "UTF-8"); // 파일명이 한글일 땐 인코딩 필요
        response.setHeader("Content-Transper-Encoding", "binary");
        response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");
              
        // Pipelines
        PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
        HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
        CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
         
        XMLWorker worker = new XMLWorker(css, true);
        XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
         
        String app_char = request.getParameter("app_char");
        String app_type = request.getParameter("app_type");
    	logger.debug("app_char : {}",app_char);
    	
    	AppVo appVo = appService.appDetail(app_char);
		
		appVo.setCont(appService.appCont(app_char));
		
		appVo.setTurn_rea(appService.appTurnRea(app_char));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String reg_dt= "";
		String s_dt= "";
		String e_dt= "";
		
		if(appVo.getReg_dt()!=null) {
			reg_dt = sdf.format(appVo.getReg_dt());
		}
		if(appVo.getS_dt()!=null) {
			s_dt = sdf.format(appVo.getS_dt());
		}
		if(appVo.getE_dt()!=null) {
			e_dt = sdf.format(appVo.getE_dt());
		}
		
		int turnReaCheck = 0;
		
		if(appVo.getTurn_rea()!=null) {
			turnReaCheck = 1;
		}
		
		List<AppLineVo> appLineList = appService.appDetailLine(app_char);

		List<EmpVo> empList = new ArrayList<EmpVo>();
		if(appVo.getApp_det_no()==4) {
			int pms_no = pmsService.selectPmsNo(app_char);
			List<Integer> empNoList = pmsService.selectPsmEmpList(pms_no);
	
			for(int i = 0; i<empNoList.size(); i++) {
				empList.add(empService.selectEmpDetail(empNoList.get(i)));
			}
//			model.addAttribute("psmEmpList", empList);
		}
        logger.debug("pdf empList : {} ", empList);
        
        
		appVo.setCont(appVo.getCont().replaceAll("<br>", "<br></br>"));
		
        // 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
        String htmlStr = "<html><head></head><body style='font-family:MalgunGothic;'>"
	        		+ "<div style='width:100%; padding:10px; background:white;'>"
	        		+ "<h3>"+app_type+"</h3>"
	        		+ "<hr></hr>"
	        		+   "<br/>"
	        		+ 	"<div style='float:right;'>"
	        		+ 		"<table>"
	        		+ 			"<tr style='height:30px;'>"
	        		+ 				"<th rowspan='2' style='height: 90px;width: 50px; text-align: center; background-color: #CECEF6;'>결재</th>";
        								for(int i = 0; i<appLineList.size(); i++) {
        									htmlStr	+= "<td style='width:  90px; background-color: #CECEF6; text-align: center;'><span id='co_nm1'>"+appLineList.get(i).getCd_ko_nm() +"</span></td>";
        								}
        	htmlStr	+= 			"</tr>"
	        		+ 			"<tr style='height:80px;'>";
							        	for(int i = 0; i<appLineList.size(); i++) {
											htmlStr	+= "<td style='width:  90px; text-align: center;'><span>";
											if(appLineList.get(i).getApp_step()==1) {
												htmlStr	+= "<img alt='상신' src='http://127.0.0.1/image/submission.JPG'></img>";
											}else if(appLineList.get(i).getApp_cd()==301) {
												htmlStr	+= "<img alt='상신' src='http://127.0.0.1/image/acknowledgment.JPG'></img>";
											}else if(appLineList.get(i).getApp_cd()==304) {
												htmlStr	+= "<img alt='상신' src='http://127.0.0.1/image/predecessor.JPG'></img>";
											}
											
											htmlStr	+= "<br></br>"+appLineList.get(i).getKo_nm()+"</span></td>";
										}
							        	
        	
       		htmlStr	+= 			"</tr>"
	        		+ 		"</table>"
	        		
	        		+ 	"<br style='clear:both;'/>"
	        		+   "<br/>"
	        		+ 	"</div>"
	        		
	        			
	        		+   "<br/>"
	        		+ 	"<div>"
	        		+ 		"<table style='width:100%;'>"
	        		+ 			"<tr>"
	        		+ 				"<th style='text-align: center; width: 10%; height: 30px; background-color: #D8D8D8;' colspan='1'><strong>문서번호</strong></th>"
	        		+ 				"<td colspan='7' style='width: 90%;'><div style='margin-left: 10px'> "+appVo.getApp_char()+"</div></td>"
	        		+ 			"</tr>"
	        		+ 			"<tr>"
	        		+ 				"<th style='text-align: center; width: 10%; height: 30px; background-color: #D8D8D8;' colspan='1'><strong>기안부서</strong></th>"
	        		+ 				"<td colspan='7'><div style='margin-left: 10px'> "+appVo.getDept_nm()+" </div></td>"
	        		+ 			"</tr>"
	        		+ 			"<tr>"
	        		+ 				"<th style='text-align: center; width: 10%; height: 30px; background-color: #D8D8D8;' colspan='1'><strong>기안자</strong></th>"
	        		+ 				"<td colspan='7'><div style='margin-left: 10px'> "+appVo.getKo_nm()+" </div></td>"
	        		+ 			"</tr>"
	        		+ 			"<tr>"
	        		+ 				"<th style='text-align: center; width: 10%; height: 30px; background-color: #D8D8D8;' colspan='1'><strong>기안날짜</strong></th>"
	        		+ 				"<td colspan='7'><div style='margin-left: 10px'> "+reg_dt+" </div></td>"
	        		+ 			"</tr>";
       					
       				if(appVo.getApp_det_no()==2) {
       					htmlStr	+=  "<tr>"
			       				+ 	"<th style='text-align: center; height: 30px; background-color: #D8D8D8;' height='20'><strong>기간</strong></th>"
			       				+ 	"<td colspan='7'><div style='margin-left: 10px'> 시작일 : "+s_dt+" / 종료일 : "+e_dt+"</div></td>"
			       				+ "</tr>";
					       
       				}
       				
       				if(appVo.getApp_det_no()==4) {
       					htmlStr	+= "<tr>"
			       				+ 	"<th style='text-align: center; height: 30px; background-color: #D8D8D8;' height='20'><strong>기간</strong></th>"
			       				+ 	"<td colspan='7'><div style='margin-left: 10px'> 시작일 : "+s_dt+" / 종료일 : "+e_dt+"</div></td>"
			       				+ "</tr>"
					       		+ "<tr>"
					       		+ 	"<th style='text-align: center; height: 30px; background-color: #D8D8D8;' height='20'><strong>참여자</strong></th>"
					       		+ "<td colspan='7'><div style='margin-left: 10px'>";
					       		for(int i = 0; i<empList.size(); i++) {
					       			
					       		
					       			htmlStr	+=	" ["+empList.get(i).getDept_nm()+" / "+empList.get(i).getPo_nm()+" / "+empList.get(i).getKo_nm()+"]  ";
					       		}
					    htmlStr	+= "</div></td></tr>";
       				}
			       		
       							
	       				htmlStr	+= "<tr>"
	       						+ 		"<th style='text-align: center; height: 30px; background-color: #D8D8D8;'><strong>제목</strong></th>"
	       						+ 		"<td colspan='7'><div style='margin-left: 10px'>"+appVo.getTitle()+"</div></td>"
	       						+ "</tr>"
	       						+ "<tr>"
	       						+ 		"<th style='text-align: center; height: 500px; background-color: #D8D8D8;'><strong>내용</strong></th>"
	       						+ 		"<td colspan='7' align='left' valign='top'><div style='margin-left: 10px'>"+appVo.getCont()+"</div></td>"
	       						+ "</tr>";

	   
					
					
					htmlStr	+= 		"</table>"
	        		+ 	"</div>"
	        		
	        		
	        		+ "</div>"
	                + "</body></html>";
	         
			    	
//		HtmlConverter.convertToPdf(htmlStr, response.getOutputStream(), null);			
			
		StringReader strReader = new StringReader(htmlStr);
		xmlParser.parse(strReader);
		
         
        document.close();
        writer.close();
        
    }
    
}