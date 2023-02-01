package com.univ;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/univ")
@Controller
public class MainController {
	@GetMapping()
	public String showMain(Model model) {
		model.addAttribute("view", "main/main");
		return "template/layout";
	}

	@GetMapping("/citations")
	public String showCitations(Model model) {
		model.addAttribute("view", "main/citation");
		return "template/layout";
	}
}
