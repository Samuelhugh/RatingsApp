package com.rental_ratings.api.api.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.rental_ratings.api.api.mvc.models.User;
import com.rental_ratings.api.api.mvc.repositories.UserRepository;

@Service
public class UserService {
    
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAll() {
        return userRepository.findAll();
    }

    public User create(User user) {
        return userRepository.save(user);
    }

    public User update(User user) {
        return userRepository.save(user);
    }

    public void delete(User user) {
        userRepository.delete(user);
    }

    public void delete(Long id) {
        userRepository.deleteById(id);
    }

    public User getById(Long id) {
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            return user.get();
        }

        return null;
    }

    public User getByEmail(User user) {
        Optional<User> u = userRepository.findByEmail(user.getEmail());
        if (u.isPresent()) {
            return u.get();
        }
        return null;
    }
}
