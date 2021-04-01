package com.wedul.pdf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("pdf")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	 
//	@RequestMapping(value = "/download/pdf", method = RequestMethod.GET)
	@RequestMapping(path = "pdfDownload", method = RequestMethod.GET)
	public ModelAndView downloadPdf(String app_char,String app_type,Model model) {
	  ModelAndView modelAndView = new ModelAndView("pdfView", "fileName", "test.pdf");
	  
	  model.addAttribute("app_char", app_char);
	  model.addAttribute("app_type", app_type);
	  
	  return modelAndView;
	}
	
}
