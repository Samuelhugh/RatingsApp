package com.rental_ratings.api.api.mvc.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.rental_ratings.api.api.mvc.models.LoginUser;
import com.rental_ratings.api.api.mvc.models.User;
import com.rental_ratings.api.api.mvc.services.PropertyService;
import com.rental_ratings.api.api.mvc.services.UserService;



@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private PropertyService propertyService;

	@GetMapping("/")
	public String index(@ModelAttribute("newUser") User user, @ModelAttribute("newLogin") LoginUser loginUser) {

		return "index.jsp";
	}

	/****** REGISTER USER ******/

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User user, BindingResult result, HttpSession session,
			@ModelAttribute("newLogin") LoginUser loginUser) {

		// validate user
		userService.validate(user, result);
		if (result.hasErrors()) {
			return "index.jsp";
		}

		// register user
		userService.register(user);

		// put user in session
		session.setAttribute("loggedInUser", user);
		return "redirect:/dashboard";

	}

	/****** LOGIN USER ******/

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser loginUser, BindingResult result,
			HttpSession session, @ModelAttribute("newUser") User user) {

		// authenticate user
		userService.authenticate(loginUser, result);
		if (result.hasErrors()) {
			return "index.jsp";
		}

		User loggedInUser = userService.getByEmail(loginUser.getEmail());

		// put user in session
		session.setAttribute("loggedInUser", loggedInUser);
		return "redirect:/dashboard";
	}

	/****** LOGOUT ******/

	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/";
	}

	/****** DASHBOARD ******/

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model viewModel) {

		if (session.getAttribute("loggedInUser") != null) {
			viewModel.addAttribute("property", propertyService.findAll());

			return "dashboard.jsp";
		}

		return "redirect:/";
	}

	@GetMapping("/properties")
	public String allProperties(Model viewModel, HttpSession session) {

		if (session.getAttribute("loggedInUser") != null) {
			User user = (User) session.getAttribute("loggedInUser");
			User userLoggedIn = userService.getById(user.getId());

			viewModel.addAttribute("userLoggedIn", userLoggedIn);
			viewModel.addAttribute("property", propertyService.findAll());

			return "dashboard.jsp";

		}

		return "redirect:/";
	}
}

