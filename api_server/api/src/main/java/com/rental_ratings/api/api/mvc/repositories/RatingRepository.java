package com.rental_ratings.api.api.mvc.repositories;

import com.rental_ratings.api.api.mvc.models.Rating;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RatingRepository extends CrudRepository<Rating, Long> {
    
    public List<Rating> findAll();

    public List<Rating> findAllByUserId(Long userId);

    public List<Rating> findAllByPropertyId(Long propertyId);
}
