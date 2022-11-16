package team.lazybear.bearbnb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.Order;
import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.repository.RoomRepository;

@Service
public class RoomService {
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

	//模糊搜尋 
	public List<Room> likeSearchfromRoom(String likeName){
		return roomRepository.likeSearch(likeName);
	}
	public Page<Room> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 10, Sort.Direction.DESC,"id");
		
		Page<Room> page = roomRepository.findAll(pgb);
		
		return page;
	}

	
	public List<Room> findByOwnerId(Long id){
		List<Room> rooms = roomRepository.findByOwnerId(id);
		if(rooms.isEmpty()) {
			return null;
		}
		return rooms;

	}
}
