package com.rental_ratings.api.api.mvc.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.rental_ratings.api.api.mvc.models.Property;
import com.rental_ratings.api.api.mvc.models.Rating;
import com.rental_ratings.api.api.mvc.services.PropertyService;
import com.rental_ratings.api.api.mvc.services.RatingService;

@Controller
public class RatingController {

	@Autowired
	RatingService ratingService;

	@Autowired
	PropertyService propertyService;

	// ****** RATE PROPERTY ******//

	@PostMapping("/property/{ratingAdded}")
	public String addRating(@PathVariable("ratingAdded") Long id, @Valid @ModelAttribute("rating") Rating rating,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			Property check = propertyService.getById(id);
			model.addAttribute("ratings", rating);
			model.addAttribute("propety", check);
			return "ratings.jsp";
		} else {
			ratingService.create(rating);
			return "redirect:/property/{ratingAdded}";
		}
	}

}
