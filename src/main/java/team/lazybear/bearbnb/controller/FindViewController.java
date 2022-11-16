package team.lazybear.bearbnb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.lazybear.bearbnb.config.GLobalConfig;

@Controller
@SessionAttributes(names = { "googleKey" })
public class FindViewController {

	@GetMapping( "/" )
	public String index(Model model) {
	    model.addAttribute("googleKey", GLobalConfig.Google.GoogleMapKey);
		return "pages/index/index";
	}

}
