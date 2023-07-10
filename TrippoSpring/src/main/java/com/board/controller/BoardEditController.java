package com.board.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.model.PostVO;
import com.board.service.PostService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class BoardEditController {
	
	@Autowired
	private PostService pService;
	
	@RequestMapping(value="/editPost", method=RequestMethod.GET)
	public String boardShow(@RequestParam("postNo") int postNo, Model model) {
		PostVO postDetail = pService.getPostById(postNo);
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String postJson = objectMapper.writeValueAsString(postDetail);
			model.addAttribute("postJson", postJson);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}
		return "board/boardEdit";
	}// boardShow -------------------------------------------
	
	
	@ResponseBody
	@PostMapping(value="/editPostDone", produces="application/json")
	public ModelMap upload(@RequestParam(value="imageMapJson", required=false) String imageMapJson, @ModelAttribute PostVO post, HttpServletRequest request) {
		System.out.println("addPost 1");
		System.out.println("postNo" + post.getPostNo());
		Gson gson = new Gson();
		Map<String, Object> hashMap = gson.fromJson(imageMapJson, new TypeToken<Map<String, Object>>(){}.getType());

		Set<String> imgUrlsSet = new HashSet<>(); // 중복을 허용하지 않는 Set 자료구조 생성
		String original_str = (pService.getPostById(post.getPostNo())).getImgUrls();
		List<String> originalImages = new ArrayList<>(Arrays.asList(original_str.split(Pattern.quote(","))));
		System.out.println(originalImages);
		System.out.println("-------------------");
		if (imageMapJson!=null) {
			System.out.println("addPost 2");
			for (Map.Entry<String, Object> entry : hashMap.entrySet()) {
				System.out.println("addPost 3");
			    String file_name = entry.getKey();
			    Object img_uri = entry.getValue();
			    imgUrlsSet.add(file_name); // 중복을 허용하지 않는 Set에 파일 이름 추가
				System.out.println(file_name);
				if (originalImages.contains(file_name)) {
					originalImages.remove(file_name);
				}
				else {
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
					String path = request.getServletContext().getRealPath("/images/board/Upload");
					//post.setImgUrls(path);
					System.out.println("path: "+path);
					File file = new File(path);
					System.out.println("Image Saved Path :"+path);
					if(!file.exists()) {
						file.mkdirs();
					}
					File file2 = new File(path, file_name);
					System.out.println("addPost 4");
					try (OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(file2))) {
						System.out.println("addPost 5");
						outputStream.write(data);
					} catch (IOException e) {
						//e.printStackTrace();
					}//try n catch
				}
			}//for ----------
			
			for (String deleteImg:originalImages) {
				String delete_path = request.getServletContext().getRealPath("/images/board/Upload/"+deleteImg);
				File fileToDelete = new File(delete_path);
				if(fileToDelete.exists()) {
					boolean deleted = fileToDelete.delete();
					if (deleted) {
		                System.out.println("File deleted successfully.");
		            } else {
		                System.out.println("Failed to delete the file.");
		            }
				} else {
		            System.out.println("File does not exist.");
		        }
			}

			// Set을 콤마로 구분된 문자열로 변환하여 post에 설정
			String imgUrls = String.join(",", imgUrlsSet);
			post.setImgUrls(imgUrls);
			System.out.println("URLS"+imgUrls);
			
			// 나머지 코드는 그대로 유지
			System.out.println("addPost 6");
			int n = pService.updatePost(post);
			
			ModelMap map = new ModelMap();
			map.put("result", "SUCCESS");
			return map;
		}//if------
		else {
			System.out.println("addPost 7");
			ModelMap map = new ModelMap("result", "Failed");
			return map;
		}
		
	}// EDIT ================================================================
}
