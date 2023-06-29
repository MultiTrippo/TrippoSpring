package com.board.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.board.model.PostVO;
import com.board.service.PostService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardAddController {

	@Autowired
	private PostService pService;
	
	//@GetMapping("/addPost")
	//@RequestMapping(value="/addPost", method=RequestMethod.GET)
	@RequestMapping(value="/addPost", method=RequestMethod.GET)
	public String boardAdd() {
		return "board/boardAdd"; 
	}
	//https://memory-develo.tistory.com/148
	@PostMapping(value="/addPost")
	public String upload(@ModelAttribute PostVO post, @RequestParam("multiFile") List<MultipartFile> multiFileList, HttpServletRequest request) {
		log.info("post check: "+post);
		
		int n=pService.createPost(post);
		return"redirect:boardList";
	}
	
	@RequestMapping("/addPost")
	public String callJson(HttpServletRequest request) {
		String filePath="/Users/minjikang/git/TrippoSpring/TrippoSpring/src/main/webapp/resources/board/cityInfo.json";
		String jsonString = "";
        try {
            BufferedReader reader = new BufferedReader(new FileReader(filePath));
            String line;
            while ((line = reader.readLine()) != null) {
                jsonString += line;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        request.setAttribute("cityInfo", jsonString);
		return "board/boardAdd";
	}
	
	
	@PostMapping("/multi-file")
	public void multiFileUpload(@RequestParam("multiFile") List<MultipartFile> multiFileList, @RequestParam String fileContent, HttpServletRequest request) {
		
		// 받아온것 출력 확인
		System.out.println("multiFileList : " + multiFileList);
		System.out.println("fileContent : " + fileContent);
		
		// path 가져오기
		String path = request.getSession().getServletContext().getRealPath("resources");
		String root = path + "\\" + "uploadFiles";
		
		File fileCheck = new File(root);
		
		if(!fileCheck.exists()) fileCheck.mkdirs();
		
		
		List<Map<String, String>> fileList = new ArrayList<>();
		
		for(int i = 0; i < multiFileList.size(); i++) {
			String originFile = multiFileList.get(i).getOriginalFilename();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;
			
			
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);
			
			fileList.add(map);
		}
		
		
		// System.out.println(fileList);
		
		// 파일업로드
		try {
			for(int i = 0; i < multiFileList.size(); i++) {
				File uploadFile = new File(root + "\\" + fileList.get(i).get("changeFile"));
				multiFileList.get(i).transferTo(uploadFile);
			}
			
			System.out.println("다중 파일 업로드 성공!");
			
		} catch (IllegalStateException | IOException e) {
			System.out.println("다중 파일 업로드 실패 ㅠㅠ");
			// 만약 업로드 실패하면 파일 삭제
			for(int i = 0; i < multiFileList.size(); i++) {
				new File(root + "\\" + fileList.get(i).get("changeFile")).delete();
			}
			
			
			e.printStackTrace();
		}
		
	}
	
	
}
