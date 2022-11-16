package team.lazybear.bearbnb.data;

import java.util.Date;

import team.lazybear.bearbnb.model.ChatDetail;

public class ChatDetailDto {
	private String type;

	private Long id;

	private Long chatroomId;

	private String speakerName;

	private String receiverName;

	private String contentText;

	private Date createdAt;

	private Integer status;

	public ChatDetailDto() {
		super();
	}

	public ChatDetailDto(ChatDetail chatDetail) {
		this.id = chatDetail.getId();
		this.speakerName = chatDetail.getSpeaker().getInformation().getFirstName() + " "
				+ chatDetail.getSpeaker().getInformation().getLastName();
		this.contentText = chatDetail.getContentText();
		this.createdAt = chatDetail.getCreatedAt();
		this.status = chatDetail.getStatus();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSpeakerName() {
		return speakerName;
	}

	public void setSpeakerName(String speakerName) {
		this.speakerName = speakerName;
	}

	public String getContentText() {
		return contentText;
	}

	public void setContentText(String contentText) {
		this.contentText = contentText;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Long getChatroomId() {
		return chatroomId;
	}

	public void setChatroomId(Long chatroomId) {
		this.chatroomId = chatroomId;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		status = status;
	}

}
