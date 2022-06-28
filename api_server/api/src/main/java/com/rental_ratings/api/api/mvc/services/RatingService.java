package com.rental_ratings.api.api.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.rental_ratings.api.api.mvc.models.Property;
import com.rental_ratings.api.api.mvc.models.Rating;
import com.rental_ratings.api.api.mvc.models.User;
import com.rental_ratings.api.api.mvc.repositories.RatingRepository;

@Service
public class RatingService {
    
    private final RatingRepository ratingRepository;

    public RatingService(RatingRepository ratingRepository) {
        this.ratingRepository = ratingRepository;
    }

    public Rating create(Rating rating) {
        return ratingRepository.save(rating);
    }
    
    public List<Rating> getAll() {
		return this.ratingRepository.findAll();
	}

    public Rating update(Rating rating) {
        return ratingRepository.save(rating);
    }

    public void delete(Rating rating) {
        ratingRepository.delete(rating);
    }
    
    public Rating getById(Long id) {
		return this.ratingRepository.findById(id).orElse(null);
	}

    public Rating getByUser(User user) {
        Optional<Rating> r = ratingRepository.findByUserId(user.getId());
        if (r.isPresent()) {
            return r.get();
        }
        return null;
    }
    
    public List<Rating> getAllByProperty(Property property) {
        return this.ratingRepository.findAllByPropertyId(property.getId());
    }

}