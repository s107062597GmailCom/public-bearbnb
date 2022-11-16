package team.lazybear.bearbnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.AccountIdentity;
import team.lazybear.bearbnb.model.AccountInformation;
import team.lazybear.bearbnb.model.AccountStatus;
import team.lazybear.bearbnb.model.Order;
import team.lazybear.bearbnb.service.AccountIdentityService;
import team.lazybear.bearbnb.service.AccountInfoService;
import team.lazybear.bearbnb.service.AccountService;
import team.lazybear.bearbnb.service.AccountStatusService;

@Controller
@SessionAttributes(names = { "myaccount" })
public class FLAccountController {
	@Autowired
	private AccountService aService;
	@Autowired
	private AccountIdentityService aiService;
	@Autowired
	private AccountStatusService asService;
	@Autowired
	private AccountInfoService aInfoService;

	@GetMapping("/account/add")
	public String addAccount(Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount!=null &&myaccount.getIdentity().getId() == 2) {

			List<AccountIdentity> idList = aiService.findAll();

			model.addAttribute("idList", idList);

			List<AccountStatus> statusList = asService.findAll();

			model.addAttribute("statusList", statusList);

			Account a1 = new Account();

			model.addAttribute("account", a1);

			return "pages/account/addAccountPage";
		}
		return "redirect:/login";

	}

	@PostMapping("/account/post")
	public String postAccount(@RequestParam(name = "Account_Status") Integer status,
			@RequestParam(name = "Account_Identity") Integer iden, @ModelAttribute(name = "account") Account account,
			Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount!=null &&myaccount.getIdentity().getId() == 2) {
			AccountStatus as = asService.findById(status);

			account.setStatus(as);

			AccountIdentity ai = aiService.findById(iden);

			account.setIdentity(ai);

			aService.insert(account);

			Account a1 = new Account();

			model.addAttribute("account", a1);

			return "redirect:../listAccount";
		}
		return "redirect:/login";
	}

	// 修改
	@GetMapping("/account/edit")
	public String editAccount(@RequestParam(name = "id") Long id, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount!=null &&myaccount.getIdentity().getId() == 2) {

			List<AccountIdentity> idList = aiService.findAll();

			model.addAttribute("idList", idList);

			List<AccountStatus> statusList = asService.findAll();

			model.addAttribute("statusList", statusList);

			Account a1 = aService.findById(id);

			model.addAttribute("account", a1);

			return "pages/account/editAccount";
		}
		return "redirect:/login";
	}

	// Post修改
	@PostMapping("/account/edit")
	public String editAccountPost(@RequestParam(name = "Account_Status") Integer status,
			@RequestParam(name = "Account_Identity") Integer iden, @RequestParam(name = "phone") String phone,
			@RequestParam(name = "lastName") String lastName, @RequestParam(name = "email") String email,
			@RequestParam(name = "firstName") String firstName, @RequestParam(name = "gender") Character gender,
			@ModelAttribute(name = "account") Account ac1,
			Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount!=null &&myaccount.getIdentity().getId() == 2) {

			Account a1 = aService.findById(ac1.getId());

			AccountInformation info = a1.getInformation();

			info.setPhoneNumber(phone);

			info.setFirstName(firstName);

			info.setLastName(lastName);

			info.setEmail(email);

			info.setGender(gender);

			ac1.setCreatedAt(a1.getCreatedAt());

			AccountStatus as = asService.findById(status);

			ac1.setStatus(as);

			AccountIdentity ai = aiService.findById(iden);

			ac1.setIdentity(ai);

			aInfoService.insert(info);

			aService.insert(ac1);

			return "redirect:../listAccount";
		}
		return "redirect:/login";
	}

	@GetMapping("/account/info")
	public String showAccountInfo(@RequestParam(name = "id") Long id, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount!=null &&myaccount.getIdentity().getId() == 2) {

			Account a1 = aService.findById(id);

			model.addAttribute("account", a1);

			return "pages/account/showAccountInfo";
		}
		return "redirect:/login";
	}

	// 將status改成disable

	@GetMapping("/account/notRealDelete")
	public String notRealDelete(@RequestParam(name = "id") Long id, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount!=null &&myaccount.getIdentity().getId() == 2) {

			Account a1 = aService.findById(id);

			model.addAttribute("account", a1);

			a1.setStatus(asService.findById(3));

			aService.insert(a1);

			return "redirect:../listAccount";
		}
		return "redirect:/login";
	}

	// 全部的Account
	@GetMapping("listAccount")
	public String showAllAccount(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount!=null && myaccount.getIdentity().getId() == 2) {

			Page<Account> page = aService.findByPage(pageNumber);

			model.addAttribute("page", page);

			return "pages/account/accountpage";
		}
		System.out.println(myaccount.getIdentity().getId());
		return "redirect:/login";
	}

	// 模糊搜尋
	@GetMapping("listLike")
	public String likeSearchfromAccount(@RequestParam(name = "likename") String likename, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount!=null &&myaccount.getIdentity().getId() == 2 ) {

			List<Account> likeAccountList = aService.likeSearchfromAccount("%" + likename + "%");

			model.addAttribute("likeAccountList", likeAccountList);

			return "pages/account/likePage";
		}
		return "redirect:/login";
	}

}
