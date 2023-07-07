package com.board.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.model.PostVO;
import com.board.service.PostService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

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

	@ResponseBody
	@PostMapping(value="/addPost", produces="application/json")
	public ModelMap upload(@RequestParam(value="hashMapJson", required=false) String hashMapJson, @ModelAttribute PostVO post, HttpServletRequest request) {
		System.out.println("addPost 1");
		
		Gson gson = new Gson();
		Map<String, Object> hashMap = gson.fromJson(hashMapJson, new TypeToken<Map<String, Object>>(){}.getType());

		Set<String> imgUrlsSet = new HashSet<>(); // 중복을 허용하지 않는 Set 자료구조 생성

		if (hashMapJson!=null) {
			System.out.println("addPost 2");
			for (Map.Entry<String, Object> entry : hashMap.entrySet()) {
				System.out.println("addPost 3");
			    String file_name = entry.getKey();
			    Object img_uri = entry.getValue();
			    imgUrlsSet.add(file_name); // 중복을 허용하지 않는 Set에 파일 이름 추가
				
				String[] strings = ((String) img_uri).split(",");
				String extension;
				switch (strings[0]) {//check image's extension
	            case "data:image/jpeg;base64":
	                extension = "jpeg";
	                break;
	            case "data:image/png;base64":
	                extension = "png";
	                break;
	            default://should write cases for more images types
	                extension = "jpg";
	                break;
				} //switch
				//convert base64 string to binary data
				byte[] data = DatatypeConverter.parseBase64Binary(strings[1]);
				String path = request.getServletContext().getRealPath("/images/board/Upload/"+file_name);
				//post.setImgUrls(path);
				System.out.println("path: "+path);
				File file = new File(path);
				System.out.println("Image Saved Path :"+path);
				if(!file.exists()) {
					file.mkdirs();
				}
				
				System.out.println("addPost 4");
				try (OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(file))) {
					System.out.println("addPost 5");
					outputStream.write(data);
				} catch (IOException e) {
					e.printStackTrace();
				}//try n catch
			}//for ----------

			// Set을 콤마로 구분된 문자열로 변환하여 post에 설정
			String imgUrls = String.join(",", imgUrlsSet);
			post.setImgUrls(imgUrls);
			
			// 나머지 코드는 그대로 유지
			System.out.println("addPost 6");
			int n = pService.createPost(post);
			
			ModelMap map = new ModelMap();
			map.put("result", "success");
			map.put("url","/boardList");
			return map;
		}//if------
		else {
			System.out.println("addPost 7");
			ModelMap map = new ModelMap("result", "fail");
			return map;
		}
		
	}//upload ///////

}//////////////////////
