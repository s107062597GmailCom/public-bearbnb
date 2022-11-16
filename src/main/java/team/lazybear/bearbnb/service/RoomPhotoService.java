package team.lazybear.bearbnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.RoomPhoto;
import team.lazybear.bearbnb.repository.RoomPhotoRepository;

@Service
public class RoomPhotoService {
	@Autowired
	private RoomPhotoRepository roomPhotoRepository;
	
	public RoomPhoto inser() {
		return roomPhotoRepository.save(new RoomPhoto());
	};

}
