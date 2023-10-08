package portal.media.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import portal.media.service.MovieService;
import portal.media.service.TvService;

@Controller
public class MovieController {

	@Autowired
	private TvService tvService;
	
	@RequestMapping("/movie.do")
	public String moviePage(@RequestParam Map params, Model model) {
		
		//영화만 조회
		params.put("mediaDiv", "1");
		List<Map> categoryInfoList = tvService.getCategoryInfoList(params);
		
		model.addAttribute("list", categoryInfoList);
		model.addAttribute("params", params);
		
		return "/movie/movieMain";
	}
}
