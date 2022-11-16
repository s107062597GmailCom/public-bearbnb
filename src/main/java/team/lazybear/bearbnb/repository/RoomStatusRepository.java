package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lazybear.bearbnb.model.RoomStatus;

public interface RoomStatusRepository extends JpaRepository<RoomStatus, Integer> {

}
