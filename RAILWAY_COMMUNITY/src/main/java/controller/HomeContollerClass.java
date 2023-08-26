package controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeContollerClass {
	@RequestMapping("/")
	public String home() {
		System.out.println("**********");
		return "/jsp/home.jsp";
	}
}
