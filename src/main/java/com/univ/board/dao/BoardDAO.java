package com.univ.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.board.model.Comment;
import com.univ.board.model.CommentUserCombined;
import com.univ.board.model.Post;
import com.univ.board.model.PostUserCombined;

@Repository
public interface BoardDAO {
	public int insertPost(Post post);

	public List<PostUserCombined> selectPostListByClassId(int classId);

	public PostUserCombined selectPostByClassIdPostId(@Param("classId") int classId, @Param("postId") int postId);

	public int insertComment(Comment comment);

	public List<CommentUserCombined> selectCommentListByClassIdPostId(@Param("classId") int classId,
			@Param("postId") int postId);

	public List<PostUserCombined> selectBoardListByEmail(@Param("email") String email, @Param("pageNum") int pageNum);

	public int selectCountBoardListByEmail(String email);

	public List<PostUserCombined> selectBoardListByEmailProf(@Param("email") String email,
			@Param("pageNum") int pageNum);

	public int selectCountBoardListByEmailProf(String email);

	public List<PostUserCombined> selectBoardListByClassId(@Param("classId") int classId,
			@Param("pageNum") int pageNum);

	public int selectCountBoardListByClassId(int classId);

}
