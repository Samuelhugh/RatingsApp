package com.rental_ratings.api.api.mvc.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.rental_ratings.api.api.mvc.models.Property;
import com.rental_ratings.api.api.mvc.models.User;
import com.rental_ratings.api.api.mvc.services.PropertyService;
import com.rental_ratings.api.api.mvc.services.UserService;


@Controller
public class PropertyController {

	@Autowired
	private PropertyService propertyService;

	@Autowired
	private UserService userService;

	/***** CREATE PROPERTY ******/

	@GetMapping("/property/new")
	public String newProperty(@ModelAttribute("newProperty") Property property, HttpSession session) {

		if (session.getAttribute("loggedInUser") != null) {

			return "create.jsp";
		}

		return "redirect:/";
	}

	@PostMapping("/property/create")
	public String createProperty(@Valid @ModelAttribute("newProperty") Property property, BindingResult result,
			HttpSession session) {

		if (result.hasErrors()) {
			return "create.jsp";
		}

		propertyService.create(property);
		return "redirect:/dashboard";
	}

	/****** DISPLAY PROPERTY DETAIL ******/

	@GetMapping("/property/{id}")
	public String showProperty(@PathVariable("id") Long id, Model viewModel, HttpSession session) {

		if (session.getAttribute("loggedInUser") != null) {

			User user = (User) session.getAttribute("loggedInUser");
			User userLoggedIn = userService.getById(user.getId());

			Property property = propertyService.getById(id);

			viewModel.addAttribute("property", property);
			viewModel.addAttribute("userLoggedIn", userLoggedIn);

			return "detail.jsp";
		}

		return "redirect:/dashboard";
	}

	/****** EDIT PROPERTY ******/

	@GetMapping("/property/{id}/edit")
	public String editProperty(@PathVariable("id") Long id, Model viewModel, HttpSession session) {

		if (session.getAttribute("loggedInUser") != null) {

			Property property = propertyService.getById(id);
			viewModel.addAttribute("editProperty", property);

			return "edit.jsp";
		}

		return "redirect:/dashboard";
	}

	/****** UPDATE PROPERTY ******/

	@PutMapping("/property/{id}/update")
	public String updateProperty(@PathVariable("id") Long id, @Valid @ModelAttribute("editProperty") Property property,
			BindingResult result, Model viewModel) {

		if (result.hasErrors()) {

			return "edit.jsp";
		}

		propertyService.update(property);
		return "redirect:/dashboard";
	}

	/****** DELETE PROPERTY ******/

	@DeleteMapping("/property/{id}/delete")
	public String deleteProperty(@PathVariable("id") Long id) {

		propertyService.delete(id);
		return "redirect:/dashboard";
	}

}
