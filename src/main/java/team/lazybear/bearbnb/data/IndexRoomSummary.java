package team.lazybear.bearbnb.data;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import team.lazybear.bearbnb.model.Room;
import team.lazybear.bearbnb.model.RoomPhoto;

public class IndexRoomSummary {

    private SimpleDateFormat sdf =
            new SimpleDateFormat("yyyy 年 MM 月 dd 日");

    private String uuid;

    private String title;

    private String city;

    private String address;

    private String ownerFirstName;

    private Double latitude;

    private Double longitude;

    private String startDate;

    private String endDate;

    private Integer price;

    private String cover;

    private String[] images;

    private String[] unmatched;

    public IndexRoomSummary() {}

    public IndexRoomSummary(Room room) {
        setUuid(room.getUuid());
        setTitle(room.getInformation().getTitle());
        setCity(room.getCity().getTitle());
        setAddress(room.getAddress());
        setOwnerFirstName(room.getOwner().getInformation().getFirstName());
        setLatitude(room.getInformation().getLatitude());
        setLongitude(room.getInformation().getLongitude());
        setPrice(room.getPrice());
        setCover(room.getFrontCoverPhoto().getUuid());
        setImages(room.getPhotos());
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOwnerFirstName() {
        return ownerFirstName;
    }

    public void setOwnerFirstName(String ownerFirstName) {
        this.ownerFirstName = ownerFirstName;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        setStartDate(sdf.format(startDate));
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        setEndDate(sdf.format(endDate));
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String[] getImages() {
        return images;
    }

    public void setImages(String[] images) {
        this.images = images;
    }

    public void setImages(Set<RoomPhoto> images) {
        List<String> list = new ArrayList<>();
        for (RoomPhoto photo : images)
            if (cover != null && !cover.equals(photo.getUuid()))
                list.add(photo.getUuid());
        setImages(list.toArray(new String[list.size()]));
    }

    public void setUnmatched(String[] unmatched) {
        this.unmatched = unmatched;
    }

    public String[] getUnmatched() {
        return this.unmatched;
    }

}
