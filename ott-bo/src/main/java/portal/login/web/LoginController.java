package portal.login.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import lombok.extern.slf4j.Slf4j;
import portal.common.cmm.EgovUserDetailsHelper;
import portal.common.util.MessageUtil;
import portal.login.service.LoginService;
import portal.staff.service.StaffService;
import portal.staff.vo.StaffVO;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "/login/loginForm";
	}
	
	@RequestMapping("/login.do")
	public String login(@RequestParam Map<String, String> params, HttpServletRequest request, Model model) throws Exception {
		
		int count = loginService.checkStaffData(params);
		
		if (count == 1) {
			
			request.getSession().setAttribute("StaffVO", params);
			model.addAttribute("user", params);
			return "redirect:/main.do";
		} else {
			model.addAttribute("error", "true");
			return "/login/loginForm";
		}
	}
	
	/*
	 * @RequestMapping("/logout.do") public String logout() {
	 * RequestContextHolder.getRequestAttributes().removeAttribute("StaffVO",
	 * RequestAttributes.SCOPE_SESSION); return "forward:/loginForm.do"; }
	 */
	
}
