package user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import user.bean.UserDTO;
import user.dao.UserDAO;

@Controller
public class SearchController {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping("/user/searchForm.do")
	public String searchForm() {
		return "/user/searchForm";
	}

	@RequestMapping(value="/user/search.do" ,method=RequestMethod.POST)
	public ModelAndView search(@RequestParam Map<String,String>map) {
		List<UserDTO>list = userDAO.search(map);
		ModelAndView  mav = new ModelAndView("jsonView");
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/user/delete.do" ,method=RequestMethod.POST)
	public String delete(@RequestParam String seq) {
		userDAO.delete(seq);
		return "";
	}

}
