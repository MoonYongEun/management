package user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
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
	
	@RequestMapping("/user/cookieDelete.do")
	public void cookieDelete (HttpServletResponse response) {
		Cookie cookie = new Cookie("read_count",null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		
	}
	
	
	@RequestMapping(value="/user/write.do",method=RequestMethod.POST)
	public String write(@ModelAttribute UserDTO userDTO
						, HttpServletRequest request
						, HttpServletResponse response) {
	    
		Cookie cookies[] =  request.getCookies();
	    Map map = new HashMap();
	    
	    if(request.getCookies() != null){
		    for (int i = 0; i < cookies.length; i++) {
			    Cookie obj = cookies[i];
			    
			    map.put(obj.getName(),obj.getValue());
		    }
	    }

	    // 저장된 쿠키중에 read_count 만 불러오기
	    String readCount = (String) map.get("read_count");
	     // 저장될 새로운 쿠키값 생성
	    String newReadCount = userDTO.getSeq()+"";
	    
	    
	    // 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
	    if ( StringUtils.indexOfIgnoreCase(readCount, newReadCount) == -1 ) {
	          // 없을 경우 쿠키 생성
	          Cookie cookie = new Cookie("read_count", readCount + newReadCount);
	         
	          response.addCookie(cookie);
	          userDAO.write(userDTO);// 업데이트 실행
	    }
		
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
