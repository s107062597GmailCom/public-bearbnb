package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lazybear.bearbnb.model.RoomRestrict;

public interface RoomRestrictRepository extends JpaRepository<RoomRestrict,Integer > {
	public RoomRestrict findFirstByOrderByIdDesc();
}
