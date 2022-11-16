package team.lazybear.bearbnb.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.Order;
import team.lazybear.bearbnb.model.OrderDto;
import team.lazybear.bearbnb.model.OrderStatus;
import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.service.AccountService;
import team.lazybear.bearbnb.service.OrderService;
import team.lazybear.bearbnb.service.OrderStatusService;
import team.lazybear.bearbnb.service.RoomService;

@Controller
@SessionAttributes(names = { "myaccount" })
public class OrderController {
	@Autowired
	private OrderService oService;

	@Autowired
	private RoomService rService;

	@Autowired
	private OrderStatusService osService;

	@Autowired
	private AccountService aService;

//	@GetMapping("listOrder")
//	public String getAllOrder(Model model) {
//		List<Order> list = oService.findAll();
//		
//		model.addAttribute("orderList",list);
//		
//		return "pages/order/orderPage";
//	}
	@GetMapping("listOrder")

	public String showAllOrder(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Page<Order> page = oService.findByPage(pageNumber);

			model.addAttribute("page", page);

			return "pages/order/orderPage";
		}
		return "redirect:/login";
	}

	@GetMapping("/order/notRealDelete")
	public String notRealDelete(@RequestParam(name = "id") Integer id, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Order o1 = oService.findById(id);

			model.addAttribute("order", o1);

			o1.setStatus(osService.findById(6));

			oService.insert(o1);

			return "redirect:../listOrder";
		}
		return "redirect:/login";
	}

	@GetMapping("/order/add")
	public String addOrder(Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			List<Room> RoomList = rService.findAll();

			model.addAttribute("RoomList", RoomList);

			List<OrderStatus> osList = osService.findAll();

			model.addAttribute("osList", osList);

			List<Account> accList = aService.findAll();

			model.addAttribute("accList", accList);

			Order o1 = new Order();

			model.addAttribute("order", o1);

			return "pages/order/addOrderPage";
		}
		return "redirect:/login";
	}

	@PostMapping("/order/post")
	public String postOrder(@RequestParam(name = "CID") String cid, @RequestParam(name = "COD") String cod,
			@RequestParam(name = "room") Long room, @RequestParam(name = "status") Integer id,
			@RequestParam(name = "account") Long ac,

			@ModelAttribute(name = "order") Order order, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Account a1 = aService.findById(ac);

			order.setAccount(a1);

			Room r1 = rService.findById(room);

			order.setRoom(r1);

			OrderStatus os = osService.findById(id);

			order.setStatus(os);

			try {
				order.setCheckInDatetime(new SimpleDateFormat("yyyy-MM-dd").parse(cid));
				order.setCheckOutDatetime(new SimpleDateFormat("yyyy-MM-dd").parse(cod));
			} catch (ParseException e) {

				e.printStackTrace();
			}

			oService.insert(order);

			Order o1 = new Order();

			model.addAttribute("order", o1);

			return "redirect:../listOrder";
		}
		return "redirect:/login";

	}

	@GetMapping("/order/info")
	public String showOrderInfo(@RequestParam(name = "id") Integer id, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Order o1 = oService.findById(id);

			model.addAttribute("order", o1);

			return "pages/order/showOrderInfo";
		}
		return "redirect:/login";
	}

	@GetMapping("/order/edit")
	public String editOrder(@RequestParam(name = "id") Integer id, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			List<Room> RoomList = rService.findAll();

			model.addAttribute("RoomList", RoomList);

			List<OrderStatus> osList = osService.findAll();

			model.addAttribute("osList", osList);

			List<Account> accList = aService.findAll();

			model.addAttribute("accList", accList);

			Order o1 = oService.findById(id);

			model.addAttribute("order", o1);

			return "pages/order/editOrder";
		}
		return "redirect:/login";

	}

	@PostMapping("/order/edit")
	public String editOrderPost(@RequestParam(name = "CID") String cid, @RequestParam(name = "COD") String cod,
//			@RequestParam(name="room")Long room,
			@RequestParam(name = "status") Integer id, @RequestParam(name = "account") Long ac,
			@RequestParam(name = "adult") Integer ad, @RequestParam(name = "child") Integer ch,
			@ModelAttribute(name = "order") Order order,Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			Order o1 = oService.findById(order.getId());

			order.setCreatedAt(o1.getCreatedAt());

//		Account a1=aService.findById(ac);
//		
//		order.setAccount(a1);
//		
//		Room r1=rService.findById(room);
//		
//		order.setRoom(r1);

			OrderStatus os = osService.findById(id);

			order.setStatus(os);

			try {
				order.setCheckInDatetime(new SimpleDateFormat("yyyy-MM-dd").parse(cid));
				order.setCheckOutDatetime(new SimpleDateFormat("yyyy-MM-dd").parse(cod));
			} catch (ParseException e) {

				e.printStackTrace();
			}
			order.setAdultCount(ad);

			order.setChildCount(ch);

			oService.insert(order);

			return "redirect:../listOrder";
		}
		return "redirect:/login";
	}

	@GetMapping("listLikeOrder")
	public String likeSearchOrder(@RequestParam(name = "likename") String likename, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			List<Order> likeOrderList = oService.likeSearchOrder("%" + likename + "%");

			model.addAttribute("likeOrderList", likeOrderList);

			return "pages/order/likeOrderPage";
		}
		return "redirect:/login";
	}

	@GetMapping("listOrderDateQuery")
	public String orderDateQuery(@RequestParam(name = "CIDquery") String CIDquery,
			@RequestParam(name = "CODquery") String CODquery, Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null && myaccount.getIdentity().getId() == 2) {

			List<Order> dateQueryList = oService.orderDateQuery(CIDquery + " 09:00:00", CODquery+" 09:00:00");


			model.addAttribute("dateQueryList", dateQueryList);

			return "pages/order/dateQuery";
		}
		return "redirect:/login";

	}

}
