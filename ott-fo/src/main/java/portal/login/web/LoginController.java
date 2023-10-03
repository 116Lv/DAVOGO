package portal.login.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import lombok.extern.slf4j.Slf4j;
import portal.login.service.LoginService;
import portal.user.vo.UserVO;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/signIn.do")
	public String loginForm() {
		return "/login/loginForm";
	}
	
	@RequestMapping("/login.do")
	public String login(UserVO userVO, HttpServletRequest request, Model model) throws Exception {
		
		int count = loginService.checkUserData(userVO);
		
		if (count == 1) { 
			request.getSession().setAttribute("loginUser", userVO);
			model.addAttribute("user", userVO); 
			return "redirect:/main.do";
		} else {
			model.addAttribute("error", "true"); 
			return "/login/loginForm"; 
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout() {
		RequestContextHolder.getRequestAttributes().removeAttribute("loginUser", RequestAttributes.SCOPE_SESSION);
		return "forward:signIn.do";
	}
	
}
