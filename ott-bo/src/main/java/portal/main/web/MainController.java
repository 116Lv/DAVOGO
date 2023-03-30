package portal.main.web;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String mainPage(@RequestParam Map<String, Object> params, Model model) {
		
		/*
		 * logger.debug("메인화면으로 이동");
		 * 
		 * List<Map> list = mainService.findImageList(); model.addAttribute("imageList", list);
		 * List<Map> list2 = mainService.findImageList2();
		 * model.addAttribute("imageList2", list2);
		 */
		
		List<Map<String, Object>> list = mainService.getBoardInfo(params);
		List<Map<String, Object>> lists = mainService.getRecentMediaInfo(params);
		int userCnt = mainService.getUserCount(params);
		int movieCnt = mainService.getMovieCount(params);
		int tvCnt = mainService.getTvCount(params);
		
		model.addAttribute("list", list);
		model.addAttribute("lists", lists);
		model.addAttribute("Unum", userCnt);
		model.addAttribute("Mnum", movieCnt);
		model.addAttribute("Tnum", tvCnt);
		
		return "/main/mainPage";
	}
	
}
