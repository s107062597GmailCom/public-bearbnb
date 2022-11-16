package team.lazybear.bearbnb.controller;

import java.util.HashMap;
import java.util.Map;

import javax.security.auth.login.LoginException;
import javax.servlet.http.Part;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.AccountInformation;
import team.lazybear.bearbnb.service.AccountIdentityService;
import team.lazybear.bearbnb.service.AccountInfoService;
import team.lazybear.bearbnb.service.AccountPhotoService;
import team.lazybear.bearbnb.service.AccountService;
import team.lazybear.bearbnb.service.AccountStatusService;

@SessionAttributes(names = { "myaccount","vericode" })
@Controller
public class AccountController {

	@Autowired
	public AccountController(AccountService aService, AccountInfoService aiService, AccountIdentityService aidService,
			AccountStatusService asService, AccountPhotoService apService) {
		super();
		this.aService = aService;
		this.aiService = aiService;
		this.aidService = aidService;
		this.asService = asService;
		this.apService = apService;
	}

	private AccountService aService;
	private AccountInfoService aiService;
	private AccountIdentityService aidService;
	private AccountStatusService asService;
	private AccountPhotoService apService;

	@GetMapping("/login")
	public String loginPage(Model m) {
		Account acc = (Account) m.getAttribute("myaccount");
		if (acc != null && acc.getStatus().getId() == 2) {
			return "redirect:/";
		}
		return "pages/login/login";
	}


	/* 用來驗證Session存續與否 */
	@GetMapping("/loginSuccess")
	public String unLoginMimic(Model m) {
		Account acc = (Account) m.getAttribute("myaccount");
		return "pages/login/loginSuccess";
	}

	@PostMapping("/checklogin.controller")
	public @ResponseBody Map<String, String> login(@RequestBody String jsonstring, Model model)
			throws JsonMappingException, JsonProcessingException {
		Map<String, String> rsmap = new ObjectMapper().readValue(jsonstring, HashMap.class);
		Map<String, String> map = new HashMap<>();
		Account account;
		try {
//			account = aService.findByUsername(username, password);
			account = aService.specialFindByUsername(rsmap.get("username"), rsmap.get("password"));
			if (account != null) {
				if(account.getStatus().getId()==3) {map.put("fail","帳號已停用"); }
				else {
				model.addAttribute("myaccount", account);
				map.put("success", "登入成功，三秒後跳回首頁");}
//				return "pages/login/loginSuccess";
			}
		} catch (LoginException e) {
			/* 讓前端抓exception的狀態碼，譯本在service裡面 */
			map.put("exception", e.getMessage());
//			return "pages/login/login";
		}
//		return "pages/login/login"; // 登入都失敗了應該就是回首頁或登入頁吧...?
		return map;
	}

	/* 登出囉 */
	@GetMapping("/logout")
	public String logOut(SessionStatus status) {
		status.setComplete();
		return "redirect:/"; // 感覺登出了就會被趕回首頁？
	}



	/* 創帳號囉 */
	@GetMapping("/signup")
	public String signUpPage() {
		return "pages/login/signUpForm";
	}

	@PostMapping("/checkUsername")
	public @ResponseBody Map<String, String> checkUsername(@RequestParam(value = "username") String username) {
		String id = "";
		Map<String, String> map = new HashMap<>();
		if (username != null && username.trim().length() != 0) {
			id = aService.existByUsername(username);
			map.put("id", id);
		}
		return map;
	}


	@PostMapping(value = "/signup.controller")
	public String signUp(@RequestParam String username,
			@RequestParam String password,
			@RequestParam String first_name,
			@RequestParam String last_name,
			@RequestParam Character gender,
			@RequestParam String phone_number,
			@RequestParam String email,
			@RequestParam String birthday,
			@RequestParam Part photo,
			Model m) {

		//用jsonString的時候才需要下面的ObjectMapper()，因為是會回傳網址，所以也不需要下面的message
//		Map<String, String> map = new ObjectMapper().readValue(jsonstring, HashMap.class);
//		Map<String, String> message = new HashMap<>();
		/*
		 * 因為accountInfo的mail跟電話被設定為unique屬性，要先認證再決定是否填入資料
		 */
		boolean checkMnP = aiService.existByMailNPhone(email, phone_number);

		if( checkMnP == true ) {
			//應該是要做一個提示的Alert或是中繼跳轉頁面提示使用者聯絡方式重複?
			return "redirect:/signup";}

		if( checkMnP == false ) {
		/*
		 * 需要呼叫account與accountinfo的新增方法， 還有輸入格式正確與否的驗證(基本上交給前端是比較好的)
		 */
		Account acc = aService.signUpAccount(username, password);
		AccountInformation accInfo = aiService.signUpAccInfo(username, first_name, last_name, gender, phone_number, email, birthday);

		Account account = aService.createNewAccount(acc, accInfo, photo);
		if(account == null) {return "redirect:/signup";}

		/* 註冊成功就送魔Session */

//		message.put("success", "新增成功");
		m.addAttribute("myaccount", account);
//		System.out.println(message);
		}

		return "redirect:/redirect";
	}

	@GetMapping("/redirect")
	public String redirectSession (Model m) {
		Account preacc = (Account) m.getAttribute("myaccount");
		Account acc = aService.findById(preacc.getId());

		m.addAttribute("myaccount", acc);
		return "redirect:/";
	}

	/*驗證信中的超連結*/
	@GetMapping("/verification")
	 public String verification(String code, ModelMap m) {
		Account account = (Account) m.getAttribute("myaccount");
		Map<String,String> vericode =  (Map<String, String>) m.getAttribute("vericode");
		System.out.println(vericode);
		String verifycode = vericode.get("code");
		System.out.println(verifycode);

		if(code.equals(verifycode)) {
			account.setStatus(asService.findById(1));
			aService.insert(account);
			return"pages/login/verifiSuccess";
		}

		return"pages/login/verifiFail";
	}

	/* 修改註冊時輸入的帳號資料 */
	@GetMapping("/setProfile")
	public String preSetAccData(Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");

		if(myaccount != null) {return "pages/login/update2";}

		return "redirect:/";
	}

	@Transactional
	@PostMapping(value = "/profileUpdate")
	public String updateAccData(
			@RequestParam(defaultValue = "") String password,
			@RequestParam(defaultValue = "") String first_name,
			@RequestParam(defaultValue = "") String last_name,
			@RequestParam(defaultValue = "") Character gender,
			@RequestParam(defaultValue = "") String phone_number,
			@RequestParam(defaultValue = "") String email,
			@RequestParam(defaultValue = "") String birthday,
			@RequestParam(required = false) Part photo,
			SessionStatus status,
			Model m,
			RedirectAttributes ra) {
		Account preacc = (Account) m.getAttribute("myaccount");
		Account acc =aService.findById(preacc.getId());
		AccountInformation accInfo = acc.getInformation();


		if(password.equals("")) {
			password = acc.getPassword();
		}else {
			acc.setSalt();
			acc.setPassword(aService.md5Encrypt(password, acc.getSalt()));
		}

		boolean flag = aiService.existByMailNPhone(
		        accInfo.getEmail().equals(email) ? "<none>" : email,
		        accInfo.getPhoneNumber().equals(phone_number) ? "<none>": phone_number
		);
		if (flag) {
		    ra.addFlashAttribute("duplicateDate", "電話或信箱重複，請輸入其他資訊");
		    return "redirect:/setProfile";
		}

		if(first_name.equals("")) {first_name = acc.getInformation().getFirstName();}
		if(last_name.equals("")) last_name = acc.getInformation().getLastName();
		if(phone_number.equals("")) phone_number = acc.getInformation().getPhoneNumber();
		if(email.equals("")) email = acc.getInformation().getEmail();
		if(birthday.equals("")) birthday = String.valueOf(acc.getInformation().getBirthday()).substring(0, 10);

		AccountInformation accInfoNew = new AccountInformation();
		accInfoNew = aiService.saveInfoToBean(accInfo, first_name, last_name, gender, phone_number, email, birthday);

		Account account = new Account();
		if(photo.getSize() == 0) {
			 account = aService.updateAccount(acc, accInfoNew);
		}else {account = aService.updateAccount(acc, accInfoNew, photo);}

		if(account == null) {return "/profileUpdate";}

		m.addAttribute("myaccount", account);


		return "pages/login/updateSuccess";

	}

	/* 刪除帳號(其實是將AccountStatus修改到disabled) */
	@GetMapping("/delete")
	public String preDeleteAcc(Model m, SessionStatus status) {
		Account acc = (Account) m.getAttribute("myaccount");
		acc.setStatus(asService.findById(3));
		aService.insert(acc);
		status.setComplete();
		return "redirect:/";
	}

}
