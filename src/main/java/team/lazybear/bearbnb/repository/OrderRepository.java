package team.lazybear.bearbnb.repository;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import team.lazybear.bearbnb.model.Order;
import team.lazybear.bearbnb.model.OrderStatus;

public interface OrderRepository extends JpaRepository<Order, Integer> {

	public Order findFirstByOrderByIdDesc();

	@Query(value = "SELECT * FROM \"order\"\n" + "WHERE  \"fk_room_id\"  =?1 ", nativeQuery = true)
	List<Order> getAllOrderById(Long fk_room_id);

// 模糊搜尋 Order的  Order的UUID Account的UUID和USERNAME room名稱 UUID status
	@Query(value = "  select * from \"order\" o\r\n"
			+ "  join \"account\" a on \"o\".\"fk_visitor_id\"=\"a\".\"id\"\r\n"
			+ " join \"room\" r on \"o\".\"fk_room_id\" = \"r\".\"id\"\r\n"
			+ "  join \"order_status\" s on \"o\".\"fk_order_status_id\"= \"s\".\"id\"\r\n"
			+ " join \"room_information\" i on \"r\".\"id\"=\"i\".\"fk_room_id\""
			+ "  where concat(\"o\".\"uuid\",\"a\".\"uuid\",\"a\".\"username\",\"r\".\"uuid\",\r\n"
			+ "  \"i\".\"title\",\"s\".\"title\") like :likeName", nativeQuery = true)
	List<Order> likeSearchOrder(String likeName);

//	搜尋特定時間內入住和退房的所有訂單
	@Query(value = "  select * from \"order\"\r\n"
			+ "  where \"check_in_datetime\" >= ?1 and check_in_datetime<= ?2 \r\n"
			+ "  or check_out_datetime >=?1 and check_out_datetime<= ?2"
			+ " ORDER BY \"check_in_datetime\" ASC", nativeQuery = true)
	List<Order> DateQuery(String CIDquery, String CODquery);

	// 自動更新資料庫中 到期的訂單
	// 1. orderStatus為 "已確認" 現實時間已超過入住時間 表示房客入住中 orderStatus改為 "入住中"

	@Transactional
	@Modifying
	@Query(value = "UPDATE Order od SET od.status = ?1 WHERE od.status = ?2 AND od.checkInDatetime <= CURRENT_TIMESTAMP")
	void changeOrderStatusToVisitorHaveCheckedIn(OrderStatus newOs, OrderStatus oldOs);

	// 2. orderStatus為 "入住中" 現實時間已超過退房時間 表示房客已經退房 orderStatus改為 "完成 待評價"
	@Transactional
	@Modifying
	@Query(value = "UPDATE Order od SET od.status = ?1 WHERE od.status = ?2 AND od.checkOutDatetime <= CURRENT_TIMESTAMP")
	void changeOrderStatusToVisitorHaveCheckedOut(OrderStatus newOs, OrderStatus oldOs);

	// 3. orderStatus為 "待確認" 現實時間已超過入住時間 房東還未同意 表示房客入住中 orderStatus改為 "不成立"
	@Transactional
	@Modifying
	@Query(value = "UPDATE Order od SET od.status = ?1 WHERE od.status = ?2 AND od.checkInDatetime <= CURRENT_TIMESTAMP")
	void changeOrderStatusToOrderInvalid(OrderStatus newOs, OrderStatus oldOs);

	// 取得在房東名下 特定狀態的 訂單order的list
	@Query("SELECT order FROM Order order  WHERE order.room.owner.id = ?1 AND order.status.id = ?2 ORDER BY check_in_datetime")
	List<Order> getHostOrderListByOrderStatus(Long ownerId, Integer statusId);

	// 取得在房東名下 特定狀態的 訂單order的list的數量
	@Query("SELECT Count(*) FROM Order order  WHERE order.room.owner.id = ?1 AND order.status.id = ?2 ")
	Integer getHostOrderCountByOrderStatus(Long ownerId, Integer statusId);

	// 取得會員所訂 特定狀態的 訂單order的list
	@Query("SELECT order FROM Order order  WHERE order.account.id = ?1 AND order.status.id = ?2 ORDER BY check_in_datetime")
	List<Order> getVisitorOrderListByOrderStatus(Long visitorId, Integer statusId);

	// 透過訂單uuid 查詢特定訂單
	@Query("SELECT order FROM Order order  WHERE order.uuid = ?1")
	Order findOrderByUuid(String uuid);

	// 取得room下 特定狀態的 訂單order的list
	@Query("SELECT order FROM Order order  WHERE order.room.id = ?1 AND order.status.id = ?2 ORDER BY check_in_datetime")
	List<Order> getRoomOrderListByOrderStatus(Long fk_room_id, Integer statusId);

	// ajax取得最近的 已預訂時間 有一個參數是pageable 在service設定要取第一筆資料
	@Query("SELECT od FROM Order od WHERE  od.room.id = ?1 AND od.checkInDatetime > ?2 AND od.status.id <> 6 ORDER BY od.checkInDatetime ")
	Page<Order> getClosestBookedTime(Long fk_room_id, Date check_in_datetime, Pageable pageable);

	// 新的訂單產生時 要檢查資料庫當中有沒有衝突的訂單
//	@Query("SELECT Count(*) FROM Order od " 
//			+ "WHERE od.id IN ( SELECT od.id FROM Order od WHERE od.room.id = ?1 AND od.status.id <> 6 AND od.checkInDatetime  BETWEEN ?2 AND ?3 AND od.checkInDatetime <> ?4)"
//			+ "OR od.id IN( SELECT od.id FROM Order od WHERE od.room.id = ?5 AND od.status.id <> 6 AND od.checkOutDatetime  BETWEEN ?6 AND ?7 AND od.checkOutDatetime <> ?8)"
//			+ "OR od.id IN( SELECT od.id FROM Order od WHERE od.room.id = ?9 AND od.status.id <> 6 AND od.checkInDatetime  <= ?10 AND od.checkOutDatetime  >= ?11)")
//	Integer checkConflictOrderCount( Long fk_room_idQ1  , Date check_in_datetimeQ1 , Date check_out_datetimeQ1,Date check_out_datetimeQ1Compare,
//			Long fk_room_idQ2  , Date check_in_datetimeQ2 , Date check_out_datetimeQ2,Date check_in_datetimeQ2Compare,
//			Long fk_room_idQ3  , Date check_in_datetimeQ3 , Date check_out_datetimeQ3		
//			);
	@Query("SELECT Count(*) FROM Order od WHERE od.room.id = ?1 AND od.status.id <> 6 AND od.checkInDatetime < ?2 AND od.checkOutDatetime > ?3")
	Integer checkConflictOrderCount(Long fk_room_id, Date check_out_datetime, Date check_in_datetime);

}
