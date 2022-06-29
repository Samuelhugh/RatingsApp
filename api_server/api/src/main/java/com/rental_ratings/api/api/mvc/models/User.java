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
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "created_at", updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @Column(name = "updated_at")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @Column(name = "display_name")
    private String displayName;
    
    @Column(name = "first_name")
    @NotEmpty(message = "Please enter a first name.")
    @Size(min = 3, max = 255, message = "First name must be between 3 and 255 characters.")
    private String firstName;

    @Column(name = "last_name")
    @NotEmpty(message = "Please enter a last name.")
    @Size(min = 3, max = 255, message = "Last name must be between 3 and 255 characters.")
    private String lastName;

    @Column(name = "email", unique = true)
    @Email(message = "Please enter a valid email address.")
    private String email;

    @Column(name = "password_hash")
    @NotEmpty(message = "A password is required!")
    @Size(min = 8, max = 255, message = "Password must be between 8 and 255 characters")
    private String password;

    @Transient
    @NotEmpty(message = "Please confirm your password.")
    @Size(min = 8, max = 255, message = "Confirm password must be between 8 and 255 characters")
    private String confirmPassword;

//    @Column(name = "age")
//    @NotEmpty(message = "Please enter your age.")
//    @Size(min = 18, message = "You need to be at least 18 to register on this site.")
//    private Integer age;

    @JsonManagedReference(value = "user-rating")
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<Rating> myRatings;
    
    @OneToMany(mappedBy="createdByUser", cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Property> propertyUser;

	public List<Property> getPropertyUser() {
		return propertyUser;
	}

	public void setPropertyUser(List<Property> propertyUser) {
		this.propertyUser = propertyUser;
	}

	public User() {}

    @Override
    public String toString() {
        return "User [createdAt=" + createdAt + ", displayName=" + displayName + ", email=" + email + ", firstName="
                + firstName + ", id=" + id + ", lastName=" + lastName + ", myRatings=" + myRatings + ", passwordHash="
                + password + ", updatedAt=" + updatedAt + "]";
    }

    @Override
    public boolean equals (Object o) {
        
        if (this == o) { return true; }

        if (o == null || getClass() != o.getClass()) { return false; }

        User that = (User) o;
        return Objects.equals(this.id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.id, this.firstName, this.lastName, this.email);
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

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Rating> getMyRatings() {
        return myRatings;
    }

    public void setMyRatings(List<Rating> myRatings) {
        this.myRatings = myRatings;
    }

//    public Integer getAge() {
//        return age;
//    }
//
//    public void setAge(Integer age) {
//        this.age = age;
//    }

    public String getConfirmPassword() {
        return this.confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}
