package com.rental_ratings.api.api.mvc.models;

import java.util.Date;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;


import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "comments")
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTIFY)
	private Long id;
	@Column(name = "created_at", updatable= false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
	@Column(name = "updated_at")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
	@Column(name = "comment")
	public String comment;
	
	@JsonBackReference(value = "user-comment")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "by_user_id")
    private User user;
	
	@JsonBackReference(value = "property-comment")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "on_property_id")
    private Property property;
	
	public Comment() {}
	
	@Override
    public boolean equals (Object o) {
        
        if (this == o) { return true; }

        if (o == null || getClass() != o.getClass()) { return false; }

        Property that = (Property) o;
        return Objects.equals(this.id, that.id);
    }
	
	@Override
    public int hashCode() {
        return Objects.hash(this.id);
    }
	
	
	//on_comment_id
	
	
	@PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
        this.updatedAt = this.createdAt;
    }

    @PreUpdate()
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
	
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Property getProperty() {
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }

    //getters  and  setters  for on_comment_id
    
    
    
}