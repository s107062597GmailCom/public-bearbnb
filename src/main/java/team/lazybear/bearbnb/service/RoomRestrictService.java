package team.lazybear.bearbnb.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.model.RoomDevice;
import team.lazybear.bearbnb.model.RoomRestrict;
import team.lazybear.bearbnb.repository.RoomRestrictRepository;

@Service
public class RoomRestrictService {
	@Autowired
	private RoomRestrictRepository roomRestrictRepository;
	
	public RoomRestrict findById(Integer id){
		Optional<RoomRestrict> result = roomRestrictRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<RoomRestrict> findAll(){
		return roomRestrictRepository.findAll();
	}
	public Room addRestrictByIdList(Room room , List<Integer> ids) {
		room.setRestricts(new HashSet<RoomRestrict>());
		Set<RoomRestrict> restricts = room.getRestricts();
		for(Integer i : ids) {
			RoomRestrict restrictObj = this.findById(i);
			restricts.add(restrictObj);
			restrictObj.getRooms().add(room);
		}
		return room;
	}
	public Room editRestrictByIdArray(Room room , Integer[] ids) {
	    Set<RoomRestrict> oldRestricts = room.getRestricts();
	    for(RoomRestrict oldRestrict : oldRestricts) {
	        oldRestrict.getRooms().remove(room);
        }
	    
	    room.setRestricts(new HashSet<RoomRestrict>());
	    Set<RoomRestrict> restricts = room.getRestricts();
	    for(Integer i : ids) {
	        RoomRestrict restrictObj = this.findById(i);
	        restricts.add(restrictObj);
	        restrictObj.getRooms().add(room);
	    }
	    return room;
	}
	
}
