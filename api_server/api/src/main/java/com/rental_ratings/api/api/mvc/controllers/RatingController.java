package com.rental_ratings.api.api.mvc.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.rental_ratings.api.api.mvc.models.Comment;
import com.rental_ratings.api.api.mvc.models.Property;
import com.rental_ratings.api.api.mvc.models.Rating;
import com.rental_ratings.api.api.mvc.models.User;
import com.rental_ratings.api.api.mvc.services.CommentService;
import com.rental_ratings.api.api.mvc.services.PropertyService;
import com.rental_ratings.api.api.mvc.services.RatingService;
import com.rental_ratings.api.api.mvc.services.UserService;

@Controller
public class RatingController {

	@Autowired	private RatingService ratingService;

	@Autowired
	private UserService userService;
	
	@Autowired	private PropertyService propertyService;
	
	@Autowired	private CommentService commentService;

	// ****** RATE PROPERTY ******//
	
	@GetMapping("/property/{id}/ratings")
	public String newRating(@PathVariable("id") Long id, @ModelAttribute("newRating") Rating rating, Model viewModel,
			HttpSession session) {

		if (session.getAttribute("loggedInUser") != null) {

			User user = (User) session.getAttribute("loggedInUser");
			User ratingCreator = userService.getById(user.getId());
			viewModel.addAttribute("ratingCreator", ratingCreator);

			Property property = propertyService.getById(id);
			viewModel.addAttribute("property", property);
			
		    Comment aComment =
			viewModel.addAttribute("comment", aComment);

			return "ratings.jsp";
		}

		return "redirect:/dashboard";
	}

	@PostMapping("/property/{ratingAdded}/ratings")
	public String addRating(@PathVariable("ratingAdded") Long id, @Valid @ModelAttribute("newRating") Rating rating,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			Property check = propertyService.getById(id);
			model.addAttribute("ratings", rating);
			model.addAttribute("propety", check);
//			model.addAttribute("comment", new Comment());
			return "ratings.jsp";
		} else {
			ratingService.create(rating);
			return "redirect:/property/{ratingAdded}";
		}
	}

}
