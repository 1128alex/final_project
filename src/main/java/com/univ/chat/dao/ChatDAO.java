package com.univ.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.chat.model.ChatRoom;
import com.univ.chat.model.ChatUserCombined;

@Repository
public interface ChatDAO {
	public int insertMessage(@Param("roomId") int roomId, @Param("writer") String writer,
			@Param("content") String content);

	public List<ChatUserCombined> selectMessageList(@Param("roomId") int roomId);

	public List<ChatUserCombined> selectNewMessage(@Param("roomId") int roomId, @Param("currentId") int currentId);

	public ChatRoom selectChatRoomByRoomId(int roomId);

	public List<ChatRoom> selectChatRoomListByEmail(String email);

	public int insertChatRoom(@Param("memberString") String memberString, @Param("roomName") String roomName);

	public int selectRecentChatRoomId();

}
