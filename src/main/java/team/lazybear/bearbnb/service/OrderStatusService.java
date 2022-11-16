package team.lazybear.bearbnb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import team.lazybear.bearbnb.model.OrderStatus;
import team.lazybear.bearbnb.repository.OrderStatusRepository;

@Service
public class OrderStatusService {
	@Autowired
	private OrderStatusRepository osRepository;
	
	public OrderStatus insert (OrderStatus orderstatus) {
		return osRepository.save(orderstatus);
	}
	
	public OrderStatus findById(Integer id) {
		Optional<OrderStatus> opt=osRepository.findById(id);
		if(opt.isPresent()) {
			return opt.get();
		}
		return null;
	}
	public List<OrderStatus> findAll(){
		return osRepository.findAll();
	}
}
