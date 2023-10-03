package portal.media.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import portal.media.service.TvService;

@Controller
@Slf4j
public class TvController {

	@Autowired
	private TvService tvService;
	
	@RequestMapping("/tv.do")
	public String mainPage(Model model) {
		
		log.debug("메인화면으로 이동");
		
		List<Map> categoryList = tvService.getCategoryList();
		for (int i=0; i < categoryList.size(); i++) {
			
			List<Map> contentsList = tvService.getContentsList(categoryList.get(i));
			categoryList.get(i).put("imageList", contentsList);
		}
		
		model.addAttribute("categoryList", categoryList);
		
		return "/tv/tvMain";
	}
	
}
