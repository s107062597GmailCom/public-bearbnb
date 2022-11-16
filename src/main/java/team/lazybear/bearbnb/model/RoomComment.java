package team.lazybear.bearbnb.model;

import java.util.Date;

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

@Entity
@Table(name="\"ROOM_COMMENT\"")
public class RoomComment {
	@Id
	@Column(name="\"ID\"")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="CONTENT_TEXT")
	private String contentText;
	@Column(name="\"POINT\"")
	private Integer point;
	@Column(name="\"CREATED_AT\"")
	private Date createdAt;
	
	@OneToOne(mappedBy = "comment")
	private Order order;
	
	@ManyToOne(fetch= FetchType.EAGER)
	@JoinColumn(name="\"FK_AUTHOR_ID\"")
	private Account author;
	@ManyToOne(fetch= FetchType.EAGER)
	@JoinColumn(name="\"FK_ROOM_ID\"")
	private Room room;
	
	public RoomComment() {
		
	}

	@PrePersist
	public void init() {
		if(createdAt ==null) {
			this.createdAt = new Date();
		}
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContentText() {
		return contentText;
	}

	public void setContentText(String contentText) {
		this.contentText = contentText;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Account getAuthor() {
		return author;
	}

	public void setAuthor(Account author) {
		this.author = author;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}
	
	
	
}
