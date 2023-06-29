package com.guro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.guro.service.SpringTestService;

@RestController
public class SpringTestController {

	@Autowired
	SpringTestService ss;

	@RequestMapping(value = "/test" , method = RequestMethod.GET)
	public String springTestController(Model model) {
		model.addAttribute("count", ss.springTestCountService());
		return "main";

	}

}