package team.lazybear.bearbnb.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.AccountPhoto;
import team.lazybear.bearbnb.model.ChatDetail;
import team.lazybear.bearbnb.model.Chatroom;
import team.lazybear.bearbnb.service.AccountService;
import team.lazybear.bearbnb.service.ChatDetailService;
import team.lazybear.bearbnb.service.ChatroomService;
import team.lazybear.bearbnb.service.AccountIdentityService;
import team.lazybear.bearbnb.service.AccountPhotoService;
import team.lazybear.bearbnb.service.HelloService;
import team.lazybear.bearbnb.service.OrderService;
import team.lazybear.bearbnb.service.RoomService;

@Controller
@RequestMapping( "/hello" )
public class HelloController {

    @Autowired
    private HelloService helloService;
    
    @Autowired
    private AccountService accountService;
    
    @Autowired
    private RoomService roomService;
    
    @Autowired
    private OrderService orderService;

    @Autowired
    private AccountIdentityService accountIdentityService;
    
    @Autowired
    private AccountPhotoService accountPhotoService;
    @Autowired
    private ChatDetailService chatDetailService;
    
    @Autowired
    private ChatroomService chatroomService;

    @GetMapping
    public String hello( Model model ) {
        model.addAttribute( "list", helloService.findAll() );
        return "pages/hello/hello";
    }

    @GetMapping( "/test" )
    public String test( Model model ) {
        model.addAttribute( "list", helloService.findAll() );
       return "pages/hello/hello";
    }
    
    @GetMapping("/account")
    public String account(Model model) {
    	model.addAttribute("account",accountService.findById(1L));
    	 return "pages/hello/account";
    }
    
    @GetMapping("/room")
    public String room(Model model) {
    	model.addAttribute("room",roomService.findById(1L));
    	 return "pages/hello/room";
    }
    
    @GetMapping("/order")
    public String order(Model model) {
//    	model.addAttribute("order",orderService.findById(1));
//    	 return "pages/hello/order";
        System.out.println(accountIdentityService.findTitleById(2));
        System.out.println(accountIdentityService.findIdByTitle("others"));
        return "pages/hello/hello";
    }
    
    @GetMapping("/conflictOrder")
    public String conflictOrder(Model model) throws ParseException {

    	DateFormat dIn = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
    	Date InDate = dIn.parse( "2022-10-22 09:00:00.000000");
    	
    	DateFormat dOut = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
    	Date OutDate = dIn.parse( "2022-10-28 08:59:59.000000");    	
    	
        model.addAttribute("orders",orderService.checkConflictOrderCount(3L,InDate,OutDate));
        return "pages/hello/conflictOrder";
    }

    
    @GetMapping( "/ajax" )
    public String Ajaxtest( Model model ) {
       return "pages/hello/Ajex";
    }
    
    @PostMapping(value = "/showHello", produces = "text/plain;charset=UTF-8")
    public @ResponseBody String showHello(@RequestParam("id") Long id) {
    	String HelloTitle = accountService.findById(id).getUsername();
    	return HelloTitle;
    }
    @GetMapping( "/chat" )
    public String toChatRoom() {
       return "pages/hello/HelloChatRoom";
    }
    @GetMapping( "/createChatRoom" )
    public String createChatRoom() {
     
       List<ChatDetail> chatdetails = chatDetailService.findByChatroomId(1L);
       for(ChatDetail detail : chatdetails) {
           System.out.println(detail.getContentText());
       }
       
        return "pages/hello/hello";
    }
    
    
}
