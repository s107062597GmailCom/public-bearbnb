package team.lazybear.bearbnb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import team.lazybear.bearbnb.model.RoomStatus;
import team.lazybear.bearbnb.repository.RoomStatusRepository;

@Service
public class RoomStatusService {
	@Autowired
	private RoomStatusRepository roomStatusRepository;
	
	public RoomStatus insert(RoomStatus rs) {
		return roomStatusRepository.save(rs);
	}
	
	public RoomStatus findById(Integer id) {
		Optional<RoomStatus> result = roomStatusRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<RoomStatus> findAll(){
		return roomStatusRepository.findAll();
	}
	
}
