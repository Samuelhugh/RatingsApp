package com.rental_ratings.api.api.mvc.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {

	@NotEmpty(message = "Please fill E-mail address")
	@Email(message = "Please enter a valid E-mail address.")
	private String email;

	@Size(min = 8, max = 255, message = "Must be atleast 8 characters!")
	private String password;

	public LoginUser() {
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
