package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.SourceImgInfo;
import web.service.face.FileUploadService;

@Controller
public class FileUploadController {
	
	@Autowired FileUploadService fileUploadService;
	
	
	
	//로그객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	
	@RequestMapping("/file/sourcelist")
	public void sourceview(Model model) {
		logger.info("/file/sourcelist GET");
		
		List<Source> list = fileUploadService.getSourceList();
		
		model.addAttribute("list", list);
	}
	
	
	@GetMapping("/file/fileupsource")
	public void FileUpSource() {
		logger.info("/file/fileupsource [GET]");
		
	}
	
	@PostMapping("/file/fileupsource")
	public String FileUpSourcePost(
			Source source,
			MultipartFile imgfile,
			MultipartFile file
			) {
		logger.info("/file/fileupsource [Post]");
		
		fileUploadService.SourceUpload(source,imgfile,file);
		
		return "redirect:/file/sourcelist";
		
	}
	

	@GetMapping("/file/fileuppack")
	public void FileUpPack() {
		logger.info("/file/fileuppack [GET]");
		
	}
	
	@PostMapping("/file/fileuppack")
	public String FileUpPackPost(SourceFileInfo sourceFileInfo) {
		logger.info("/file/fileuppack [Post]");
		
		return "redirect:/source/view";
	}
	
	

}
