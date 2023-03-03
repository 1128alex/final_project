package com.univ.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.univ.chat.model.Chat;
import com.univ.chat.model.ChatRoom;

@Repository
public interface ChatDAO {
	public int insertMessage(@Param("roomId") int roomId, @Param("writer") String writer,
			@Param("content") String content);

	public List<Chat> selectMessageList(int roomId);

	public List<Chat> selectNewMessage(@Param("roomId") int roomId, @Param("currentId") int currentId);

	public ChatRoom selectChatRoomByRoomId(int roomId);

	public List<ChatRoom> selectChatRoomListByEmail(String email);

}
