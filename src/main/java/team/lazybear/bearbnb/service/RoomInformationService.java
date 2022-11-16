package team.lazybear.bearbnb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.model.RoomInformation;
import team.lazybear.bearbnb.repository.RoomInformationRepository;
import team.lazybear.bearbnb.repository.RoomRepository;

@Service
public class RoomInformationService {
	
	@Autowired
	private RoomInformationRepository roomInformationRepository;
	
	public RoomInformation insert(RoomInformation roomInformation) {
		return roomInformationRepository.save(roomInformation);
	}
	
	public RoomInformation findById(Long id) {
		Optional<RoomInformation> result = roomInformationRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	public List<RoomInformation> findAll(){
		return roomInformationRepository.findAll();
	}
	public RoomInformation findLastest() {
		return roomInformationRepository.findFirstByOrderByIdDesc();
	}
}
