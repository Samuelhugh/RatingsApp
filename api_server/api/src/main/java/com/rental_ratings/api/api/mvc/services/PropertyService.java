package com.rental_ratings.api.api.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.rental_ratings.api.api.mvc.models.Property;
import com.rental_ratings.api.api.mvc.repositories.PropertyRepository;

@Service
public class PropertyService {
    
    private final PropertyRepository propertyRepository;

    public PropertyService(PropertyRepository propertyRepository) {
        this.propertyRepository = propertyRepository;
    }

    public Property create(Property property) {
        return propertyRepository.save(property);
    }

    public Property update(Property property) {
        return propertyRepository.save(property);
    }

    public void delete(Property property) {
        propertyRepository.delete(property);
    }

    public void delete(Long id) {
        propertyRepository.deleteById(id);
    }

	public Property getById(Long id) {
		Optional<Property> property = propertyRepository.findById(id);
        if (property.isPresent()) {
            return property.get();
        }
        return null;
	}

	// added method to find all properties for dashboard display //
	public List<Property> findAll(){
		return this.propertyRepository.findAll();
	}
	
	
    public List<Property> getByCity(String city) {
        return propertyRepository.findAllByCity(city);
    }

    public List<Property> getByState(String state) {
        return propertyRepository.findAllByState(state);
    }

    public List<Property> getByCountry(String country) {
        return propertyRepository.findAllByCountry(country);
    }
}
