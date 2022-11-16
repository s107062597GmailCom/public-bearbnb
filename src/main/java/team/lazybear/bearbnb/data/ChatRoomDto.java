package team.lazybear.bearbnb.data;

import java.util.Date;

public class ChatRoomDto {
    private Long id;
    
    private String receverName;
    
    private String receverImgUUID;
    
    private String latestMsg;
    
    private Date latestMsgDate;
    
    private Integer latestMsgStatus;

    public ChatRoomDto() {
       
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReceverName() {
        return receverName;
    }

    public void setReceverName(String receverName) {
        this.receverName = receverName;
    }

    public String getReceverImgUUID() {
        return receverImgUUID;
    }

    public void setReceverImgUUID(String receverImgUUID) {
        this.receverImgUUID = receverImgUUID;
    }

    public String getLatestMsg() {
        return latestMsg;
    }

    public void setLatestMsg(String latestMsg) {
        this.latestMsg = latestMsg;
    }

    public Date getLatestMsgDate() {
        return latestMsgDate;
    }

    public void setLatestMsgDate(Date latestMsgDate) {
        this.latestMsgDate = latestMsgDate;
    }

    public Integer getLatestMsgStatus() {
        return latestMsgStatus;
    }

    public void setLatestMsgStatus(Integer latestMsgStatus) {
        this.latestMsgStatus = latestMsgStatus;
    }
    
    
}
