package com.rental_ratings.api.api.mvc.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.rental_ratings.api.api.mvc.models.Rating;

@Repository
public interface RatingRepository extends CrudRepository<Rating, Long> {

	public List<Rating> findAll();

	public Optional<Rating> findByUserIdAndPropertyId(Long userId, Long propertyId);

	public List<Rating> findAllByPropertyId(Long propertyId);
}
