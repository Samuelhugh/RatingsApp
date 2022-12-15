package com.rental_ratings.api.api.mvc.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.rental_ratings.api.api.mvc.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	public Optional<User> findByEmail(String email);

	public Optional<User> findById(Long id);

	public List<User> findAll();
}
