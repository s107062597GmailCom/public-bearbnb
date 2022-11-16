package team.lazybear.bearbnb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.City;
import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.repository.CityRepository;

@Service
public class CityService {
	@Autowired
	private CityRepository cityRepository;

	public City findById(Integer id) {
		Optional<City> result = cityRepository.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}

	public List<City> findAll(){
		return cityRepository.findAll();
	}
	public Room editCityByCityId(Room room ,Integer id){
	    room.getCity().getRooms().remove(room);
	    City city = this.findById(id);
	    city.getRooms().add(room);
	    room.setCity(city);
	    return room;
	}
}
