package com.rental_ratings.api.api.mvc.models;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "comments")
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "created_at", updatable= false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;

	@Column(name = "updated_at")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

    @Column(name = "on_comment_id", insertable = false, updatable= false)
    private Long onCommentId;

    @Column(name = "on_property_id", insertable = false, updatable= false)
    private Long onPropertyId;

	@Column(name = "comment")
    @NotEmpty(message = "Please enter a comment.")
    @Size(min = 5, message = "Please enter a comment of at least 5 characters.")
	public String comment;
	
	@JsonBackReference(value = "user-comment")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "by_user_id")
    private User user;
	
	@JsonBackReference(value = "property-comment")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "on_property_id")
    private Property property;

    @JsonBackReference(value = "comment-comment")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "on_comment_id")
    private Comment parentComment;

    @JsonManagedReference(value = " comment-comment")
    @OneToMany(mappedBy = "parentComment", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = false)
    private List<Comment> childComments;

	
	public Comment() {}
	
	@Override
    public boolean equals (Object o) {
        
        if (this == o) { return true; }

        if (o == null || getClass() != o.getClass()) { return false; }

        Comment that = (Comment) o;
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

    @Override
    public String toString() {
        return "Comment [comment=" + comment + "]";
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

    public Comment getParentComment() {
        return parentComment;
    }

    public void setParentComment(Comment parentComment) {
        this.parentComment = parentComment;
    }
    
    //getters  and  setters  for on_comment_id
    public List<Comment> getChildComments() {
        return childComments;
    }

    public void setChildComments(List<Comment> childComments) {
        this.childComments = childComments;
    }

    public Long getOnCommentId() {
        return onCommentId;
    }

    public void setOnCommentId(Long onCommentId) {
        this.onCommentId = onCommentId;
    }

    public Long getOnPropertyId() {
        return onPropertyId;
    }

    public void setOnPropertyId(Long onPropertyId) {
        this.onPropertyId = onPropertyId;
    }

}