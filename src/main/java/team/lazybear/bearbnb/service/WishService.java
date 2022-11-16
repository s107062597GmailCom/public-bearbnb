package team.lazybear.bearbnb.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.data.IndexRoomSummary;
import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.repository.AccountRepository;
import team.lazybear.bearbnb.repository.RoomRepository;

@Service
public class WishService {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private RoomRepository roomRepository;

    public boolean isWished(Account account, String roomUuid) {
        Room room = roomRepository.getRoomByUuid(roomUuid);
        Optional<Account> opt = accountRepository.findById(account.getId());
        if (opt.isEmpty()) return false;
        account = opt.get();
        Set<Room> wishes = account.getWishes();
        if (wishes == null) return false;
        for (Room r : wishes) {
            if (r.getUuid().equals(roomUuid)) {
                return true;
            }
        }

        return false;
    }

    @Transactional
    @Modifying
    public int addWish(Account account, String roomUuid) {
        Room room = roomRepository.getRoomByUuid(roomUuid);
        Optional<Account> opt = accountRepository.findById(account.getId());
        if (opt.isEmpty()) return -1;
        return room == null ? -1 : addWish(opt.get(), room);
    }

    @Transactional
    @Modifying
    public int deleteWish(Account account, String roomUuid) {
        Room room = roomRepository.getRoomByUuid(roomUuid);
        Optional<Account> opt = accountRepository.findById(account.getId());
        if (opt.isEmpty()) return -1;
        return room == null ? -1 : deleteWish(opt.get(), room);
    }

    public int addWish(Account account, Room room) {
        Set<Room> wishes = account.getWishes();
        for (Room r : wishes) {
            if (r.getId() == room.getId())
                return -1;
        }

        Set<Account> wishers = room.getWishers();
        for (Account a : wishers) {
            if (a.getId() == account.getId())
                return -1;
        }

        int ret = 0;
        try {
            wishes.add(room);
            wishers.add(account);
        } catch (Exception e) {
            ret = 1;
        }

        return ret;
    }

    public int deleteWish(Account account, Room room) {
        boolean flag = false;

        Set<Room> wishes = account.getWishes();
        for (Room r : wishes) {
            if (r.getId() == room.getId())
                flag = true;
        }

        if (!flag) return -1;

        flag = false;
        Set<Account> wishers = room.getWishers();
        for (Account a : wishers) {
            if (a.getId() == account.getId())
                flag = true;
        }

        if (!flag) return -1;

        int ret = 0;
        try {
            wishes.remove(room);
            wishers.remove(account);
        } catch (Exception e) {
            ret = 1;
        }

        return ret;
    }

    public List< IndexRoomSummary > getWishes(Account account) {
        Optional<Account> opt = accountRepository.findById(account.getId());

        if (opt.isEmpty()) return null;
        account = opt.get();

        Set<Room> wishes = account.getWishes();
        List< IndexRoomSummary > list = new ArrayList<>();
        for (Room room : wishes)
            list.add(new IndexRoomSummary(room));

        return list;
    }

    @Transactional
    @Modifying
    public String clearAll(Account account) {
        Optional<Account> opt = accountRepository.findById(account.getId());

        if (opt.isEmpty()) return "false";
        account = opt.get();

        account.getWishes().clear();

        return "true";
    }

}
