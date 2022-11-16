package team.lazybear.bearbnb.model;



import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="\"ROOM_TYPE\"")
public class RoomType {
	
	@Id
	@Column(name="\"ID\"")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	
	@Column(name="\"TITLE\"")
	private String title;
	@Column(name="\"LOWER_LIMIT_PRICE\"")
	private Integer lowerLimitPrice;
	@Column(name="\"UPPER_LIMIT_PRICE\"")
	private Integer upperLimitPrice;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy="type")
	private Set<RoomInformation> roomInformations;
	
	public Set<RoomInformation> getRoomInformations() {
		return roomInformations;
	}

	public void setRoomInformations(Set<RoomInformation> roomInformations) {
		this.roomInformations = roomInformations;
	}

	public RoomType() {
	
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getLowerLimitPrice() {
		return lowerLimitPrice;
	}

	public void setLowerLimitPrice(Integer lowerLimitPrice) {
		this.lowerLimitPrice = lowerLimitPrice;
	}

	public Integer getUpperLimitPrice() {
		return upperLimitPrice;
	}

	public void setUpperLimitPrice(Integer upperLimitPrice) {
		this.upperLimitPrice = upperLimitPrice;
	}

	


}
