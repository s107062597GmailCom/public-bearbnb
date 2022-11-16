package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lazybear.bearbnb.model.RoomPhoto;

public interface RoomPhotoRepository extends JpaRepository<RoomPhoto, Long> {

}
