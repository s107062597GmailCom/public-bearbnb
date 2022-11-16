package team.lazybear.bearbnb.controller;

import java.util.ArrayList;
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

import team.lazybear.bearbnb.data.OrderDto;
import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.Order;
import team.lazybear.bearbnb.model.OrderStatus;
import team.lazybear.bearbnb.model.RoomComment;
import team.lazybear.bearbnb.service.AccountService;
import team.lazybear.bearbnb.service.OrderService;
import team.lazybear.bearbnb.service.OrderStatusService;
import team.lazybear.bearbnb.service.RoomCommentService;

@Controller
@RequestMapping("/member")
@SessionAttributes(names = { "myaccount" })
public class MemberOrdersController {

	private AccountService accountService;

	private OrderService orderService;

	private OrderStatusService orderStatusService;

	private RoomCommentService rcService;

	@Autowired
	public MemberOrdersController(AccountService accountService, OrderService orderService,
			OrderStatusService orderStatusService, RoomCommentService rcService) {
		super();
		this.accountService = accountService;
		this.orderService = orderService;
		this.orderStatusService = orderStatusService;
		this.rcService = rcService;
	}

	// 導入頁面 產生 入住中 已確認 和 確認中 的訂單
	@GetMapping("/allOrders")
	public String showRoom(Model model) {
		Account myaccount = (Account) model.getAttribute("myaccount");

		if (myaccount != null) {
			List<Order> allOrders = new ArrayList<Order>();

			for (Order order : new ArrayList<Order>(
					orderService.getVisitorOrderListByOrderStatus(myaccount.getId(), 3))) {
				allOrders.add(order);
			}

			for (Order order : new ArrayList<Order>(
					orderService.getVisitorOrderListByOrderStatus(myaccount.getId(), 2))) {
				allOrders.add(order);
			}

			for (Order order : new ArrayList<Order>(
					orderService.getVisitorOrderListByOrderStatus(myaccount.getId(), 1))) {
				allOrders.add(order);
			}

			model.addAttribute("allOrders", allOrders);

			List<Order> completeOrders = new ArrayList<Order>();

			for (Order order : new ArrayList<Order>(
					orderService.getVisitorOrderListByOrderStatus(myaccount.getId(), 4))) {
				completeOrders.add(order);
			}

			for (Order order : new ArrayList<Order>(
					orderService.getVisitorOrderListByOrderStatus(myaccount.getId(), 5))) {
				completeOrders.add(order);
			}

			model.addAttribute("completeOrders", completeOrders);

			return "pages/member/memberOrders";
		}
		return "redirect:/login";
	}

	// 房客取消訂單
	@PostMapping(value = "/cancelOrder", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody String cancelOrder(@RequestParam("orderUuid") String orderUuid,
			@RequestParam("newStatusId") Integer newStatusId) {

		OrderStatus odStatus = orderStatusService.findById(newStatusId);
		orderService.updateOrderStatusByUuid(orderUuid, odStatus);

		return null;
	}

	// 房客透過uuid查詢訂單詳情
	@PostMapping(value = "/checkOrder", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody OrderDto checkOrder(@RequestParam("orderUuid") String orderUuid) {
		System.out.println(orderUuid);
		return new OrderDto(orderService.findOrderByUuid(orderUuid));
	}

	// 使用者留下評價
	@PostMapping(value = "/insertComment")
	public String insertComments(@RequestParam("orderUuid") String orderUuid,
			@RequestParam("commentRating") Integer commentRating,
			@RequestParam("commentContent") String commentContent) {
		Order order = orderService.findOrderByUuid(orderUuid);
		RoomComment roomComment = new RoomComment();
		roomComment.setOrder(order);
		roomComment.setAuthor(order.getAccount());
		roomComment.setRoom(order.getRoom());
		roomComment.setContentText(commentContent);
		roomComment.setPoint(commentRating);

		orderService.updateOrderStatusAddComment(order, roomComment);

		return "redirect:/member/allOrders";
	}

}
