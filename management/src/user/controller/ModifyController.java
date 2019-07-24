package user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import user.bean.UserDTO;
import user.dao.UserDAO;

@Controller
public class ModifyController {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping("/user/modifyForm.do")
	public String modifyForm() {
		return "/user/modifyForm";
	}
	
	@RequestMapping(value="/user/userModify.do",method=RequestMethod.POST)
	public ModelAndView userModify(@RequestParam String login_id) {		
		UserDTO dto = userDAO.userModify(login_id);
		
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	@RequestMapping(value="/user/userUpdate.do",method=RequestMethod.POST)
	public String userUpdate(@RequestParam Map<String,String>map) {
		userDAO.userUpdate(map);
		
		return "/user/mainForm";
	}

}
