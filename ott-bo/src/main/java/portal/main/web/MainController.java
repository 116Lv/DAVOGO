package portal.main.web;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import portal.main.sevice.MainService;

/**
 * 메인화면
 * @author 116Lv
 *
 */
@Controller
public class MainController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MainService mainService;

	@RequestMapping("/main.do")
	public String mainPage(ModelMap model) {
		
		/*
		 * logger.debug("메인화면으로 이동");
		 * 
		 * List<Map> list = mainService.findImageList(); model.addAttribute("imageList",
		 * list); List<Map> list2 = mainService.findImageList2();
		 * model.addAttribute("imageList2", list2);
		 */
		
		return "/main/mainPage";
	}
	
}
