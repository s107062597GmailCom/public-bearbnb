package team.lazybear.bearbnb.controller;



import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.lazybear.bearbnb.data.ChatDetailDto;


@Controller
@SessionAttributes("myaccount")
public class ChatController {
    @Autowired
    private SimpMessagingTemplate template;
    
    @MessageMapping("/one/sendMessage")
    public ChatDetailDto sendMessage(@Payload ChatDetailDto chatDetailDto) {
        chatDetailDto.setCreatedAt(new Date());
        this.template.convertAndSend("/topic/"+chatDetailDto.getSpeakerName(),chatDetailDto);
       
        this.template.convertAndSend("/topic/"+chatDetailDto.getReceiverName(),chatDetailDto);
        
        return chatDetailDto;
    }
    
    @MessageMapping("/one/addUser")
    @SendTo("/user/queue/getResponse")
    public ChatDetailDto addUser(@Payload ChatDetailDto chatDetailDto, SimpMessageHeaderAccessor headerAccessor) {
        headerAccessor.getSessionAttributes().put("speakerName",chatDetailDto.getSpeakerName());            
        return chatDetailDto;
    }
}
