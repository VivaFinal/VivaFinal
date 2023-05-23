package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.SourceFileInfo;
import web.service.face.FileUploadService;

@Controller
public class FileUploadController {
	
	@Autowired FileUploadService fileUploadService;
	
	
	
	//·Î±×°´Ã¼ 
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/file/test")
	public void main() {
		
	}
	
	
	@GetMapping("/file/fileupsource")
	public void FileUpSource() {
		logger.info("/file/fileupsource [GET]");
		
	}
	
	@PostMapping("/file/fileupsource")
	public String FileUpSourcePost(SourceFileInfo sourceFileInfo) {
		logger.info("/file/fileupsource [Post]");
		
		return "redirect:/source/view";
	}
	

	@GetMapping("/file/fileuppack")
	public void FileUpPack() {
		logger.info("/file/fileuppack [GET]");
		
	}
	
	@PostMapping("/file/fileupepack")
	public String FileUpPackPost(SourceFileInfo sourceFileInfo) {
		logger.info("/file/fileuppack [Post]");
		
		return "redirect:/source/view";
	}
	
	
	

}
