package team.lazybear.bearbnb.model;



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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.hibernate.annotations.OrderBy;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "\"ROOM\"")
public class Room {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "\"ID\"")
	private Long id;


	@Column(name = "\"UUID\"")
	private String uuid;

	@Column(name = "\"PRICE\"")
	private Integer price;

	@Column(name = "\"ADDRESS\"")
	private String address;

	@OneToOne
	@JoinColumn(name = "\"FK_FRONT_COVER_ID\"")
	private RoomPhoto frontCoverPhoto;
	@OneToOne(mappedBy = "room",cascade = CascadeType.ALL)
	private RoomInformation information;

	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name = "\"FK_CITY_ID\"")
	private City city;
	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name="FK_OWNER_ID")
	private Account owner;

	@ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name = "\"FK_ROOM_STATUS_ID\"")
	private RoomStatus status;

	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "room")
	@OrderBy(clause = "ID")
	private Set<RoomPhoto> photos;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "room")
	private Set<RoomComment> comments;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "room")
	private Set<Order> orders;

	@ManyToMany(mappedBy = "rooms")
	@OrderBy(clause = "FK_ROOM_SERVE_ID")
	private Set<RoomServe> serves;
	@ManyToMany(mappedBy = "rooms")
	@OrderBy(clause = "FK_ROOM_DEVICE_ID")
	private Set<RoomDevice> devices;
	@ManyToMany(mappedBy = "rooms")
	@OrderBy(clause = "FK_ROOM_RESTRICT_ID")
	private Set<RoomRestrict> restricts;

	@JsonIgnore
	@ManyToMany(mappedBy = "wishes")
	private Set<Account> wishers = new HashSet<>();

	@PrePersist
	public void init() {
		if (uuid == null) {
			uuid = UUID.randomUUID().toString();
		}
	}

	public Room() {

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

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public RoomPhoto getFrontCoverPhoto() {
		return frontCoverPhoto;
	}

	public void setFrontCoverPhoto(RoomPhoto frontCoverPhoto) {
		this.frontCoverPhoto = frontCoverPhoto;
	}

	public RoomInformation getInformation() {
		return information;
	}

	public void setInformation(RoomInformation information) {
		this.information = information;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public Account getOwner() {
		return owner;
	}

	public void setOwner(Account owner) {
		this.owner = owner;
	}

	public RoomStatus getStatus() {
		return status;
	}

	public void setStatus(RoomStatus status) {
		this.status = status;
	}

	public Set<RoomPhoto> getPhotos() {
		return photos;
	}

	public void setPhotos(Set<RoomPhoto> photos) {
		this.photos = photos;
	}

	public Set<RoomComment> getComments() {
		return comments;
	}

	public void setComments(Set<RoomComment> comments) {
		this.comments = comments;
	}

	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	public Set<RoomServe> getServes() {
		return serves;
	}

	public void setServes(Set<RoomServe> serves) {
		this.serves = serves;
	}

	public Set<RoomDevice> getDevices() {
		return devices;
	}

	public void setDevices(Set<RoomDevice> devices) {
		this.devices = devices;
	}

	public Set<RoomRestrict> getRestricts() {
		return restricts;
	}

	public void setRestricts(Set<RoomRestrict> restricts) {
		this.restricts = restricts;
	}

    public Set<Account> getWishers() {
        return wishers;
    }

    public void setWishers(Set<Account> wishers) {
        this.wishers = wishers;
    }

}
