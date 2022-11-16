package team.lazybear.bearbnb.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;

@Entity
@Table(name="\"CHAT_DETAIL\"")
public class ChatDetail {
    @Id
    @Column(name="\"ID\"")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;

    @JoinColumn(name="\"FK_CHATROOM_ID\"")
    @ManyToOne(cascade = CascadeType.ALL)
    private Chatroom chatRoom;

    @JoinColumn(name="\"FK_SPEAKER_ID\"")
    @ManyToOne(cascade = CascadeType.ALL)
    private Account speaker;

    @Column(name="\"CONTENT_TEXT\"")
    private String contentText;

    @Column(name="\"CREATED_AT\"")
    private Date createdAt;

    @Column(name="\"STATUS\"")
    private Integer status;

    public ChatDetail() {}

    @PrePersist
    public void init() {
        if (createdAt == null) {
            createdAt = new Date();
        }

        if (status == null) {
            status = 0;
        }
    }

    public Long getId() {
        return Id;
    }
    public void setId(Long id) {
        Id = id;
    }
    public Chatroom getChatRoom() {
        return chatRoom;
    }
    public void setChatRoom(Chatroom chatRoom) {
        this.chatRoom = chatRoom;
    }
    public Account getSpeaker() {
        return speaker;
    }
    public void setSpeaker(Account speaker) {
        this.speaker = speaker;
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
    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
}
