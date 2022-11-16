package team.lazybear.bearbnb.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "\"ACCOUNT\"")
public class Account {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "\"ID\"")
	private Long id;

	@Column(name = "\"UUID\"")
	private String uuid;
	@Column(name = "\"USERNAME\"")
	private String username;
	@Column(name = "\"PASSWORD\"")
	private String password;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "\"FK_ACCOUNT_IDENTITY_ID\"")
	private AccountIdentity identity;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "\"CREATED_AT\"")
	private Date createdAt;
	@Column(name = "\"SALT\"")
	private String salt;

	@OneToOne(mappedBy = "account", cascade = CascadeType.ALL)
	private AccountInformation information;
	@JsonIgnore
	@OneToOne(mappedBy = "account")
	private AccountPhoto photo;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "\"FK_ACCOUNT_STATUS_ID\"")
	private AccountStatus status;

	@OneToMany(mappedBy = "author")
	private Set<RoomComment> RoomComments;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	private Set<Order> orders;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "owner")
	private Set<Room> rooms;

	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "\"WISH\"", joinColumns = {
			@JoinColumn(name = "\"FK_ACCOUNT_ID\"", referencedColumnName = "\"ID\"") }, inverseJoinColumns = {
					@JoinColumn(name = "\"FK_ROOM_ID\"", referencedColumnName = "\"ID\"") })
	private Set<Room> wishes = new HashSet<>();

	@PrePersist
	public void init() {
		if (uuid == null) {
			uuid = UUID.randomUUID().toString();
		}
		if (createdAt == null) {
			this.createdAt = new Date();
		}
		if (salt == null) {
			salt = UUID.randomUUID().toString().replace("-", "");
		}
	}

	public Account() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public AccountIdentity getIdentity() {
		return identity;
	}

	public void setIdentity(AccountIdentity identity) {
		this.identity = identity;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt() {
		this.salt = UUID.randomUUID().toString().replace("-", "");
	}

	public AccountInformation getInformation() {
		return information;
	}

	public void setInformation(AccountInformation information) {
		this.information = information;
	}

	public AccountPhoto getPhoto() {
		return photo;
	}

	public void setPhoto(AccountPhoto photo) {
		this.photo = photo;
	}

	public AccountStatus getStatus() {
		return status;
	}

	public void setStatus(AccountStatus status) {
		this.status = status;
	}

	public Set<RoomComment> getRoomComments() {
		return RoomComments;
	}

	public void setRoomComments(Set<RoomComment> roomComments) {
		RoomComments = roomComments;
	}

	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	public Set<Room> getRooms() {
		return rooms;
	}

	public void setRooms(Set<Room> rooms) {
		this.rooms = rooms;
	}

	public Set<Room> getWishes() {
		return wishes;
	}

	public void setWishes(Set<Room> wishes) {
		this.wishes = wishes;
	}

}
