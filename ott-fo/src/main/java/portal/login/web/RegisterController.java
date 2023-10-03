package portal.login.web;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import portal.login.service.RegisterService;

@Slf4j
@Controller
public class RegisterController {
	
	@Autowired
	private RegisterService registerService;

	@RequestMapping("/signUp.do")
	public String registerForm() {
		return "/login/registerForm";
	}
	
	@RequestMapping("/register.do")
	public String registerInfo(@RequestParam Map<String, String> params, Model model) throws Exception {
		
		try {
			int count = registerService.checkUserData(params);
			if(count == 0) {
				registerService.insertUserInfo(params);
			} else {
				model.addAttribute("error", "true");
				return "/login/registerForm";
			}
		} catch (Exception e) {
			log.error("회원가입 오류", e);
			model.addAttribute("error", "true");
			return "/login/registerForm";
		}
		
		model.addAttribute("user", params);
		return "/login/registerComplete";
	}
}
