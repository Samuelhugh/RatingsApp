package com.rental_ratings.api.api.mvc.models;

import java.util.Date;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "ratings", uniqueConstraints = { @UniqueConstraint(name = "SingleRating", columnNames = {"user_id", "property_id"})})
public class Rating {

    @EmbeddedId
    private RatingsId id = new RatingsId();

    @Column(name = "created_at", updatable = false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;

    @Column(name = "updated_at")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

    @Column(name = "rating")
    @Max(5)
    @Min(1)
    @NotNull
    private Integer rating;

    @JsonBackReference(value = "user-rating")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", insertable = false, updatable= false)
    private User user;

    @JsonBackReference(value = "property-rating")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "property_id", insertable = false, updatable = false)
    private Property property;

    public Rating() {}

    @Override
    public boolean equals (Object o) {
        
        if (this == o) { return true; }

        if (o == null || getClass() != o.getClass()) { return false; }

        Rating that = (Rating) o;
        return Objects.equals(this.user.getId(), that.user.getId()) && Objects.equals(this.property.getId(), that.property.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.user.getId(), this.property.getId());
    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
        this.updatedAt = this.createdAt;
    }

    @PreUpdate()
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    public RatingsId getId() {
        return id;
    }

    public void setId(RatingsId ratingsId) {
        this.id = ratingsId;
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

    public Integer getRating() {
        return this.rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
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

    @Override
    public String toString() {
        return "Rating [createdAt=" + createdAt + ", id=" + id + ", rating=" + rating + ", updatedAt=" + updatedAt
                + "]";
    }

}
