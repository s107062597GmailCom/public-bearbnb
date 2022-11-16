package team.lazybear.bearbnb.model;



import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "\"ORDER\"")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "\"ID\"")
	private Integer id;

	@Column(name = "\"UUID\"")
	private String uuid;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "\"CHECK_IN_DATETIME\"")
	private Date checkInDatetime;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "\"CHECK_OUT_DATETIME\"")
	private Date checkOutDatetime;
	
	@Column(name = "\"CREATED_AT\"")
	private Date createdAt;
	@Column(name = "\"ADULT_COUNT\"")
	private Integer adultCount;
	@Column(name = "\"CHILD_COUNT\"")
	private Integer childCount;
	@Column(name = "\"PRICE\"")
	private Integer price;

	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "\"FK_VISITOR_ID\"")
	private Account account;

	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "\"FK_ROOM_ID\"")
	private Room room;

	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "\"FK_ORDER_STATUS_ID\"")
	private OrderStatus status;

	
	@OneToOne
	@JoinColumn(name = "\"FK_ROOM_COMMENT_ID\"")
	private RoomComment comment;

	public Order() {

	}

	@PrePersist
	public void init() {
		if (uuid == null) {
			uuid = UUID.randomUUID().toString();
		}
		if(createdAt ==null) {
			this.createdAt = new Date();
		}
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

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	public RoomComment getComment() {
		return comment;
	}

	public void setComment(RoomComment comment) {
		this.comment = comment;
	}
	
	


}
