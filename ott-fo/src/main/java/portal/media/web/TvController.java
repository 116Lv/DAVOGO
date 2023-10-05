package portal.media.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/tv/contents.do")
	public String contentPage(@RequestParam Map params, Model model) {
		
		Map content = tvService.getContent(params);
		
		Map image = tvService.getImage(params);
		
		model.addAttribute("content", content);
		model.addAttribute("image", image);
		
		return "/tv/tvContent";
	}
	
	@RequestMapping("/tv/category.do")
	public String categoryPage(@RequestParam("genre") String params, Model model) {
		
		List<Map> categoryInfoList = tvService.getCategoryInfoList(params);
		
		model.addAttribute("list", categoryInfoList);
		model.addAttribute("genre", params);
		
		return "/tv/tvCategory";
	}
	
}
