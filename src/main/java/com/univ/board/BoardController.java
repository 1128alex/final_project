package com.univ.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.univ.board.bo.BoardBO;
import com.univ.board.model.CommentUserCombined;
import com.univ.board.model.PostUserCombined;
import com.univ.course.bo.CourseBO;
import com.univ.course.model.ClassCourseCombined;
import com.univ.user.model.User;

@RequestMapping("/univ/board")
@Controller
public class BoardController {
	@Autowired
	private CourseBO courseBO;
	@Autowired
	private BoardBO boardBO;

	@GetMapping("/post_list")
	public String postListView(@RequestParam("classId") int classId, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("type", user.getType());

		if (user.getType().equals("student")) {
			List<ClassCourseCombined> combinedList = courseBO.getClassCourseListByEmail(user.getEmail());
			model.addAttribute("combinedList", combinedList);
		} else if (user.getType().equals("professor")) {
			List<ClassCourseCombined> combinedList = courseBO.getCombinedListByEmail(user.getEmail());
			model.addAttribute("combinedList", combinedList);
		}

		if (classId == 0) {
			if (user.getType().equals("student")) {
				List<PostUserCombined> postList = boardBO.getBoardListByEmail(user.getEmail());
				model.addAttribute("postList", postList);
			} else if (user.getType().equals("professor")) {
				List<PostUserCombined> postList = boardBO.getBoardListByEmailProf(user.getEmail());
				model.addAttribute("postList", postList);
			}
		} else {
			List<PostUserCombined> postList = boardBO.getBoardListByClassId(classId);
			model.addAttribute("postList", postList);
		}

		model.addAttribute("classId", classId);
		model.addAttribute("view", "board/postList");

		return "template/layout";
	}

	@GetMapping("/add_post")
	public String addPostView(@RequestParam("classId") int classId, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");

		if (user.getType().equals("student")) {
			List<ClassCourseCombined> combinedList = courseBO.getClassCourseListByEmail(user.getEmail());
			model.addAttribute("combinedList", combinedList);
		} else if (user.getType().equals("professor")) {
			List<ClassCourseCombined> combinedList = courseBO.getCombinedListByEmail(user.getEmail());
			model.addAttribute("combinedList", combinedList);
		}

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

		model.addAttribute("classId", classId);
		model.addAttribute("postList", postList);
		model.addAttribute("postCombined", postCombined);
		model.addAttribute("commentList", commentList);
		model.addAttribute("view", "board/postDetail");

		return "template/layout";
	}
}
