package team.lazybear.bearbnb.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.lazybear.bearbnb.service.AccountInfoService;

@SessionAttributes("myaccount")
@Controller
public class AccountInfoController {
	
	@Autowired
	private AccountInfoService aiService;
	
	@PostMapping("/checkEmail")
	public @ResponseBody Map<String, String> checkEmail(@RequestParam(value = "email") String email) {
		String mail = "";
		Map<String, String> map = new HashMap<>();
		if (email != null && email.trim().length() != 0) {
			mail = aiService.existByEmail(email);
			map.put("email", mail);
		}
		return map;
	}
	
	@PostMapping("/checkPhone")
	public @ResponseBody Map<String, String> checkPhoneNumber(@RequestParam(value = "phone_number") String phone_number ) {
		String phone = "";
		Map<String, String> map = new HashMap<>();
		if(phone_number != null && phone_number.trim().length() != 0) {
			phone = aiService.existByPhoneNumber(phone_number);
			map.put("phone_number",phone);
		}
		return map;
	}

}
