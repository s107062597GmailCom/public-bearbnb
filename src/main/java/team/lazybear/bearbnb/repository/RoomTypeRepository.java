package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lazybear.bearbnb.model.RoomType;

public interface RoomTypeRepository extends JpaRepository<RoomType, Integer> {

}
