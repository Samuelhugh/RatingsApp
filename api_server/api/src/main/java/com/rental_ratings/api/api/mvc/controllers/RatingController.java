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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rental_ratings.api.api.mvc.models.Property;
import com.rental_ratings.api.api.mvc.models.Rating;
import com.rental_ratings.api.api.mvc.models.RatingComment;
import com.rental_ratings.api.api.mvc.models.User;
import com.rental_ratings.api.api.mvc.services.CommentService;
import com.rental_ratings.api.api.mvc.services.PropertyService;
import com.rental_ratings.api.api.mvc.services.RatingService;
import com.rental_ratings.api.api.mvc.services.UserService;

@Controller
public class RatingController {

	@Autowired
	private RatingService ratingService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	private CommentService commentService;

	// ****** RATE PROPERTY ******//
	
	@GetMapping("/property/{propertyId}/ratings")
	public String newRatingComment(
		@PathVariable("propertyId") Long propertyId,
		Model viewModel,
		HttpSession session) {

		if (session.getAttribute("loggedInUser") != null) {

			User user = (User) session.getAttribute("loggedInUser");
			User ratingCreator = userService.getById(user.getId());
			Property property = propertyService.getById(propertyId);

			if (!viewModel.containsAttribute("newRatingComment")) {
				RatingComment ratingComment = new RatingComment();
				Rating rating = ratingService.getByUserAndProperty(ratingCreator, property);
				if (rating != null) {
					ratingComment.setRating(rating);
				}
				viewModel.addAttribute("newRatingComment", ratingComment);
			}
			viewModel.addAttribute("ratingsCreator", ratingCreator);
			viewModel.addAttribute("property", property);
			return "ratings.jsp";
		}

		return "redirect:/dashboard";
	}

	@PostMapping("/property/{propertyId}/ratings")
	public String addRatingComment(
		@PathVariable("propertyId") Long propertyId,
		@Valid @ModelAttribute("newRatingComment") RatingComment ratingComment,
		BindingResult result,
		RedirectAttributes redirAttr,
		Model model
	) {
	
		
		if (result.hasErrors()) {
			redirAttr.addFlashAttribute("org.springframework.validation.BindingResult.newRatingComment", result);
			redirAttr.addFlashAttribute("newRatingComment", ratingComment);

			return "redirect:/property/{propertyId}/ratings/test";
		}
		
		System.out.println(ratingComment);
		ratingService.create(ratingComment.getRating());
		commentService.create(ratingComment.getComment());

		return "redirect:/property/{propertyId}/ratings";
	}

}
