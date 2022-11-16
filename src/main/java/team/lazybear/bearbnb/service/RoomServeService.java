package team.lazybear.bearbnb.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.model.RoomRestrict;
import team.lazybear.bearbnb.model.RoomServe;
import team.lazybear.bearbnb.repository.RoomServeRepository;

@Service
public class RoomServeService {
	@Autowired
	private RoomServeRepository roomServeRepository;

	public RoomServe findById(Integer id) {
		Optional<RoomServe> result = roomServeRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	public List<RoomServe> findAll(){
		return roomServeRepository.findAll();
	}
	
	public Room addServeByIdList(Room room , List<Integer> ids) {
		room.setServes(new HashSet<RoomServe>());
		Set<RoomServe> serves = room.getServes();
		for(Integer i : ids) {
			RoomServe serveObj = this.findById(i);
			serves.add(serveObj);
			serveObj.getRooms().add(room);
		}
		return room;
	}
	public Room editServeByIdArray(Room room , Integer[] ids) {
	    Set<RoomServe> oldServes = room.getServes();
	    for(RoomServe s : oldServes) {
	        s.getRooms().remove(room);
	    }
	    room.setServes(new HashSet<RoomServe>());
	    Set<RoomServe> serves = room.getServes();
	    for(Integer i : ids) {
	        RoomServe serveObj = this.findById(i);
	        serves.add(serveObj);
	        serveObj.getRooms().add(room);
	    }
	    return room;
	}

}
