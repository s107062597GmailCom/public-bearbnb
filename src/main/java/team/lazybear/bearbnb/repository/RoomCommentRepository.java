package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lazybear.bearbnb.model.RoomComment;

public interface RoomCommentRepository extends JpaRepository<RoomComment,Long> {
	public RoomComment findFirstByOrderByIdDesc();
}
