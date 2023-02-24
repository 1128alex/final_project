package com.univ.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.univ.board.bo.BoardBO;
import com.univ.board.model.CommentUserCombined;
import com.univ.board.model.PostUserCombined;

@RequestMapping("/univ/board")
@Controller
public class BoardController {
	@Autowired
	private BoardBO boardBO;

	@GetMapping("/post_list")
	public String postListView(@RequestParam("classId") int classId, Model model) {

		List<PostUserCombined> postList = boardBO.getPostListByClassId(classId);

		model.addAttribute("postList", postList);
		model.addAttribute("classId", classId);
		model.addAttribute("view", "board/postList");

		return "template/layout";
	}

	@GetMapping("/add_post")
	public String addPostView(@RequestParam("classId") int classId, Model model) {

		model.addAttribute("classId", classId);
		model.addAttribute("view", "board/addPost");

		return "template/layout";
	}

	@GetMapping("/post_detail")
	public String postDetailView(@RequestParam("classId") int classId, @RequestParam("postId") int postId,
			Model model) {

		PostUserCombined postCombined = boardBO.getPostByClassIdPostId(classId, postId);
		List<PostUserCombined> postList = boardBO.getPostListByClassId(classId);
		List<CommentUserCombined> commentList = boardBO.getCommentListByClassIdPostId(classId, postId);

		model.addAttribute("postList", postList);
		model.addAttribute("postCombined", postCombined);
		model.addAttribute("commentList", commentList);
		model.addAttribute("view", "board/postDetail");

		return "template/layout";
	}
}
