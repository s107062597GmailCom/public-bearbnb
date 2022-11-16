package team.lazybear.bearbnb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.Chatroom;

public interface ChatroomRepository extends JpaRepository<Chatroom, Long> {
    
    @Query(value="from Chatroom where smallerIdAccount =:account1 and largerIdAccount =:account2 order by id")
    public List<Chatroom> findChatRoomByAccounts(Account account1 , Account account2);
    
    @Query(value="from Chatroom where smallerIdAccount =:account or largerIdAccount =:account order by id")
    public List<Chatroom> findChatRoomsByAccount(Account account);
}
