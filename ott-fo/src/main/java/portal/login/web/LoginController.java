package portal.login.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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
	public String loginForm(HttpServletRequest request, Model model) {
		
		String uri = request.getHeader("Referer");
	    if (uri != null && !uri.contains("/signIn")) {
	        request.getSession().setAttribute("prevPage", uri);
	    }
	    
		return "/login/loginForm";
	}
	
	@RequestMapping("/login.do")
	public String login(UserVO userVO, HttpServletRequest request, Model model) throws Exception {
		
		int count = loginService.checkUserData(userVO);
		
		if (count == 1) { 
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", userVO);
			model.addAttribute("user", userVO);
			
			String prevPage = (String) session.getAttribute("prevPage");
			
			if (StringUtils.isNotBlank(prevPage)) {
				session.removeAttribute("prevPage");
				return "redirect:" + prevPage;
			}
			
			return "redirect:/main.do";
		} else {
			model.addAttribute("error", "true"); 
			return "/login/loginForm"; 
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout() {
		RequestContextHolder.getRequestAttributes().removeAttribute("loginUser", RequestAttributes.SCOPE_SESSION);
		return "redirect:/";
	}
	
}
