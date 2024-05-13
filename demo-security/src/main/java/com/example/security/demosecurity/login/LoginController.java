package com.example.security.demosecurity.login;

import java.security.Principal;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}  

	
	
	@GetMapping("/welcome")
	public String welcome(Principal principal, ModelMap model, HttpSession session) {
		   
		model.put("name", principal.getName());
		session.setAttribute("name", principal.getName());
		session.setAttribute("todoList", new ArrayList<>());
		return "welcome";
	}
	@GetMapping("/logout")
	public String logout() {
		return "login";
	} 
	
}
