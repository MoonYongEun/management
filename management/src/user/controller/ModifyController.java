package user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ModifyController {
	@RequestMapping("/user/modifyForm.do")
	public String modifyForm() {
		return "/user/modifyForm";
	}
	

}
