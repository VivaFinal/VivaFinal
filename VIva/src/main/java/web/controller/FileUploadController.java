package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.SourceImgInfo;
import web.dto.Tag;
import web.service.face.FileUploadService;

@Controller
public class FileUploadController {
	
	@Autowired FileUploadService fileUploadService;
	
	
	
	//로그객체 
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//테스트용 jsp파일입니다 
	@RequestMapping("/file/test1")
	public void test1() {
		
	}
	
	@RequestMapping("/file/test2")
	public void test2() {
		
	}
	
	@RequestMapping("/file/test3")
	public void test3() {
		
	}
	
	@RequestMapping("/file/test4")
	public void test4() {
		
	}
	
	@RequestMapping("/file/test5")
	public void test5() {
		
	}
	
	@RequestMapping("/file/test6")
	public void test6() {
		
	}
	
	
	@GetMapping("/file/fileupsource")
	public void FileUpSource() {
		logger.info("/file/fileupsource [GET]");
		
	}
	
	@PostMapping("/file/fileupsource")
	public String FileUpSourcePost(
			Source source,
			SourceFileInfo sourceFileInfo,
			SourceImgInfo sourceImgInfo
			) {
		logger.info("/file/fileupsource [Post]");
		
		fileUploadService.SourceUploadSource(source);
		fileUploadService.SourceUploadFile(sourceFileInfo);
		fileUploadService.SourceUploadImg(sourceImgInfo);
		
		
		
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
