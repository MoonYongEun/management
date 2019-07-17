package user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.dao.UserDAO;

@Controller
public class WriteController {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping("/user/writeForm.do")
	public String writeForm() {
		return "/user/writeForm";
	}
	
	@RequestMapping(value="/user/write.do",method=RequestMethod.POST)
	public String write(@ModelAttribute UserDTO userDTO) {
		userDAO.write(userDTO);
		
		return "/user/loginForm";
	}
	
	@RequestMapping(value="/user/idCheck.do",method=RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam String id) {
		if(id.equals(""))
			return "empty";
		
		
		String idcheck = userDAO.checkId(id);
		
		if(idcheck == null) {
			return "idOk";
			
		}else {
			return "idFail";
		}
		
	}

}
