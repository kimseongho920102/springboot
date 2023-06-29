package com.guro.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.guro.service.SpringTestService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	SpringTestService ss;
	@GetMapping("/")
	public String home(Locale locale, Model model) {
		model.addAttribute("count", ss.springTestCountService());
		return "/main";
		}
	
}
