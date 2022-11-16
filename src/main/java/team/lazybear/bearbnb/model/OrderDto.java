package team.lazybear.bearbnb.model;

import java.io.Serializable;

public class OrderDto implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	private String checkInDatetime;
	
	private String checkOutDatetime;
	
	private String createdAt;
	
	private Integer adultCount;
	
	private Integer childCount;
	
	private Integer price;

	private OrderStatus status;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCheckInDatetime() {
		return checkInDatetime;
	}
	public void setCheckInDatetime(String checkInDatetime) {
		this.checkInDatetime = checkInDatetime;
	}
	public String getCheckOutDatetime() {
		return checkOutDatetime;
	}
	public void setCheckOutDatetime(String checkOutDatetime) {
		this.checkOutDatetime = checkOutDatetime;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
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
	public OrderStatus getStatus() {
		return status;
	}
	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	
	
	
}
