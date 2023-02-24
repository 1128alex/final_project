package com.univ.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.univ.board.model.Post;
import com.univ.board.model.PostUserCombined;

@Repository
public interface BoardDAO {
	public int insertPost(Post post);

	public List<PostUserCombined> selectPostListByClassId(int classId);
}
