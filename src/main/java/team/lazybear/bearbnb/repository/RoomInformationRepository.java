package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lazybear.bearbnb.model.RoomInformation;

public interface RoomInformationRepository extends JpaRepository<RoomInformation,Long> {
	public RoomInformation findFirstByOrderByIdDesc();
}
