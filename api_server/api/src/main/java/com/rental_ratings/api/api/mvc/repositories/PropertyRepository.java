package com.rental_ratings.api.api.mvc.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.rental_ratings.api.api.mvc.models.Property;

@Repository
public interface PropertyRepository extends CrudRepository<Property, Long> {
    
    public List<Property> findAll();

    public List<Property> findAllByCity(String city);

    public List<Property> findAllByState(String state);

    public List<Property> findAllByCountry(String country);
}
