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
import team.lazybear.bearbnb.model.City;
import team.lazybear.bearbnb.model.Order;
import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.model.RoomStatus;
import team.lazybear.bearbnb.service.AccountService;
import team.lazybear.bearbnb.service.CityService;
import team.lazybear.bearbnb.service.RoomService;
import team.lazybear.bearbnb.service.RoomStatusService;

@Controller
@SessionAttributes(names = { "myaccount" })
public class FLRoomController {

	@Autowired
	private RoomService rService;
	@Autowired
	private RoomStatusService rsService;

	@Autowired
	private AccountService aService;

	@Autowired
	private CityService cService;

	@GetMapping("listRoom")
	public String showAllRoom(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Page<Room> page = rService.findByPage(pageNumber);

			model.addAttribute("page", page);

			List<RoomStatus> roomStatusList = rsService.findAll();

			model.addAttribute("roomStatusList", roomStatusList);

			return "pages/room/roomPage";
		}
		return "redirect:/login";
	}

	@GetMapping("/room/notRealDelete")
	public String notRealDelete(@RequestParam(name = "id2") Long id2, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Room room = rService.findById(id2);

			model.addAttribute("room", room);

			room.setStatus(rsService.findById(5));

			rService.insert(room);

			return "redirect:listRoom";
		}
		return "redirect:/login";
	}

	@GetMapping("/room/add")
	public String addRoom(Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Room room = new Room();

			model.addAttribute("room", room);

			List<Account> accList = aService.findAll();

			model.addAttribute("accList", accList);

			List<City> cityList = cService.findAll();

			model.addAttribute("cityList", cityList);

			return "pages/room/addRoomPage";
		}
		return "redirect:/login";
	}

	@PostMapping("/room/post")
	public String postRoom(@RequestParam(name = "city") Integer ci,
//			@RequestParam(name="account")Long ac,
			@RequestParam(name = "account") String ac, @ModelAttribute(name = "room") Room room, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Account a1 = aService.findByUsername(ac);

			// 如果輸入的帳號是空白的話
			if (a1 == null) {
				model.addAttribute("a1", a1);
			}

			room.setOwner(a1);

			City c1 = cService.findById(ci);

			room.setCity(c1);

			rService.insert(room);

			Room r1 = new Room();

			model.addAttribute("room", r1);

			return "redirect:../listRoom";
		}
		return "redirect:/login";

	}

	@GetMapping("/room/edit")
	public String editRoom(@RequestParam(name = "id") Long id, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Room room = rService.findById(id);

			model.addAttribute("room", room);

			List<Account> accList = aService.findAll();

			model.addAttribute("accList", accList);

			List<City> cityList = cService.findAll();

			model.addAttribute("cityList", cityList);

			return "pages/room/editRoom";
		}
		return "redirect:/login";
	}

	@PostMapping("/room/edit")
	public String editRoomPost(@RequestParam(name = "city") Integer ci, @RequestParam(name = "account") Long ac,
			@ModelAttribute(name = "room") Room room, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Account a1 = aService.findById(ac);

			room.setOwner(a1);

			City c1 = cService.findById(ci);

			room.setCity(c1);

			rService.insert(room);

			return "redirect:../listRoom";
		}
		return "redirect:/login";

	}

	@GetMapping("listLikeRoom")
	public String likeSearchRoom(@RequestParam(name = "likename") String likename, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			List<Room> likeRoomList = rService.likeSearchfromRoom("%" + likename + "%");

			model.addAttribute("likeRoomList", likeRoomList);

			List<RoomStatus> roomStatusList = rsService.findAll();

			model.addAttribute("roomStatusList", roomStatusList);

			return "pages/room/likeRoomPage";
		}
		return "redirect:/login";
	}

	@ResponseBody
	@GetMapping(value = "/changeRoomStatus")
	public String changeRoomStatus(@RequestParam(name = "id") Long id,
			@RequestParam(name = "statusId") Integer statusId, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Room room = rService.findById(id);

			model.addAttribute("room", room);

			room.setStatus(rsService.findById(statusId));

			rService.insert(room);

			return "";
		}
		return "redirect:/login";
	}

	@GetMapping("/room/info")
	public String showRoomInfo(@RequestParam(name = "id") Long id, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Room r1 = rService.findById(id);

			model.addAttribute("room", r1);

			return "pages/room/showRoomInfo";
		}
		return "redirect:/login";
	}

}
