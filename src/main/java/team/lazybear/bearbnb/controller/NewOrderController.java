package team.lazybear.bearbnb.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.Chatroom;
import team.lazybear.bearbnb.model.Order;
import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.service.ChatDetailService;
import team.lazybear.bearbnb.service.ChatroomService;
import team.lazybear.bearbnb.service.MailService;
import team.lazybear.bearbnb.service.OrderService;
import team.lazybear.bearbnb.service.OrderStatusService;
import team.lazybear.bearbnb.service.RoomService;

@Controller
@RequestMapping("/room")
@SessionAttributes(names = { "myaccount" })

public class NewOrderController {
	@Autowired
	private ChatroomService chatroomService;
	@Autowired
	private ChatDetailService chatDetailService;

	@Autowired
	private RoomService roomService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderStatusService osService;

	@Autowired
	private MailService mailService;

	// 透過 room的uuid進入對應的 房間詳細資訊網站
	@GetMapping("/detail/room")
	public String showRoomById(@RequestParam("r") String uuid, Model model,
			@RequestParam(defaultValue = "false") String err) {

		Room room = roomService.getRoomByUuid(uuid);
		model.addAttribute("room", room);

		List<Order> allOrders = new ArrayList<Order>();

		for (Order order : new ArrayList<Order>(orderService.getRoomOrderListByOrderStatus(room.getId(), 1))) {
			allOrders.add(order);
		}

		for (Order order : new ArrayList<Order>(orderService.getRoomOrderListByOrderStatus(room.getId(), 2))) {
			allOrders.add(order);
		}

		for (Order order : new ArrayList<Order>(orderService.getRoomOrderListByOrderStatus(room.getId(), 3))) {
			allOrders.add(order);
		}

		model.addAttribute("allOrders", allOrders);

		if (err.equals("true"))
			model.addAttribute("alertMsg", "true");

		return "pages/room/roomInformbyid";
	}

	// ajax取得最近被booked的時間
	@PostMapping(value = "/getClosestBookedTime", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String showHello(@RequestParam("chosenStTime") String chosenStTime,
			@RequestParam("roomId") Long roomId) throws ParseException {
		DateFormat dIn = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
		Date InDate = dIn.parse(chosenStTime + ".000000");
		List<Order> closestOrderList = orderService.getClosestBookedTime(roomId, InDate).getContent();
		if (closestOrderList.size() != 0) {
			return closestOrderList.get(0).getCheckInDatetime().toString().substring(0, 10);

		} else {
			return null;
		}
	}

	// 新增order
	@PostMapping("/createNewOrder/room")
	public String insertOrder(@RequestParam("r") String uuid,
			@RequestParam("check_in_datetime") String check_in_datetime,
			@RequestParam("check_out_datetime") String check_out_datetime,
			@RequestParam("adult_count") Integer adult_count, @RequestParam("child_count") Integer child_count,
			@RequestParam("finalPrice") Integer finalPrice, Model model) throws ParseException {
		Account myaccount = (Account) model.getAttribute("myaccount");

		if (myaccount != null) {
			Room room = roomService.getRoomByUuid(uuid);
			Order order = new Order();

			DateFormat dIn = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
			Date InDate = dIn.parse(check_in_datetime + " 09:00:00.000000");

			DateFormat dOut = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
			Date OutDate = dOut.parse(check_out_datetime + " 09:00:00.000000");

			if (orderService.checkConflictOrderCount(room.getId(), InDate, OutDate) == 0) {
				order.setStatus(osService.findById(1));
				order.setCheckInDatetime(InDate);
				order.setCheckOutDatetime(OutDate);
				order.setAdultCount(adult_count);
				order.setChildCount(child_count);
				order.setPrice(finalPrice);
				order.setAccount(myaccount);
				order.setRoom(room);
				Order newOrder = orderService.insert(order);
				Account visitorAccount = newOrder.getAccount();
				System.out.println(visitorAccount.getId());
				Account owner = newOrder.getRoom().getOwner();
				Chatroom chatRoom = chatroomService.createChatRoom(visitorAccount, owner);
				chatRoom.getId();
				chatDetailService.insertChatDetail(chatRoom.getId(), "感謝你的訂單,期待你的造訪如有相關問題可以在這裡告訴我~", owner);
				mailService.checkPayment(myaccount.getInformation().getEmail(),
						order.getRoom().getOwner().getInformation().getFirstName(),
						order.getRoom().getInformation().getTitle());
				return "redirect:/member/allOrders";
			}
			return "redirect:/room/detail/room?r=" + uuid + "&err=true";
		}
		return "redirect:/login";

	}
}
