package team.lazybear.bearbnb.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.data.IndexRoomPage;
import team.lazybear.bearbnb.data.IndexRoomSummary;
import team.lazybear.bearbnb.data.TimePeriod;
import team.lazybear.bearbnb.model.Order;
import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.model.RoomDevice;
import team.lazybear.bearbnb.model.RoomServe;
import team.lazybear.bearbnb.repository.CityRepository;
import team.lazybear.bearbnb.repository.RoomRepository;

@Service
public class RoomSearchService {

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private CityRepository cityRepository;

    private Comparator<Date> dateComparator;

    private Comparator<Order> orderComparator;

    private String[] roomStatusForRoomHidden;

    private String[] orderStatusForRoomHidden;

    public RoomSearchService() {
        setDateComparator();
        setOrderComparator();
        setOrderStatusForRoomHidden();
        setRoomStatusForRoomHidden();
    }

    public IndexRoomSummary[] search(
            Date startDate,
            Date endDate,
            Integer number) {
        int cityLargestId = cityRepository.findLargestId().getNumber();
        int days = (int)
                ((endDate.getTime() - startDate.getTime()) / TimePeriod.DAY);

        Specification<Room> specification =
                getSpecification(null, null, number, 0, startDate, endDate);

        List<Room> candidateRooms = roomRepository.findAll(specification);

        boolean[] isSelected = new boolean[cityLargestId + 1];
        Arrays.fill(isSelected, false);

        Collections.shuffle(candidateRooms);

        IndexRoomSummary[] summaries = new IndexRoomSummary[days];
        Arrays.fill(summaries, null);

        int cnt = 0;
        for (Room room : candidateRooms) {
            int cityId = room.getCity().getId();
            if (isSelected[cityId]) continue;
            isSelected[cityId] = true;
            summaries[cnt] = new IndexRoomSummary(room);
            summaries[cnt].setStartDate(startDate);
            summaries[cnt].setEndDate(endDate);
            cnt += 1;
            if (cnt >= days) break;
        }

        return cnt == days ? summaries : null;
    }

    public IndexRoomPage search(
            Integer pageNumber,
            Integer roomPerPage,
            Integer cityId,
            String[] keys,
            Integer adultNumber,
            Integer childNumber,
            Date checkInDate,
            Date checkOutDate) {
        Specification<Room> specification = getSpecification(
                cityId, keys, adultNumber, childNumber, checkInDate, checkOutDate);

        List<Room> roomList = null;
        Map< Long, List<String> > matchedKeysMap = null;
        int totalPage = 0;
        if (keys == null) {
            PageRequest request = PageRequest.of(pageNumber - 1, roomPerPage);
            Page<Room> page = roomRepository.findAll(specification, request);

            roomList = page.getContent();
            totalPage = page.getTotalPages();
        } else {
            List<Room> list = roomRepository.findAll(specification);
            matchedKeysMap = getMatchedKeysMap(list, keys);
            sortByMatchedKeysMap(list, matchedKeysMap);

            roomList = getCurrentPageRooms(list, pageNumber - 1, roomPerPage);

            totalPage = list.size() / roomPerPage + (
                    list.size() % roomPerPage == 0 ? 0 : 1);
        }

        List<IndexRoomSummary> irsList = checkInDate == null ?
                getIndexRoomSummaryList(roomList) :
                getIndexRoomSummaryList(roomList, checkInDate, checkOutDate);

        if (keys != null)
            setIrsListUnmatchedKeys(irsList, roomList, matchedKeysMap, keys);

        IndexRoomPage indexRoomPage = new IndexRoomPage();
        indexRoomPage.setSummaries(irsList);
        indexRoomPage.setTotalPages(totalPage);

        return indexRoomPage;
    }

    private Specification<Room> getSpecification(
            Integer cityId,
            String[] keys,
            Integer adultNumber,
            Integer childNumber,
            Date checkInDate,
            Date checkOutDate) {
        Specification<Room> specification = new Specification<Room>() {
            private static final long serialVersionUID = 1L;

            @Override
            public Predicate toPredicate(
                    Root<Room> root,
                    CriteriaQuery<?> query,
                    CriteriaBuilder criteriaBuilder) {
                List< Predicate > list = new ArrayList<>();

                for (String roomStatus : roomStatusForRoomHidden) {
                    list.add(criteriaBuilder.notEqual(
                            root.join("status").get("title").as(String.class),
                            roomStatus));
                }

                if (cityId != null && cityId > 0) {
                    list.add(criteriaBuilder.equal(root.join("city")
                            .get("id").as(Integer.class), cityId));
                }

                if (keys != null) {
                    List< Predicate > subList = new ArrayList<>();

                    for (String key : keys) {
                        subList.add(criteriaBuilder.like(
                                root.get("address").as(String.class),
                                "%" + key + "%"));

                        subList.add(criteriaBuilder.like(
                                root.join("information").get("title")
                                    .as(String.class),
                                "%" + key + "%"));

                        subList.add(criteriaBuilder.like(
                                root.join("owner").join("information")
                                    .get("firstName").as(String.class),
                                "%" + key + "%"));

                        List<Predicate> subServeList = new ArrayList<>();
                        Subquery<RoomServe> subServeQuery = query.subquery(RoomServe.class);
                        Root<RoomServe> subServeRoot = subServeQuery.from(RoomServe.class);

                        subServeList.add(criteriaBuilder.equal(
                                subServeRoot.join("rooms").get("id")
                                    .as(Long.class),
                                root.get("id").as(Long.class)));

                        subServeList.add(criteriaBuilder.like(
                                subServeRoot.get("title").as(String.class),
                                "%" + key + "%"));

                        subServeQuery.select(subServeRoot).where(
                                subServeList.toArray(
                                        new Predicate[subServeList.size()]));

                        subList.add(criteriaBuilder.exists(subServeQuery));

                        List<Predicate> subDeviceList = new ArrayList<>();
                        Subquery<RoomDevice> subDeviceQuery = query.subquery(RoomDevice.class);
                        Root<RoomDevice> subDeviceRoot = subDeviceQuery.from(RoomDevice.class);

                        subDeviceList.add(criteriaBuilder.equal(
                                subDeviceRoot.join("rooms").get("id")
                                    .as(Long.class),
                                root.get("id").as(Long.class)));

                        subDeviceList.add(criteriaBuilder.like(
                                subDeviceRoot.get("title").as(String.class),
                                "%" + key + "%"));

                        subDeviceQuery.select(subDeviceRoot).where(
                                subDeviceList.toArray(
                                        new Predicate[subDeviceList.size()]));

                        subList.add(criteriaBuilder.exists(subDeviceQuery));
                    }

                    list.add(criteriaBuilder.or(
                            subList.toArray(new Predicate[subList.size()])));
                }

                if (adultNumber != null && childNumber != null &&
                        adultNumber >= 1 && childNumber >= 0) {

                    Integer totalNumber = adultNumber + childNumber;

                    list.add(criteriaBuilder.greaterThanOrEqualTo(
                            root.join("information").get("maxPeopleCapacity")
                                .as(Integer.class),
                            totalNumber));

                    list.add(criteriaBuilder.lessThanOrEqualTo(
                            root.join("information")
                                .get("minPeopleCapacity").as(Integer.class),
                            totalNumber));
                }

                if (checkInDate != null && checkOutDate != null) {
                    List<Predicate> subList = new ArrayList<>();

                    Subquery<Order> subQuery = query.subquery(Order.class);
                    Root<Order> subRoot = subQuery.from(Order.class);

                    subList.add(criteriaBuilder.equal(
                            subRoot.get("room"),
                            root.get("id")));

                    subList.add(criteriaBuilder.greaterThan(
                            subRoot.get("checkOutDatetime").as(Date.class),
                            checkInDate));

                    subList.add(criteriaBuilder.lessThan(
                            subRoot.get("checkInDatetime").as(Date.class),
                            checkOutDate));

                    List<Predicate> subOrList = new ArrayList<>();
                    for (String orderStatus : orderStatusForRoomHidden) {
                        subOrList.add(criteriaBuilder.equal(
                                subRoot.join("status").get("title")
                                    .as(String.class),
                                orderStatus));
                    }
                    subList.add(criteriaBuilder.or(
                            subOrList.toArray(new Predicate[subOrList.size()])));

                    subQuery.select(subRoot).where(
                            subList.toArray(new Predicate[subList.size()]));

                    list.add(criteriaBuilder.not(
                            criteriaBuilder.exists(subQuery)));
                }

                return criteriaBuilder.and(
                        list.toArray(new Predicate[list.size()]));
            }
        };

        return specification;
    }

    private List<IndexRoomSummary> getIndexRoomSummaryList(List<Room> roomList) {
        List<IndexRoomSummary> irsList = new ArrayList<>();

        IndexRoomSummary irs;
        for (Room room : roomList) {
            irs = new IndexRoomSummary(room);
            setSummaryDefaultDate(irs, room);
            irsList.add(irs);
        }

        return irsList;
    }

    private List<IndexRoomSummary> getIndexRoomSummaryList(
            List<Room> roomList, Date checkInDate, Date checkOutDate) {
        if (checkInDate == null)
            return getIndexRoomSummaryList(roomList);

        List<IndexRoomSummary> irsList = new ArrayList<>();

        IndexRoomSummary irs;
        for (Room room : roomList) {
            irs = new IndexRoomSummary(room);
            irs.setStartDate(checkInDate);
            irs.setEndDate(checkOutDate);
            irsList.add(irs);
        }

        return irsList;
    }

    private void setIrsListUnmatchedKeys(
            List<IndexRoomSummary> irsList,
            List<Room> roomList,
            Map< Long, List<String> > matchedKeysMap,
            String[] keys) {
        int size = roomList.size();
        for (int i = 0; i != size; i += 1) {
            List<String> matched = matchedKeysMap.get(roomList.get(i).getId());
            String[] matchedArray = matched.toArray(new String[matched.size()]);
            String[] unmatchedKeys = getUnmatchedString(keys, matchedArray);
            irsList.get(i).setUnmatched(unmatchedKeys);
        }
    }

    private IndexRoomSummary setSummaryDefaultDate(
            IndexRoomSummary irs, Room room) {
        Set<Order> orders = getValidOrders(room.getOrders());

        TimePeriod[] periods = getContinuePeriodsByOrders(orders);

        int idx;
        long now = getTodayEvening();
        if ((idx = inWhichPeriodIdx(periods, now)) != -1) {
            irs.setStartDate(new Date(periods[idx].getEndTime()));
            irs.setEndDate(idx < periods.length - 1 ?
                    new Date(periods[idx + 1].getStartTime()) :
                    new Date(periods[idx].getEndTime() + TimePeriod.WEEK));
        } else if ((idx = firstPeriodIdx(periods, now)) == periods.length) {
            irs.setStartDate(new Date(now));
            irs.setEndDate(new Date(now + TimePeriod.WEEK));
        } else {
            irs.setStartDate(new Date(now));
            irs.setEndDate(new Date(Math.min(now + TimePeriod.WEEK,
                    periods[idx].getStartTime())));
        }

        return irs;
    }

    private void setDateComparator() {
        dateComparator = new Comparator<Date>() {
            @Override
            public int compare(Date d1, Date d2) {
                long day1 = (d1.getTime() - TimePeriod.TIME_ZONE_OFFSET)
                        / TimePeriod.DAY;
                long day2 = (d2.getTime() - TimePeriod.TIME_ZONE_OFFSET)
                        / TimePeriod.DAY;
                long dif = day1 - day2;
                return dif < 0L ? -1 : (dif > 0L ? 1 : 0);
            }
        };
    }

    private void setOrderComparator() {
        orderComparator = new Comparator<Order>() {
            @Override
            public int compare(Order o1, Order o2) {
                return dateComparator.compare(o1.getCheckInDatetime(),
                        o2.getCheckInDatetime());
            }
        };
    }

    private void setOrderStatusForRoomHidden() {
        orderStatusForRoomHidden = new String[]
                { "待確認", "已確認", "住宿中", "待評價", "已評價" };

    }

    private void setRoomStatusForRoomHidden() {
        roomStatusForRoomHidden = new String[]
                { "未開放", "禁止使用", "準備中" };
    }

    private long getTodayEvening() {
        return (((new Date().getTime() + TimePeriod.TIME_ZONE_OFFSET)
                / TimePeriod.DAY * TimePeriod.DAY) + TimePeriod.HOUR * 20)
                - TimePeriod.TIME_ZONE_OFFSET;
    }

    private Set<Order> getValidOrders(Set<Order> orders) {
        // continue ...
        return orders;
    }

    private TimePeriod[] getContinuePeriodsByOrders(Set<Order> orders) {
        if (orders.isEmpty()) return new TimePeriod[0];
        Order[] a = orders.toArray(new Order[orders.size()]);

        Arrays.sort(a, orderComparator);

        List<TimePeriod> periods = new ArrayList<>();
        TimePeriod period = new TimePeriod();
        period.setStartTime(a[0].getCheckInDatetime());
        for (int i = 0; i != a.length; ++i) {
            if (i == a.length - 1) {
                period.setEndTime(a[i].getCheckOutDatetime());
                periods.add(period);
            } else if (dateComparator.compare(
                    a[i].getCheckOutDatetime(),
                    a[i + 1].getCheckInDatetime()) != 0) {
                period.setEndTime(a[i].getCheckOutDatetime());
                periods.add(period);
                period = new TimePeriod();
                period.setStartTime(a[i + 1].getCheckInDatetime());
            }
        }

        return periods.toArray(new TimePeriod[periods.size()]);
    }

    private int inWhichPeriodIdx(TimePeriod[] periods, long time) {
        return inWhichPeriodIdx(periods, time, 0, periods.length - 1);
    }

    private int inWhichPeriodIdx(
            TimePeriod[] periods, long time, int l, int r) {
        if (l > r) return -1;

        int m = (l + r) / 2;
        if (periods[m].isIn(time))
            return m;

        return time < periods[m].getStartTime() ?
                inWhichPeriodIdx(periods, time, l, m - 1) :
                    inWhichPeriodIdx(periods, time, m + 1, r);
    }

    private int firstPeriodIdx(TimePeriod[] periods, long time) {
        return firstPeriodIdx(periods, time, 0, periods.length - 1);
    }

    private int firstPeriodIdx(
            TimePeriod[] periods, long time, int l, int r) {
        if (l > r) return l;

        int m = (l + r) / 2;

        return periods[m].getStartTime() < time ?
                firstPeriodIdx(periods, time, m + 1, r) :
                    firstPeriodIdx(periods, time, l, m - 1);
    }

    private List< Room > getCurrentPageRooms(
            List< Room > list, int pageIndex, int roomsPerPage) {
        List< Room > roomList = new ArrayList<>();
        int roomSize = list.size();
        int pageSize = roomSize / roomsPerPage +
                (roomSize % roomsPerPage == 0 ? 0 : 1);

        if (pageIndex >= pageSize)
            return roomList;

        int start = pageIndex * roomsPerPage;
        int end = Math.min((pageIndex + 1) * roomsPerPage, roomSize);
        for (int i = start; i != end; i += 1)
            roomList.add(list.get(i));

        return roomList;
    }

    private void sortByMatchedKeysMap(
            List<Room> list, Map< Long, List< String > > map) {
        Collections.sort(list, new Comparator< Room >() {

            @Override
            public int compare(Room o1, Room o2) {
                Long id1 = o1.getId();
                Long id2 = o2.getId();
                int cnt1 = map.get(id1).size();
                int cnt2 = map.get(id2).size();

                return cnt1 < cnt2 ? 1 : (cnt1 > cnt2 ? -1 : (int)(id1 - id2));
            }

        });
    }

    private Map< Long, List< String > > getMatchedKeysMap(
            List< Room > list, String[] keys) {
        Map< Long, List< String > > map = new HashMap<>();

        Long id;
        List< String > matchedKeys;

        for (Room room : list) {
            id = room.getId();
            matchedKeys = new ArrayList<>();
            matchCount(room, keys, matchedKeys);

            map.put(id, matchedKeys);
        }

        return map;
    }

    private int matchCount(Room room, String[] keys, List< String > matched) {
        if (room == null) return 0;

        String str, lowerKey;
        int count = 0;
        boolean isMatch;

        for (String key : keys) {
            isMatch = false;
            lowerKey = key.toLowerCase();

            str = room.getAddress().toLowerCase();
            if (str != null && str.contains(lowerKey))
                isMatch = true;

            str = room.getInformation().getTitle().toLowerCase();
            if (str != null && str.contains(lowerKey))
                isMatch = true;

            str = room.getOwner().getInformation().getFirstName().toLowerCase();
            if (str != null && str.contains(lowerKey))
                isMatch = true;

            if (room.getServes() != null) {
                for (RoomServe roomServe : room.getServes()) {
                    str = roomServe.getTitle().toLowerCase();
                    if (str != null && str.contains(lowerKey))
                        isMatch = true;
                }
            }

            if (room.getDevices() != null) {
                for (RoomDevice roomDevice : room.getDevices()) {
                    str = roomDevice.getTitle().toLowerCase();
                    if (str != null && str.contains(lowerKey))
                        isMatch = true;
                }
            }

            if (isMatch) {
                if (matched != null)
                    matched.add(lowerKey);
                count += 1;
            }
        }

        return count;
    }

    private String[] getUnmatchedString(String[] reference, String[] target) {
        List< String > list = new ArrayList<>();
        boolean flag;

        for (String r : reference) {
            flag = false;
            for (String t : target) {
                if (t.equals(r))
                    flag = true;
            }

            if (!flag)
                list.add(r);
        }

        return list.toArray(new String[list.size()]);
    }

}
