package team.lazybear.bearbnb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import team.lazybear.bearbnb.model.ChatDetail;

public interface ChatDetailRepository extends JpaRepository<ChatDetail, Long> {
    @Query(value="select * from \"CHAT_DETAIL\" where \"FK_CHATROOM_ID\" =:id order by id ",nativeQuery = true)
    public List<ChatDetail> findByChatroomId(Long id);
    @Query(value="select top 1 * from chat_detail  where fk_chatroom_id =:id order by id desc",nativeQuery = true)
    public List<ChatDetail> findLastestMsgByChatroomId(Long id);
}
