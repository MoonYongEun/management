package user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	@RequestMapping(value="/user/mainForm.do",method=RequestMethod.POST)
	public String mainForm() {
		return "/user/mainForm";
	}

}
