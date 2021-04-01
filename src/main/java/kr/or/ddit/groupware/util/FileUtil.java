package kr.or.ddit.groupware.util;

public class FileUtil {
	
	public static String getFileName(String contentDisposition) {
		
		String[] temps = contentDisposition.split("; ");
		String fileName = "";
		
		for(String temp : temps) {
			if(temp.trim().startsWith("filename")) {
//				temp = temp.replace("filename", "");
//				temp.substring(1,temp.length()-1);
				String[] file = temp.split("=");
				fileName=file[1].replaceAll("\"", "");
				
			}
		}
		
		return fileName;
	}
	
	public static String getFileExtension(String fileName) {
		String[] temps = fileName.split("\\.");
		String file = temps[temps.length-1];
		
		//line.brown.png
//		fileName.substring(fileName.lastIndexOf(".")+1);
		if(fileName.indexOf(".")==-1) {
			return "";
		}
		
 		return "."+fileName.substring(fileName.lastIndexOf(".")+1);
	}
	
	
	
}
