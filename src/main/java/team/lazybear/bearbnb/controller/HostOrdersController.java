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
import team.lazybear.bearbnb.service.AccountService;
import team.lazybear.bearbnb.service.OrderService;
import team.lazybear.bearbnb.service.OrderStatusService;
import team.lazybear.bearbnb.service.RoomService;

@Controller
@RequestMapping("/hosting")
@SessionAttributes(names = { "myaccount" })
public class HostOrdersController {

	private AccountService accountService;

	private OrderService orderService;

	private OrderStatusService orderStatusService;

	@Autowired
	public HostOrdersController(AccountService accountService, RoomService roomService, OrderService orderService,
			OrderStatusService orderStatusService) {
		super();
		this.accountService = accountService;
		this.orderService = orderService;
		this.orderStatusService = orderStatusService;
	}

	// 導入頁面 回傳各種訂單的數目
	@GetMapping("/allOrders")
	public String showRoom(Model model) {

		Account myaccount = (Account) model.getAttribute("myaccount");
		if (myaccount != null) {
			model.addAttribute("comfirmingOrdersCount",
					orderService.getHostOrderCountByOrderStatus(myaccount.getId(), 1));
			model.addAttribute("arriveSoonOrdersCount",
					orderService.getHostOrderCountByOrderStatus(myaccount.getId(), 2));
			model.addAttribute("currentStayingOrdersCount",
					orderService.getHostOrderCountByOrderStatus(myaccount.getId(), 3));
			model.addAttribute("waitForRateOrdersCount",
					orderService.getHostOrderCountByOrderStatus(myaccount.getId(), 4));

			return "pages/host/hostOrder";
		}
		return "redirect:/login";
	}

	// 房東確認或是婉拒訂單
	@PostMapping(value = "/comfirmOrder", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody Integer[] comfirmOrder(@RequestParam("orderUuid") String orderUuid,
			@RequestParam("newStatusId") Integer newStatusId, Model model) {
		Account account = (Account) model.getAttribute("myaccount");
		OrderStatus odStatus = orderStatusService.findById(newStatusId);
		orderService.updateOrderStatusByUuid(orderUuid, odStatus);
		Integer[] orderCounts = { orderService.getHostOrderCountByOrderStatus(account.getId(), 1),
				orderService.getHostOrderCountByOrderStatus(account.getId(), 2),
				orderService.getHostOrderCountByOrderStatus(account.getId(), 3),
				orderService.getHostOrderCountByOrderStatus(account.getId(), 4) };
		return orderCounts;
	}

	// 查詢不同 狀態的訂單
	@PostMapping(value = "/getAllOrderByOrderStatus", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<OrderDto> getAllOrderByOrderStatus(@RequestParam("orderStatus") Integer orderStatus,
			Model model) {
		Account account = (Account) model.getAttribute("myaccount");
		List<Order> orders = orderService.getHostOrderListByOrderStatus(account.getId(), orderStatus);
		List<OrderDto> orderDtos = new ArrayList<OrderDto>();
		for (Order order : orders) {
			OrderDto orderDto = new OrderDto(order);
			orderDtos.add(orderDto);
		}
		return orderDtos;
	}
}
