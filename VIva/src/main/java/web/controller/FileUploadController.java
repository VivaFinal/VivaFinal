package web.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Pack;
import web.dto.PackImgInfo;
import web.dto.Source;
import web.dto.SourceFileInfo;
import web.dto.Tag;
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
	@RequestMapping("/file/test6")
	public void test6() {
		
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
//			Tag tag,
			Source source,
			MultipartFile imgfile,
			MultipartFile file,
			Model model,
			String genre,
			String instrument,
			String detail,
			String scape,
			String fx,
			String key,
			String sourceName,
			String sourceTime,
			int bpm
			) {
		logger.info("/file/fileupsource [Post]");
		
		logger.info("genre {}", genre);
		
		
		//첫번째 방법
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonObject = null;
		
		Tag tag = null;
		Source source1 = null;
		
		try {
			jsonObject = (JSONArray) jsonParser.parse(genre);
			genre = ((JSONObject) jsonObject.get(0)).get("value").toString();
			
			jsonObject = (JSONArray) jsonParser.parse(instrument);
			instrument = ((JSONObject) jsonObject.get(0)).get("value").toString();

			jsonObject = (JSONArray) jsonParser.parse(detail);
			detail = ((JSONObject) jsonObject.get(0)).get("value").toString();
			
			jsonObject = (JSONArray) jsonParser.parse(scape);
			scape = ((JSONObject) jsonObject.get(0)).get("value").toString();
			
			jsonObject = (JSONArray) jsonParser.parse(fx);
			fx = ((JSONObject) jsonObject.get(0)).get("value").toString();
			
			jsonObject = (JSONArray) jsonParser.parse(key);
			key = ((JSONObject) jsonObject.get(0)).get("value").toString();

			
			
			//tag에다가 위에 있는 값 집어넣기 
			//int형은 뭘 넣든간에 insert가 되는 값으로 들어가는거같음 
			tag = new Tag(0, instrument, genre, scape, detail, fx);
			source1 = new Source(0,sourceName,bpm,key,0,0,0,0,sourceTime);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}

//		logger.info("genre {}", genre);
//		logger.info("instrument {}", instrument);
//		logger.info("detail {}", detail);
//		logger.info("scape {}", scape);
//		logger.info("fx {}", fx);

		logger.info("tag {}", tag);
		logger.info("*******key의 값 입니다! : {}",key);
		logger.info("*******source1의 값 : {}",source1);
		fileUploadService.SourceUpload(tag,source1,imgfile,file);
		
//		try {
////			jsonObject = (JSONObject) jsonParser.parse(jsonStr);
//
//			jsonArray = (JSONArray) jsonParser.parse(genre);
//			genre = ((JSONObject)jsonArray.get(0)).get("value").toString();
//			
//			jsonObject = (JSONObject) jsonParser.parse(instrument);
//			jsonObject.get("value");
//			
//			jsonObject = (JSONObject) jsonParser.parse(detail);
//			jsonObject.get("value");
//			
//			jsonObject = (JSONObject) jsonParser.parse(scape);
//			jsonObject.get("value");
//			
//			jsonObject = (JSONObject) jsonParser.parse(fx);
//			jsonObject.get("value");
//			
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
		
		
//		Tag tag2 = new Tag(
//				0, jsonObject.get("genre").toString(),
//				jsonObject.get("instrument").toString(),
//				jsonObject.get("scape").toString(),
//				jsonObject.get("detail").toString(),
//				jsonObject.get("fx").toString()
//				);
		
//		logger.info("tag2의값 : {}",tag2);
		//----------------------------------------------------
//		//두번째방법
//		
//		//json형태으로 만든다
//		JSONObject jsonObj = new JSONObject();
//		jsonObj.put("genre", genre);
//		jsonObj.put("instrument", instrument);
//		jsonObj.put("scape", scape);
//		jsonObj.put("detail", detail);
//		jsonObj.put("fx", fx);
//		
//		//json형식을 문자열로 변환(전송하기위해서)
//		String jsonStr = jsonObj.toString();
//
//
//		//문자열로 받은 json을 json형태로 변환
//		JSONParser parser = new JSONParser();
//		JSONObject jsonObj = new JSONObject();
//		try {
//			jsonObj = (JSONObject) parser.parse(jsonStr);
//			String genre = (String) jsonObj.get("genre");
//			String instrument = (String) jsonObj.get("instrument");
//			String scape = (String) jsonObj.get("scape");
//			String detail = (String) jsonObj.get("detail");
//			String fx = (String) jsonObj.get("fx");
//			
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
		
//		return "redirect:/file/sourcelist";
		return "test";
		
	}
	

	@GetMapping("/file/fileuppack")
	public void FileUpPack() {
		logger.info("/file/fileuppack [GET]");
		
	}
	
	@PostMapping("/file/fileuppack")
	public String FileUpPackPost(
			List<MultipartFile> packFileList, 
//			List<SourceFileInfo> sourceInfoList,
			MultipartFile packImg,
			Pack pack,
			Tag tag
			) {
		logger.info("/file/fileuppack [Post]");
		
		fileUploadService.uploadPack(packFileList,
//				sourceInfoList,
				packImg,pack,tag);
		
		
		return "redirect:/source/view";
	}
	


	

}
