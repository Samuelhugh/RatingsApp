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

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "properties")
public class Property {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "created_at", updatable = false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;

    @Column(name = "updated_at")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

    @Column(name = "address_line1")
    @NotEmpty(message = "Please enter an address.")
    @Size(min = 5, message = "Please enter an address of at least 5 characters.")
    private String addressLine1;

//    @Column(name = "address_line2")
//    private String addressLine2;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "city")
    // @NotEmpty(message = "Please enter a city name.")
    private String city;

    @Column(name = "state")
    // @NotEmpty(message = "Please enter a state name.")
    private String state;

    @Column(name = "country")
    // @NotEmpty(message = "Please enter a country name.")
    private String country;


    @Column(name = "description")
    @NotEmpty(message = "Please enter a clear description of the rental.")
    @Size(min = 5, message = "Please enter description with at least 5 characters.")
    private String description;

    @Column(name = "price_description")
    @NotEmpty(message = "Please enter an accurate description of the rental price. (ex. $5 per night)")
    private String priceDescripiton;

	@JsonManagedReference(value = "property-rating")
    @OneToMany(mappedBy = "property", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = false)
    private List<Rating> myRatings;

    @JsonManagedReference(value = "property-comment")
    @OneToMany(mappedBy = "property", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = false)
    private List<Comment> myComments;

    @Column(name = "rental_type")
    private String rentalType;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="created_by_user_id")
    private User createdByUser;

	public List<Comment> getMyComments() {
        return myComments;
    }

    public void setMyComments(List<Comment> myComments) {
        this.myComments = myComments;
    }

    public User getCreatedByUser() {
		return createdByUser;
	}

	public void setCreatedByUser(User createdByUser) {
		this.createdByUser = createdByUser;
	}

	public Property() {}

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

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

//    public String getAddressLine2() {
//        return addressLine2;
//    }
//
//    public void setAddressLine2(String addressLine2) {
//        this.addressLine2 = addressLine2;
//    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPriceDescription() {
        return priceDescripiton;
    }

    public void setPriceDesription(String priceDescription) {
        this.priceDescripiton = priceDescription;
    }

    public List<Rating> getMyRatings() {
        return myRatings;
    }

    public void setMyRatings(List<Rating> myRatings) {
        this.myRatings = myRatings;
    }

    public String getPriceDescripiton() {
        return priceDescripiton;
    }

    public void setPriceDescripiton(String priceDescripiton) {
        this.priceDescripiton = priceDescripiton;
    }

    public String getRentalType() {
        return rentalType;
    }

    public void setRentalType(String rentalType) {
        this.rentalType = rentalType;
    }

}
