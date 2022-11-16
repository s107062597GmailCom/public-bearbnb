package team.lazybear.bearbnb.data;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import team.lazybear.bearbnb.model.Order;

public class OrderDto {

	private Integer id;

	private String uuid;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date checkInDatetime;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date checkOutDatetime;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date createdAt;
	private Integer adultCount;
	private Integer childCount;
	private Integer price;

	// Visitor相關
	private String visitor_Uuid;
	private String visitor_FirstName;
	private String visitor_LastName;
	private String visitor_phoneNumber;
	private String visitor_photo_Uuid;

	// Room相關
	private String room_Uuid;
	private String room_Address;
	private String room_Title;
	private Double room_longitude;
	private Double room_latitude;

	// Room Host相關
	private String host_Uuid;
	private String host_FirstName;
	private String host_LastName;
	private String host_phoneNumber;
	private String host_photo_Uuid;

	// orderstatus相關
	private String order_Status;

	public OrderDto(Order order) {
		super();
		this.id = order.getId();
		this.uuid = order.getUuid();
		this.checkInDatetime = order.getCheckInDatetime();
		this.checkOutDatetime = order.getCheckOutDatetime();
		this.createdAt = order.getCreatedAt();
		this.adultCount = order.getAdultCount();
		this.childCount = order.getChildCount();
		this.price = order.getPrice();
		this.visitor_Uuid = order.getAccount().getUuid();
		this.visitor_FirstName = order.getAccount().getInformation().getFirstName();
		this.visitor_LastName = order.getAccount().getInformation().getLastName();
		this.visitor_phoneNumber = order.getAccount().getInformation().getPhoneNumber();
		this.visitor_photo_Uuid = order.getAccount().getPhoto().getUuid();
		this.room_Uuid = order.getRoom().getUuid();
		this.room_Address = order.getRoom().getAddress();
		this.room_Title = order.getRoom().getInformation().getTitle();
		this.room_longitude = order.getRoom().getInformation().getLongitude();
		this.room_latitude = order.getRoom().getInformation().getLatitude();
		this.host_Uuid = order.getRoom().getOwner().getUuid();
		this.host_FirstName = order.getRoom().getOwner().getInformation().getFirstName();
		this.host_LastName = order.getRoom().getOwner().getInformation().getLastName();
		this.host_photo_Uuid = order.getRoom().getOwner().getPhoto().getUuid();
		this.host_phoneNumber = order.getRoom().getOwner().getInformation().getPhoneNumber();
		this.order_Status = order.getStatus().getTitle();

	}

	public OrderDto() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Date getCheckInDatetime() {
		return checkInDatetime;
	}

	public void setCheckInDatetime(Date checkInDatetime) {
		this.checkInDatetime = checkInDatetime;
	}

	public Date getCheckOutDatetime() {
		return checkOutDatetime;
	}

	public void setCheckOutDatetime(Date checkOutDatetime) {
		this.checkOutDatetime = checkOutDatetime;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Integer getAdultCount() {
		return adultCount;
	}

	public void setAdultCount(Integer adultCount) {
		this.adultCount = adultCount;
	}

	public Integer getChildCount() {
		return childCount;
	}

	public void setChildCount(Integer childCount) {
		this.childCount = childCount;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getVisitor_Uuid() {
		return visitor_Uuid;
	}

	public void setVisitor_Uuid(String visitor_Uuid) {
		this.visitor_Uuid = visitor_Uuid;
	}

	public String getVisitor_FirstName() {
		return visitor_FirstName;
	}

	public void setVisitor_FirstName(String visitor_FirstName) {
		this.visitor_FirstName = visitor_FirstName;
	}

	public String getVisitor_LastName() {
		return visitor_LastName;
	}

	public void setVisitor_LastName(String visitor_LastName) {
		this.visitor_LastName = visitor_LastName;
	}

	public String getRoom_Uuid() {
		return room_Uuid;
	}

	public void setRoom_Uuid(String room_Uuid) {
		this.room_Uuid = room_Uuid;
	}

	public String getRoom_Address() {
		return room_Address;
	}

	public void setRoom_Address(String room_Address) {
		this.room_Address = room_Address;
	}

	public String getRoom_Title() {
		return room_Title;
	}

	public void setRoom_Title(String room_Title) {
		this.room_Title = room_Title;
	}

	public String getHost_Uuid() {
		return host_Uuid;
	}

	public void setHost_Uuid(String host_Uuid) {
		this.host_Uuid = host_Uuid;
	}

	public String getHost_FirstName() {
		return host_FirstName;
	}

	public void setHost_FirstName(String host_FirstName) {
		this.host_FirstName = host_FirstName;
	}

	public String getHost_LastName() {
		return host_LastName;
	}

	public void setHost_LastName(String host_LastName) {
		this.host_LastName = host_LastName;
	}

	public String getOrder_Status() {
		return order_Status;
	}

	public void setOrder_Status(String order_Status) {
		this.order_Status = order_Status;
	}

	public String getVisitor_phoneNumber() {
		return visitor_phoneNumber;
	}

	public void setVisitor_phoneNumber(String visitor_phoneNumber) {
		this.visitor_phoneNumber = visitor_phoneNumber;
	}

	public String getHost_phoneNumber() {
		return host_phoneNumber;
	}

	public void setHost_phoneNumber(String host_phoneNumber) {
		this.host_phoneNumber = host_phoneNumber;
	}

	public Double getRoom_longitude() {
		return room_longitude;
	}

	public void setRoom_longitude(Double room_longitude) {
		this.room_longitude = room_longitude;
	}

	public Double getRoom_latitude() {
		return room_latitude;
	}

	public void setRoom_latitude(Double room_latitude) {
		this.room_latitude = room_latitude;
	}

	public String getVisitor_photo_Uuid() {
		return visitor_photo_Uuid;
	}

	public void setVisitor_photo_Uuid(String visitor_photo_Uuid) {
		this.visitor_photo_Uuid = visitor_photo_Uuid;
	}

	public String getHost_photo_Uuid() {
		return host_photo_Uuid;
	}

	public void setHost_photo_Uuid(String host_photo_Uuid) {
		this.host_photo_Uuid = host_photo_Uuid;
	}

}
