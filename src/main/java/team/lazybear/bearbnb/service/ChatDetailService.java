package team.lazybear.bearbnb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.CDATASection;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.ChatDetail;
import team.lazybear.bearbnb.model.Chatroom;
import team.lazybear.bearbnb.repository.ChatDetailRepository;
@Service
public class ChatDetailService {
    @Autowired
    private ChatDetailRepository chatDetailRepository;
    @Autowired
    private ChatroomService chatroomService;
    
    public ChatDetail save(ChatDetail chatDetail) {
        return chatDetailRepository.save(chatDetail);
    }
    
    public ChatDetail insertChatDetail(Long chatroomId ,String message,Account account) {
        ChatDetail msg = new ChatDetail();

        Chatroom chatroom = chatroomService.findById(chatroomId);
      
        msg.setChatRoom(chatroom);
  
        msg.setContentText(message);

        msg.setSpeaker(account);
      
        ChatDetail newMsg = chatDetailRepository.save(msg);

        return newMsg;
    }
    
    public List<ChatDetail> findByChatroomId(Long chatroomId){
        return chatDetailRepository.findByChatroomId(chatroomId);
    }
    
    public ChatDetail findLastestMsgByChatroomId(Long id) {
        List<ChatDetail> details = chatDetailRepository.findLastestMsgByChatroomId(id);
        if(details.isEmpty()) {
            return null;
        }
        return details.get(0);
    }
}
