package team.lazybear.bearbnb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.w3c.dom.CDATASection;

import team.lazybear.bearbnb.data.ChatDetailDto;
import team.lazybear.bearbnb.data.ChatRoomDto;
import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.ChatDetail;
import team.lazybear.bearbnb.model.Chatroom;
import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.service.AccountService;
import team.lazybear.bearbnb.service.ChatDetailService;
import team.lazybear.bearbnb.service.ChatroomService;

@Controller
@RequestMapping("/chatroom")
@SessionAttributes("myaccount")
public class ChatroomController {
    
    @Autowired
    private AccountService accountService;
    @Autowired
    private ChatroomService chatroomService;
    @Autowired
    private ChatDetailService chatDetailService;
    
    @GetMapping("toChatRoom")
    public String toChatRoom(Model m) {
        Account sessionaccount = (Account) m.getAttribute("myaccount");
        if(sessionaccount != null) {
            Account myAccount = accountService.findById(sessionaccount.getId());
            List<Chatroom> chatrooms = chatroomService.findChatRoomsByAccount(myAccount);
            List<ChatRoomDto> list =new ArrayList<ChatRoomDto>();
            if(chatrooms!=null) {
                
                for(Chatroom room : chatrooms) {
                    ChatDetail latestMsg = chatDetailService.findLastestMsgByChatroomId(room.getId());
                    ChatRoomDto dto = new ChatRoomDto(); 
                    dto.setId(room.getId());
                    
                    if(room.getLargerIdAccount().getId()!= myAccount.getId()) {
                        dto.setReceverName(room.getLargerIdAccount().getInformation().getFirstName()+" "
                                +room.getLargerIdAccount().getInformation().getLastName());
                        dto.setReceverImgUUID(room.getLargerIdAccount().getPhoto().getUuid());
                    }else {
                        dto.setReceverName(room.getSmallerIdAccount().getInformation().getFirstName()+" "
                                +room.getSmallerIdAccount().getInformation().getLastName());
                        dto.setReceverImgUUID(room.getSmallerIdAccount().getPhoto().getUuid());
                        dto.setLatestMsgStatus(1);
                    }
                    if(latestMsg!=null) {
                        dto.setLatestMsg(latestMsg.getContentText());
                        dto.setLatestMsgDate(latestMsg.getCreatedAt());     
                        if(latestMsg.getSpeaker().getId()!=sessionaccount.getId()) {
                            dto.setLatestMsgStatus(latestMsg.getStatus());                    
                        }else {
                            dto.setLatestMsgStatus(1);                    
                            
                        }
                    }
                    list.add(dto);
                }
                list.sort((o1,o2)->-(o1.getLatestMsgDate().compareTo(o2.getLatestMsgDate())));
                m.addAttribute("chatrooms",list);
            }
            return "/pages/chatRooms/chatroom2";
        }
        return "redirect:/login";
    }
    
    @PostMapping(value="/getChatDetail",  produces = "application/json;charset=UTF-8")
    @ResponseBody
    public  List<ChatDetailDto> getChatDetail(@RequestBody ChatRoomDto cdd ,Model m) {
        Account sessionaccount = (Account) m.getAttribute("myaccount");
        if(sessionaccount!=null) {
            List<ChatDetail> details = chatDetailService.findByChatroomId(cdd.getId());
            List<ChatDetailDto> dtos = new ArrayList<ChatDetailDto>();
            ChatDetailDto dto;
            for(ChatDetail detail : details) {
                if(detail.getSpeaker().getId()!=sessionaccount.getId()) {
                    detail.setStatus(1);
                    detail = chatDetailService.save(detail);
                }
                dto =new ChatDetailDto(detail);
                dtos.add(dto);
            }
            return dtos;  
        }
        return null;
    }
    @PostMapping(value="/sendMsg",  produces = "application/json;charset=UTF-8")
    @ResponseBody
    public  ChatDetailDto sendMsg(@RequestBody ChatDetailDto cdd ,Model m) {
        Account myaccount = (Account) m.getAttribute("myaccount");
        if(myaccount !=null) {
            Account account = accountService.findById(myaccount.getId());
            chatDetailService.insertChatDetail(cdd.getChatroomId(), cdd.getContentText(), account);
            ChatDetail lastMsg = chatDetailService.findLastestMsgByChatroomId(cdd.getChatroomId());
           
            ChatDetailDto dto =new ChatDetailDto(lastMsg);
                
            
            return dto;
           
        }
        return null;
    }
    @PostMapping(value="/readMsg",  produces = "application/json;charset=UTF-8")
    @ResponseBody
    public  ChatDetailDto readMsg(@RequestBody ChatDetailDto cdd ,Model m) {
        ChatDetail lastMsg = chatDetailService.findLastestMsgByChatroomId(cdd.getChatroomId());
        lastMsg.setStatus(1);
        ChatDetailDto lastCDD = new ChatDetailDto(lastMsg);
        return lastCDD;
    }
}
