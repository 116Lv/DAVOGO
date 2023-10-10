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

import lombok.extern.slf4j.Slf4j;
import portal.common.Constants;
import portal.kobis.service.KobisAPIService;
import portal.main.sevice.MainService;
import portal.media.service.MediaService;

/**
 * 메인화면
 * @author 116Lv
 *
 */
@Slf4j
@Controller
public class MainController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MainService mainService;

	@Autowired
	private KobisAPIService kobisApiService;
	
	@Autowired
	private MediaService mediaService;
	
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
		List<Map<String, Object>> commentList = mainService.getCommentList(params);
		List<Map<String, Object>> lists = mainService.getRecentMediaInfo(params);
		int userCnt = mainService.getUserCount(params);
		int movieCnt = mainService.getMovieCount(params);
		int tvCnt = mainService.getTvCount(params);
		
		model.addAttribute("list", list);
		model.addAttribute("commentList", commentList);
		model.addAttribute("lists", lists);
		model.addAttribute("Unum", userCnt);
		model.addAttribute("Mnum", movieCnt);
		model.addAttribute("Tnum", tvCnt);
		
		return "/main/mainPage";
	}
	
	@RequestMapping("/main/pullMovieData.do")
	public String pullMovieData(Model model) {
		
		try {
			kobisApiService.saveDailyMovieList();
			
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		
		return Constants.VIEW_NAME_JSON;
	}
	
	@RequestMapping("/main/pullTvData.do")
	public String pullTvData(Model model) {
		
		try {
			mediaService.pullTvData();
			
			model.addAttribute("resultMsg", "success");
		} catch (Exception e) {
			log.error("tv pull error", e);
			model.addAttribute("resultMsg", "fail");
		}
		
		return Constants.VIEW_NAME_JSON;
	}
	
}
