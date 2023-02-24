package com.univ.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.univ.board.bo.BoardBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/board")
@RestController
public class BoardRestController {

	@Autowired
	private BoardBO boardBO;

	@PostMapping("/add_post")
	public Map<String, Object> addPost(@RequestParam("classId") int classId, @RequestParam("title") String title,
			@RequestParam(value = "content", required = false) String content,
			@RequestParam(value = "files", required = false) List<MultipartFile> files, HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		int rowCount = boardBO.addPost(classId, title, content, files, session);

		if (rowCount == 1) {
			result.put("code", 1);
		} else {
			result.put("code", 500);
			result.put("errorMessage", "Error while creating post.");
		}

		return result;
	}
}
