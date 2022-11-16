package team.lazybear.bearbnb.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;



@Entity
@Table(name = "\"ROOM_INFORMATION\"")
public class RoomInformation {
	@Id
	@Column(name = "\"Id\"")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "\"TITLE\"")
	private String title;
	@Column(name = "\"LONGITUDE\"")
	private Double longitude;
	@Column(name = "\"LATITUDE\"")
	private Double latitude;
	@Column(name = "\"MAX_PEOPLE_CAPACITY\"")
	private Integer maxPeopleCapacity;
	@Column(name = "\"MIN_PEOPLE_CAPACITY\"")
	private Integer minPeopleCapacity;

	@Column(name = "\"SINGLE_SIZE_BED_COUNT\"")
    private Integer singleSizeBedCount;
	@Column(name = "\"DOUBLE_SIZE_BED_COUNT\"")
    private Integer doubleSizeBedCount;
	@Column(name = "\"FLOOR_MATTRESS_COUNT\"")
	private Integer floorMattressCount;

	@Column(name = "\"BEDROOM_COUNT\"")
	private Integer bedroomCount;
	@Column(name = "\"BATHROOM_COUNT\"")
	private Integer bathroomCount;
	@Column(name = "\"AREA\"")
	private Double area;
	@Column(name = "\"INTRODUCTION\"")
	private String introduction;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_ROOM_ID")
	private Room room;

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "\"FK_ROOM_TYPE_ID\"")
	private RoomType type;

	public RoomInformation() {

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Integer getMaxPeopleCapacity() {
        return maxPeopleCapacity;
    }

    public void setMaxPeopleCapacity(Integer maxPeopleCapacity) {
        this.maxPeopleCapacity = maxPeopleCapacity;
    }

    public Integer getMinPeopleCapacity() {
        return minPeopleCapacity;
    }

    public void setMinPeopleCapacity(Integer minPeopleCapacity) {
        this.minPeopleCapacity = minPeopleCapacity;
    }

    public Integer getSingleSizeBedCount() {
        return singleSizeBedCount;
    }

    public void setSingleSizeBedCount(Integer singleSizeBedCount) {
        this.singleSizeBedCount = singleSizeBedCount;
    }

    public Integer getDoubleSizeBedCount() {
        return doubleSizeBedCount;
    }

    public void setDoubleSizeBedCount(Integer doubleSizeBedCount) {
        this.doubleSizeBedCount = doubleSizeBedCount;
    }

    public Integer getFloorMattressCount() {
        return floorMattressCount;
    }

    public void setFloorMattressCount(Integer floorMattressCount) {
        this.floorMattressCount = floorMattressCount;
    }

    public Integer getBedroomCount() {
		return bedroomCount;
	}

	public void setBedroomCount(Integer bedroomCount) {
		this.bedroomCount = bedroomCount;
	}

	public Integer getBathroomCount() {
		return bathroomCount;
	}

	public void setBathroomCount(Integer bathroomCount) {
		this.bathroomCount = bathroomCount;
	}

	public Double getArea() {
		return area;
	}

	public void setArea(Double area) {
		this.area = area;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public RoomType getType() {
		return type;
	}

	public void setType(RoomType type) {
		this.type = type;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

}
