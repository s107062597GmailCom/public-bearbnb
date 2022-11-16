package team.lazybear.bearbnb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.model.RoomInformation;
import team.lazybear.bearbnb.model.RoomType;
import team.lazybear.bearbnb.repository.RoomTypeRepository;

@Service
public class RoomTypeService {
	@Autowired
	private RoomTypeRepository roomTypeRepository;
	
	public RoomType fintById(Integer id ) {
		Optional<RoomType> result = roomTypeRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	public List<RoomType> findAll(){
		return roomTypeRepository.findAll();
	}
	public void addTypeById(RoomInformation roomInfo,Integer id) {
		RoomType type = this.fintById(id);
		roomInfo.setType(type);
		type.getRoomInformations().add(roomInfo);
	}
	public void editTypeById(RoomInformation roomInfo,Integer id) {
	    roomInfo.getType().getRoomInformations().remove(roomInfo);
	    RoomType type = this.fintById(id);
	    roomInfo.setType(type);
	    type.getRoomInformations().add(roomInfo);
	}
	
	
}
