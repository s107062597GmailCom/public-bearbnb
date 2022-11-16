package team.lazybear.bearbnb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.repository.RoomRepository;

@Service
public class RoomSService {
	
	@Autowired
	private RoomRepository roomRepository;
	
	public Room insert(Room room) {
		return roomRepository.save(room);
	}
	
	public Room findById(Long id) {
		Optional<Room> result = roomRepository.findById(id);
		
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	public Room findLastest() {
		return roomRepository.findFirstByOrderByIdDesc();
	}
	public List<Room> findAll(){
		return roomRepository.findAll();
	}
	

	public Room getRoomByUuid( String uuid) {
		return roomRepository.getRoomByUuid(uuid);
	}
}
