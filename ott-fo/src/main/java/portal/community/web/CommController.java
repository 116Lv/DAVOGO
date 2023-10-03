package portal.community.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import portal.common.Constants;
import portal.common.cmm.EgovUserDetailsHelper;
import portal.community.service.CommService;
import portal.user.vo.UserVO;

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
	
	/**
	 * 투표 정보 저장
	 * @param params
	 * @param items
	 * @param model
	 * @return
	 */
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
	
	/**
	 * 로그인한 사용자가 투표를 클릭/언클릭 할 경우 
	 * @param params
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/saveVote.do")
	public String saveVoteAction(@RequestParam Map params, Model model) {
		try {
			UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
			params.put("loginEmailId", loginUser.getEmailId());
			
			//투표 클릭/언클릭 반영
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
