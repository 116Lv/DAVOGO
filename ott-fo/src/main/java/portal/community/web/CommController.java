package portal.community.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import portal.common.Constants;
import portal.community.service.CommService;

@Controller
@Slf4j
public class CommController {

	@Autowired
	private CommService commService;
	
	@RequestMapping("/comm.do")
	public String mainPage(@RequestParam Map params, Model model) {
		
		List<Map> communityList = commService.getCommunityList(params);
		
		model.addAttribute("list", communityList);
		model.addAttribute("params", params);
		
		return "/community/commMain";
	}
	
	@RequestMapping("/comm/worldInfo.do")
	public String worldPage() {
		
		return "/community/world/commWorldInfo";
	}
	
	@RequestMapping("/comm/worldImage.do")
	public String worldImagePage() {
		
		return "/community/world/commWorldImage";
	}
	
	@RequestMapping("/comm/vote.do")
	public String votePage() {
		log.info("모달창 진입");
		return "/modal/community/commVote";
	}
	
	@RequestMapping("/comm/save.do")
	public String saveVote(@RequestParam Map params, @RequestParam("items") String[] items, Model model) {
		try {
			params.put("items", items);
			commService.saveVote(params);
			
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		return Constants.VIEW_NAME_JSON;
	}
	
	@RequestMapping("/comm/saveVote.do")
	public String saveVoteClick(@RequestParam Map params, Model model) {
		try {
			commService.saveVoteClick(params);
			
			//투표결과 조회
			model.addAttribute("items", commService.getVoteItems(params));
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		return Constants.VIEW_NAME_JSON;
	}
}
