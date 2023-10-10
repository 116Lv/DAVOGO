package portal.media.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import portal.common.cmm.EgovUserDetailsHelper;
import portal.media.service.MovieService;
import portal.user.vo.UserVO;

@Controller
@Slf4j
public class MovieController {

	@Autowired
	private MovieService movieService;
	
	/**
	 * 영화 메인 화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/movie.do")
	public String moviePage(@RequestParam Map params, Model model) {
		
		//영화만 조회
		params.put("mediaDiv", "1");
		List<Map> movieInfoList = movieService.getMovieInfoList(params);
		
		model.addAttribute("list", movieInfoList);
		model.addAttribute("params", params);
		
		return "/movie/movieMain";
	}
	
	/**
	 * 영화 상세 화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/movie/contents.do")
	public String contentPage(@RequestParam Map params, Model model) {
		
		if (EgovUserDetailsHelper.isAuthenticated()) {
			UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
			params.put("emailId", loginUser.getEmailId());
		}
		
		Map content = movieService.getContent(params);
		
		Map image = movieService.getImage(params);
		
		List<Map> commentList = movieService.getCommentList(params);
		
		model.addAttribute("content", content);
		model.addAttribute("image", image);
		model.addAttribute("commentList", commentList);
		
		return "/movie/movieContent";
	}
	
}
