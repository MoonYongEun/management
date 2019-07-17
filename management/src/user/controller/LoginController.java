package user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.dao.UserDAO;

@Controller
public class LoginController {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value="/user/loginForm.do")
	public String loginForm() {
		return "/user/loginForm";
	}
	
	@RequestMapping(value="/user/loginCheck.do",method=RequestMethod.POST)
	@ResponseBody
	public String loginCheck(HttpServletRequest request  , @RequestParam Map<String,String>map) {
		
		String loginId = userDAO.loginCheck(map);
		
		if(loginId == null) {
			return "loginFail";
			
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("memId",loginId);
			
			return "loginOk";
		}
		
	}

	@RequestMapping("/user/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/user/loginForm";
	}

}
