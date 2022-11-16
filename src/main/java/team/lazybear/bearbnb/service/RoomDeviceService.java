package team.lazybear.bearbnb.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.model.RoomDevice;
import team.lazybear.bearbnb.repository.RoomDeviceRepository;

@Service
public class RoomDeviceService {
	@Autowired
	private RoomDeviceRepository roomDeviceRepository;
	
	
	public RoomDevice findById(Integer id) {
		Optional<RoomDevice> result = roomDeviceRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<RoomDevice> findAll(){
		return roomDeviceRepository.findAll();
	}
	
	public Room addDeviceByIdList(Room room , List<Integer> ids) {
		room.setDevices(new HashSet<RoomDevice>());
		Set<RoomDevice> devices = room.getDevices();
		for(Integer i : ids) {
			RoomDevice deviceObj = this.findById(i);
			devices.add(deviceObj);
			deviceObj.getRooms().add(room);
		}
		return room;
	}
	public Room editDeviceByIdArray(Room room , Integer[] ids) {
	    Set<RoomDevice> oldDevices = room.getDevices();
	    for(RoomDevice oldDevice : oldDevices) {
	        oldDevice.getRooms().remove(room);
	    }
	    room.setDevices(new HashSet<RoomDevice>());
	    Set<RoomDevice> devices =  room.getDevices();
	    for(Integer i : ids) {
	        RoomDevice deviceObj = this.findById(i);
	        devices.add(deviceObj);
	        deviceObj.getRooms().add(room);
	    }
	    return room;
	}
}
