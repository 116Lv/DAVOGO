package portal.main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import portal.common.cmm.EgovUserDetailsHelper;
import portal.main.service.MainService;
import portal.media.service.TvService;
import portal.user.vo.UserVO;

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
	public String mainPage(@RequestParam Map params, Model model) {
		
		logger.debug("메인화면으로 이동");
		
		if (EgovUserDetailsHelper.isAuthenticated()) {
			UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
			params.put("loginEmailId", loginUser.getEmailId());
		}
		
		List<Map> communityList = mainService.getCommunityList(params);
		
		model.addAttribute("list", communityList);
		model.addAttribute("params", params);
		
		//표시할 카테고리 조회
		List<Map> categoryList = mainService.getCategoryList();
		for (int i=0; i < categoryList.size(); i++) {
			
			//카테고리별 컨텐츠 조회
			List<Map> contentsList = mainService.getContentsList(categoryList.get(i));
			categoryList.get(i).put("imageList", contentsList);
		}
		
		model.addAttribute("categoryList", categoryList);
		
		//영화만 조회
		List<Map> movieList = mainService.getMainMovieList();
		
		model.addAttribute("movieList", movieList);
		
		return "/main/mainPage";
	}
	
	/**
	 * 검색화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/search.do")
	public String searchPage(@RequestParam Map<String, String> params, Model model) {
		
		String searchInput = params.get("searchInput");
		
		//검색어가 있는 경우 조회
		if (StringUtils.isNotBlank(searchInput)) {
			model.addAttribute("searchList", mainService.getContentSearchList(params));
		}
		
		model.addAttribute("params", params);
		
		return "/main/searchList";
	}
}
