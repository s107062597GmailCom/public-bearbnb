package team.lazybear.bearbnb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.Chatroom;
import team.lazybear.bearbnb.repository.ChatroomRepository;
@Service
public class ChatroomService {
    @Autowired
    private ChatroomRepository chatroomRepository; 
    @Autowired
    private AccountService accountService;
    
    public Chatroom findById(Long id) {
        Optional<Chatroom> chatroom = chatroomRepository.findById(id);
        if(chatroom.isPresent()) {
            return chatroom.get();
        }
        return null;
    }
    
    public Chatroom createChatRoom(Account account1 ,Account account2) {
        System.out.println("inCreateChatRoom1");
       if(findChatRoomByAccounts(account1, account2)==null) {
           System.out.println("inCreateChatRoom2");
           Account acc1 = accountService.findById(account1.getId());
           Account acc2 = accountService.findById(account2.getId());
           Chatroom chatroom = new Chatroom(acc1, acc2);
           System.out.println("inCreateChatRoom3");
           return chatroomRepository.save(chatroom);  
       }
       System.out.println("inCreateChatRoom4");
       return findChatRoomByAccounts(account1, account2);
    }
    
    public List<Chatroom> findChatRoomsByAccount(Account account) {
        List<Chatroom> chatrooms = chatroomRepository.findChatRoomsByAccount(account);
       if(chatrooms.isEmpty()) {
           return null;
       }
       return chatrooms;
     }
    
    public Chatroom findChatRoomByAccounts(Account account1,Account account2){
        if(account1.getId() >  account2.getId()) {
            Account temp = account1;
            account1 = account2;
            account2 = temp;
        }
        List<Chatroom> chatrooms = chatroomRepository.findChatRoomByAccounts(account1, account2);
        if(chatrooms.isEmpty()) {
            return null;
        }
        return chatrooms.get(0);
    }
}
