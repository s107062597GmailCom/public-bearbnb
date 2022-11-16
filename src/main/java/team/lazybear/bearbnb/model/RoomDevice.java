package team.lazybear.bearbnb.model;



import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="\"ROOM_DEVICE\"")
public class RoomDevice {

	@Id
	@Column(name="\"ID\"")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "\"TITLE\"")
	private String title;

	@Column(name = "\"ICON_TAG\"")
    private String iconTag;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name="\"ROOM_TO_ROOM_DEVICE\""
	,joinColumns = {@JoinColumn(name="\"FK_ROOM_DEVICE_ID\"",referencedColumnName = "\"ID\"")}
	,inverseJoinColumns = {@JoinColumn(name="\"FK_ROOM_ID\"",referencedColumnName = "\"ID\"")})
	private Set<Room> rooms = new LinkedHashSet<Room>();


	public RoomDevice() {

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


	public String getIconTag() {
        return iconTag;
    }


    public void setIconTag(String iconTag) {
        this.iconTag = iconTag;
    }


    public void setTitle(String title) {
		this.title = title;
	}


	public Set<Room> getRooms() {
		return rooms;
	}


	public void setRooms(Set<Room> rooms) {
		this.rooms = rooms;
	}



}
