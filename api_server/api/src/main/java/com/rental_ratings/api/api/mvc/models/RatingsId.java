package com.rental_ratings.api.api.mvc.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class RatingsId implements Serializable {
    
    @Column(name = "user_id")
    private Long userId;

    @Column(name = "property_id")
    private Long propertyId;

    public RatingsId(Long userId, Long propertyId) {
        this.userId = userId;
        this.propertyId = propertyId;
    }

    public RatingsId() {}

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(Long propertyId) {
        this.propertyId = propertyId;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((propertyId == null) ? 0 : propertyId.hashCode());
        result = prime * result + ((userId == null) ? 0 : userId.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        RatingsId other = (RatingsId) obj;
        if (propertyId == null) {
            if (other.propertyId != null)
                return false;
        } else if (!propertyId.equals(other.propertyId))
            return false;
        if (userId == null) {
            if (other.userId != null)
                return false;
        } else if (!userId.equals(other.userId))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "RatingsId [propertyId=" + propertyId + ", userId=" + userId + "]";
    }

    
}
