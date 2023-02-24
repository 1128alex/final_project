package com.univ.board.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.univ.board.dao.BoardDAO;
import com.univ.board.model.Post;
import com.univ.board.model.PostUserCombined;
import com.univ.common.FileManagerService;
import com.univ.user.model.User;

import jakarta.servlet.http.HttpSession;

@Service
public class BoardBO {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private FileManagerService fileManagerService;

	public int addPost(int classId, String title, String content, List<MultipartFile> files, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String email = user.getEmail();

		String filePath = "";
		if (files != null) {
			for (MultipartFile file : files) {
				filePath += fileManagerService.saveFile(email, file) + " ";
			}
		} else {
			filePath = null;
		}

		Post post = new Post();
		post.setWriterEmail(email);
		post.setClassId(classId);
		post.setTitle(title);
		post.setContent(content);
		post.setFilePath(filePath);

		return boardDAO.insertPost(post);
	}

	public List<PostUserCombined> getPostListByClassId(int classId) {
		return boardDAO.selectPostListByClassId(classId);
	}
}
