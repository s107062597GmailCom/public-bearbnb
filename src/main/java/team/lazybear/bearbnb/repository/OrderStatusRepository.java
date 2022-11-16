package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import team.lazybear.bearbnb.model.OrderStatus;

	public interface OrderStatusRepository extends JpaRepository<OrderStatus,Integer > {
		
}
