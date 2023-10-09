package portal.media.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import portal.common.Constants;
import portal.common.cmm.EgovUserDetailsHelper;
import portal.media.service.MovieService;
import portal.user.vo.UserVO;

@Controller
@Slf4j
public class MovieController {

	@Autowired
	private MovieService movieService;
	
	@RequestMapping("/movie.do")
	public String moviePage(@RequestParam Map params, Model model) {
		
		//영화만 조회
		params.put("mediaDiv", "1");
		List<Map> movieInfoList = movieService.getMovieInfoList(params);
		
		model.addAttribute("list", movieInfoList);
		model.addAttribute("params", params);
		
		return "/movie/movieMain";
	}
	
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
	
	@RequestMapping("/movie/comment.do")
	public String commentPage(@RequestParam Map params, Model model) {
		log.info("모달창 진입");
		
		if (EgovUserDetailsHelper.isAuthenticated()) {
			UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
			params.put("writer", loginUser.getEmailId());
		}
		
		model.addAttribute("params", params);
		
		return "/modal/movie/movieComment";
	}
	
	
	@RequestMapping("/movie/saveMediaComment.do")
	public String saveComment(@RequestParam Map params, Model model) {
		try {
			movieService.saveMediaComment(params);
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		return Constants.VIEW_NAME_JSON;
	}
}
