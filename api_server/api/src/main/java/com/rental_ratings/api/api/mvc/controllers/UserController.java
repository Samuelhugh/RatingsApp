package com.rental_ratings.api.api.mvc.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.MediaType;

import com.rental_ratings.api.api.mvc.models.User;
import com.rental_ratings.api.api.mvc.services.UserService;

@RestController
@RequestMapping(path = "/api/", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
public class UserController {
    
    private final UserService users;

    public UserController(UserService users) {
        this.users = users;
    }

    @RequestMapping(path = "/users", method = RequestMethod.GET)
    // @GetMapping("/api/users")
    public List<User> getAllUsers() {
        return users.getAll();
    }

    @RequestMapping(path = "/users/{id}", method = RequestMethod.GET)  
    // @GetMapping("/api/users/{id}")
    public User getUserById(
        @PathVariable("id") Long id
    ) {
        return users.getById(id);
    }

    @RequestMapping(path = "/users", method = RequestMethod.POST)
    // @PostMapping("/api/users")
    public User createUser(
        @RequestBody User newUser,
        BindingResult result
    ) {
        //Validation check

        System.out.println(newUser);
        User _user = users.create(newUser);

        return _user;
    }
}
