package team.lazybear.bearbnb.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.Order;
import team.lazybear.bearbnb.model.OrderStatus;
import team.lazybear.bearbnb.model.RoomComment;
import team.lazybear.bearbnb.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private OrderStatusService osService;
	@Autowired
	private RoomCommentService rcService;

	// 自動更新資料庫中 到期的訂單
	// 1. orderStatus為 "已確認" 現時時間已超過入住時間 表示房客入住中 orderStatus改為 "入住中"
	public void changeOrderStatusToVisitorHaveCheckedIn() {
		OrderStatus newOs = osService.findById(3);
		OrderStatus oldOs = osService.findById(2);
		orderRepository.changeOrderStatusToVisitorHaveCheckedIn(newOs, oldOs);
	};

	// 2. orderStatus為 "入住中" 現實時間已超過退房時間 表示房客已經退房 orderStatus改為 "完成 待評價"
	public void changeOrderStatusToVisitorHaveCheckedOut() {
		OrderStatus newOs = osService.findById(4);
		OrderStatus oldOs = osService.findById(3);
		orderRepository.changeOrderStatusToVisitorHaveCheckedOut(newOs, oldOs);
	};

	// 3. orderStatus為 "待確認" 現實時間已超過入住時間 房東還未同意 表示房客入住中 orderStatus改為 "不成立"
	public void changeOrderStatusToOrderInvalid() {
		OrderStatus newOs = osService.findById(6);
		OrderStatus oldOs = osService.findById(1);
		orderRepository.changeOrderStatusToOrderInvalid(newOs, oldOs);
	};

	// 取得在房東名下 特定目標的 訂單order的list
	public List<Order> getHostOrderListByOrderStatus(Long ownerId, Integer statusId) {
		return orderRepository.getHostOrderListByOrderStatus(ownerId, statusId);
	};

	// 取得在房東名下 特定目標的 訂單order的list的數量
	public Integer getHostOrderCountByOrderStatus(Long ownerId, Integer statusId) {
		return orderRepository.getHostOrderCountByOrderStatus(ownerId, statusId);
	};

	// 取得會員所訂 特定狀態的 訂單order的list
	public List<Order> getVisitorOrderListByOrderStatus(Long visitorId, Integer statusId) {
		return orderRepository.getVisitorOrderListByOrderStatus(visitorId, statusId);
	};

	// 透過uuid 更改訂單的狀態
	public void updateOrderStatusByUuid(String uuid, OrderStatus odStatus) {
		Order order = findOrderByUuid(uuid);
		order.setStatus(odStatus);
		insert(order);
	}

	// 透過訂單uuid 查詢特定訂單
	public Order findOrderByUuid(String uuid) {
		return orderRepository.findOrderByUuid(uuid);
	}

	// 取得room下 特定狀態的 訂單order的list
	public List<Order> getRoomOrderListByOrderStatus(Long fk_room_id, Integer statusId) {
		return orderRepository.getRoomOrderListByOrderStatus(fk_room_id, statusId);
	};

	// ajax取得最近的 已預訂時間 有一個參數是pageable 在service設定要取第一筆資料
	public Page<Order> getClosestBookedTime(Long fk_room_id, Date check_in_datetime) {
		Pageable pgb = PageRequest.of(0, 1);

		Page<Order> page = orderRepository.getClosestBookedTime(fk_room_id, check_in_datetime, pgb);

		return page;
	};

	// 新的訂單產生時 要檢查資料庫當中有沒有衝突的訂單
	public Integer checkConflictOrderCount(Long fk_room_id, Date check_in_datetime, Date check_out_datetime) {
//		return orderRepository.checkConflictOrderCount(fk_room_id, check_in_datetime, check_out_datetime, check_out_datetime,
//				fk_room_id,  check_in_datetime, check_out_datetime,check_in_datetime,
//				fk_room_id, check_in_datetime, check_out_datetime);
		return orderRepository.checkConflictOrderCount(fk_room_id, check_out_datetime, check_in_datetime);
	};

	public void updateOrderStatusAddComment(Order order, RoomComment roomComment) {
		rcService.insert(roomComment);
		order.setComment(roomComment);
		order.setStatus(osService.findById(5));
		orderRepository.save(order);
	}

	public Order insert(Order order) {
		return orderRepository.save(order);
	}

	public Order findById(Integer id) {
		Optional<Order> result = orderRepository.findById(id);

		if (result.isPresent()) {
			return result.get();
		}
		return null;
	}

	public Order findLastest() {
		return orderRepository.findFirstByOrderByIdDesc();
	}

	public List<Order> findAll() {
		return orderRepository.findAll();
	}

	public List<Order> getAllOrderById(Long fk_room_id) {
		return orderRepository.getAllOrderById(fk_room_id);
	}

	public List<Order> likeSearchOrder(String likename) {
		return orderRepository.likeSearchOrder(likename);
	}

	public List<Order> orderDateQuery(String CIDquery, String CODquery) {
		return orderRepository.DateQuery(CIDquery, CODquery);
	}

	public Page<Order> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 15, Sort.Direction.DESC, "createdAt");

		Page<Order> page = orderRepository.findAll(pgb);

		return page;
	}

}
