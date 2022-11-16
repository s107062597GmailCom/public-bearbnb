package team.lazybear.bearbnb.model;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;

@Entity
@Table( name = "\"hello\"" )
public class Hello {

    @Id
    @Column( name = "\"id\"" )
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    private Long id;

    @Column( name = "\"uuid\"" )
    private String uuid;

    @Column( name = "\"greeting\"" )
    private String greeting;

    @Column( name = "\"created_at\"" )
    private Date createdAt;
    
    @PrePersist
	public void init() {
		if (uuid == null) {
			uuid = UUID.randomUUID().toString();
		}
		if(createdAt == null) {
			this.createdAt = new Date();
		}
	}

    public Hello() { super(); }

    public Hello( Long id, String uuid, String greeting, Date createdAt ) {
        super();
        setId( id );
        setUuid( uuid );
        setGreeting( greeting );
        setCreatedAt( createdAt );
    }

    public Hello setId(Long id) {
        this.id = id;
        return this;
    }

    public Long getId() {
        return id;
    }

  

    public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Hello setGreeting(String greeting) {
        this.greeting = greeting;
        return this;
    }

    public String getGreeting() {
        return greeting;
    }

    public Hello setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
        return this;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

}
