package com.board.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.board.model.PostVO;
import com.board.service.PostService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BoardAddController extends HttpServlet{

	@Autowired
	private PostService pService;
	
	@RequestMapping(value="/addPost", method=RequestMethod.GET)
	public String boardAdd() {
		return "board/boardAdd"; 
	}

	@PostMapping(value="/addPost")
	public String upload(@ModelAttribute PostVO post, @RequestParam("multiFile") List<MultipartFile> multiFileList, HttpServletRequest request) {
		log.info("post check: " + post);
		
		int n = pService.createPost(post);
		
		// 파일 업로드 처리
		String path = request.getServletContext().getRealPath("/resources/uploadFiles");
		File fileCheck = new File(path);
		if (!fileCheck.exists())
			fileCheck.mkdirs();
		
		List<Map<String, String>> fileList = new ArrayList<>();
		
		for (MultipartFile multiFile : multiFileList) {
			String originFile = multiFile.getOriginalFilename();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;
			
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);
			
			fileList.add(map);
			
			// 파일 업로드
			try {
				File uploadFile = new File(path + File.separator + changeFile);
				multiFile.transferTo(uploadFile);
				log.info("파일 업로드 성공: " + uploadFile.getAbsolutePath());
			} catch (IllegalStateException | IOException e) {
				log.error("파일 업로드 실패: " + e.getMessage());
				// 업로드 실패 시 파일 삭제
				for (Map<String, String> fileMap : fileList) {
					File uploadedFile = new File(path + File.separator + fileMap.get("changeFile"));
					if (uploadedFile.exists()) {
						if (uploadedFile.delete()) {
							log.info("업로드된 파일 삭제 성공: " + uploadedFile.getAbsolutePath());
						} else {
							log.error("업로드된 파일 삭제 실패: " + uploadedFile.getAbsolutePath());
						}
					}
				}
				
				e.printStackTrace();
			}
		}
		
		return "redirect:/boardList";
	}
}
