package com.rental_ratings.api.api.mvc.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.rental_ratings.api.api.mvc.models.LoginUser;
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

    public void validate(User newUser, BindingResult result) {
        if (userRepository.findByEmail(newUser.getEmail()).isPresent()){
            result.rejectValue("email", "Unique Email", "Email has already been used!");
        }

        if (!newUser.getPassword().equals(newUser.getConfirmPassword())) {
            result.rejectValue("confirmPassword", "Matches", "The Confirm Password must match the Password!");
        }
    }

    public User register (User newUser) {

        String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashedPassword);
        return userRepository.save(newUser);
    }

    public User authenticate(LoginUser newLogin, BindingResult result) {
        Optional<User> user = userRepository.findByEmail(newLogin.getEmail());
        if (!user.isPresent()) {
            result.rejectValue("email", "Login Email", "Email not registered.");
            return null;
        }

        if (!BCrypt.checkpw(newLogin.getPassword(), user.get().getPassword())) {
            result.rejectValue("password", "Login Password", "Password does not match.");
            return null;
        }
        return user.get();
    }

    public User getById(Long id) {
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            return user.get();
        }
    
        return null;
    }
    
    public User getByEmail(String email) {
        Optional<User> u = userRepository.findByEmail(email);
        if (u.isPresent()) {
            return u.get();
        }
        return null;
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
}
