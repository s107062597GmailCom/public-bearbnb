package team.lazybear.bearbnb.repository;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import team.lazybear.bearbnb.model.Room;

@Transactional
public interface RoomRepository extends
        JpaRepository<Room, Long>, JpaSpecificationExecutor<Room> {

	public Room findFirstByOrderByIdDesc();



	@Query(value="from Room where owner.id =:id order by id")
	public List<Room> findByOwnerId(@Param(value="id") Long id);

//	@Query(value = "SELECT * FROM `room`\n"
//			+ "WHERE  `uuid` = ?1 ", nativeQuery = true)
	@Query(value = "FROM Room room WHERE room.uuid = ?1 ")
	Room getRoomByUuid( String uuid);


	@Query(value = "select*from \"room\" r\r\n"
			+ " join \"room_status\" s on \"r\".\"fk_room_status_id\"=\"s\".\"id\"\r\n"
			+ " join \"city\" c on \"r\".\"fk_city_id\" = \"c\".\"id\"\r\n"
			+ " join \"account\" a on \"a\".\"id\"=\"r\".fk_owner_id\r\n"
			+ " join \"room_information\" i on \"r\".id=\"i\".\"fk_room_id\""
			+ "where concat(\"r\".\"uuid\",\"r\".\"address\",\"s\".\"title\",\"c\".\"title\","
			+ "\"a\".\"username\",\"i\".\"title\") like :likeName",nativeQuery = true)
	List<Room> likeSearch(String likeName);

}
