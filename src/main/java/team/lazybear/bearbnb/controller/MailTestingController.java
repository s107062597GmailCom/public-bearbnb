package team.lazybear.bearbnb.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.service.MailService;
@SessionAttributes(names = { "myaccount","vericode" })
@Controller
public class MailTestingController {
	@Autowired

	 private MailService mailService;
	 
	 @GetMapping("/sendMail")
	 @ResponseBody
	 public String hello(){
	  mailService.prepareAndSend("yj919067@gmail.com","嗨 ！請問您對bearbnb的服務還滿意嗎？");
	  return "Mail sent";
	 }
	 
	 @GetMapping("/goGetMail")
	 @ResponseBody
	 public String htmlTest() {
		 String mail = "yj919067@gmail.com";
		 String title = "驗證信測試";
		 String verifier = UUID.randomUUID().toString().replace("-", "").toUpperCase();
		 String message =  "<h3>"
				 + "您好，請點下列超連結完成BearBnB網站的會員驗證</h3>\n"
				 + "<h2><a href=http://localhost:8090/bearbnb.com/verification?code=" + verifier +">"
				 + "點此前往驗證頁面</a></h2>\n";
		 mailService.prepareAndSend(mail, title, message);
		 return "Mail sent";
	 }
	 
	 @GetMapping("/sendEmail")
	 public void sendVerifyMail(@RequestParam String email, ModelMap m ) {

		 ScheduledExecutorService scheduler =
			     Executors.newScheduledThreadPool(10);
		 Account account = (Account) m.getAttribute("myaccount");
		 String verifier = UUID.randomUUID().toString().replace("-", "").toUpperCase();
		 
		 Map<String, String> map = new HashMap<>();
		 map.put("email",email);
		 map.put("code", verifier);
		 
		 m.addAttribute("vericode", map);
		 System.out.println(m.getAttribute("vericode"));
		 Map<String, String> Codemap = (Map<String, String>) m.getAttribute("vericode");
		 scheduler.schedule(new Thread(()->{ if(email.equals(Codemap.get("email"))) { m.remove("vericode"); }
		 }), 10, TimeUnit.MINUTES);
		 String title = "請完成BearBnB驗證程序";
		 String message = "<h3>"
				 + "您好，請點下列超連結完成BearBnB網站的會員驗證</h3>\n"
				 + "<h2><a href=http://localhost:8090/bearbnb.com/verification?code=" + verifier +">"
				 + "驗證碼效期為十分鐘，請在期限內點此前往驗證頁面</a></h2>\n";
		 
		 
		 mailService.prepareAndSend(email, title, message);
	 }
	 


}
