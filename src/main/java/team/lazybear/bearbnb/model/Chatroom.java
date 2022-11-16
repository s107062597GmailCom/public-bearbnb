package team.lazybear.bearbnb.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name="\"CHATROOM\"")
public class Chatroom {
    @Id
    @Column(name="\"ID\"")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @JoinColumn(name="\"FK_ACCOUNT_LARGER_ID\"")
    @ManyToOne(cascade = CascadeType.ALL)
    private Account largerIdAccount;
    
    @JoinColumn(name="\"FK_ACCOUNT_SMALLER_ID\"")
    @ManyToOne(cascade = CascadeType.ALL)
    private Account smallerIdAccount;
    
    @OneToMany(mappedBy = "chatRoom")
    private Set<ChatDetail> chatDetails;
    

    public Chatroom() {
        
    }
    public Chatroom(Account account1,Account account2) {
        if(account1.getId()<account2.getId()) {
            this.smallerIdAccount = account1;
            this.largerIdAccount = account2;
        }else {
            this.smallerIdAccount = account2;
            this.largerIdAccount = account1;
        }
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }



    public Account getLargerIdAccount() {
        return largerIdAccount;
    }

    public void setLargerIdAccount(Account largerIdAccount) {
        this.largerIdAccount = largerIdAccount;
    }

    public Set<ChatDetail> getChatDetails() {
        return chatDetails;
    }

    public void setChatDetails(Set<ChatDetail> chatDetails) {
        this.chatDetails = chatDetails;
    }

    public Account getSmallerIdAccount() {
        return smallerIdAccount;
    }

    public void setSmallerIdAccount(Account smallerIdAccount) {
        this.smallerIdAccount = smallerIdAccount;
    }
    
    
}
