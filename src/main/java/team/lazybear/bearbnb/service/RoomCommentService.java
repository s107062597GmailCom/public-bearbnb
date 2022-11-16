package team.lazybear.bearbnb.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.Order;
import team.lazybear.bearbnb.model.RoomComment;
import team.lazybear.bearbnb.repository.AccountRepository;
import team.lazybear.bearbnb.repository.RoomCommentRepository;

@Service
public class RoomCommentService {
	@Autowired
	private RoomCommentRepository roomCommentRepository;
	
	private OrderService orderService;
	
	public RoomComment findById(Long id) {
		Optional<RoomComment> result = roomCommentRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public void insert(RoomComment roomComment){
		roomCommentRepository.save(roomComment);		
	}
	

	
	
}
