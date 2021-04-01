package kr.or.ddit.qrattend;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class QRCodeView extends AbstractView{

	 public QRCodeView() {
	        
	        setContentType("image/png; charset=UTF-8");
	    }

	   @Override
	   protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req,
	         HttpServletResponse resp) throws Exception {
	      resp.setContentType(getContentType());
	        
	        String userAgent = req.getHeader("User-Agent");
	        boolean ie = userAgent.indexOf("MSIE") > -1;
	       
	        String fileName = "QRCode.png";
	       
	        if(ie){
	                fileName = URLEncoder.encode(fileName, "UTF-8");
	        }else{
	                fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
	        }
	       
	        resp.setHeader("Content-Transfer-Encoding", "binary");
	       
	        OutputStream out = resp.getOutputStream();
	       
	        QRCodeWriter qrCodeWriter = new QRCodeWriter();
	        String text = (String)model.get("content");
	        text = new String(text.getBytes("UTF-8"), "ISO-8859-1");
	        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, 200, 200);
	       
	        MatrixToImageWriter.writeToStream(bitMatrix, "png", out);
	      
	        out.flush();
	      
	   }

}
