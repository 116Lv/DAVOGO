package portal.user.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import portal.common.Constants;

@Controller
public class MyPageController {

	@RequestMapping("/mypage.do")
	public String myPageMain(@RequestParam Map params, Model model) {
		
		return "/mypage/myPageMain";
	}
	
	/**
	 * 내 정보 수정
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/userInfo.do")
	public String userInfo(@RequestParam Map params, Model model) {
		
		return "/mypage/userInfo";
	}
	
	/*
	 * @RequestMapping("/mypage/saveUserInfo.do") public String
	 * saveUserInfo(@RequestParam Map params, Model model) {
	 * 
	 * try { params.put("items", items); commService.saveVote(params);
	 * 
	 * model.addAttribute("resultCode", "success"); } catch (Exception e) {
	 * model.addAttribute("resultCode", "fail"); model.addAttribute("resultMessage",
	 * e.getMessage()); } }
	 */
	
	/**
	 * 내 미디어 Comment
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/myComment.do")
	public String myComment(@RequestParam Map params, Model model) {
		
		return "/mypage/myComment";
	}
	
	/**
	 * 내가 만든 투표&월드컵
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/madeComm.do")
	public String madeComm(@RequestParam Map params, Model model) {
		
		return "/mypage/madeComm";
	}
	
	/**
	 * 참여한 투표&월드컵
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/joinComm.do")
	public String joinComm(@RequestParam Map params, Model model) {
		
		return "/mypage/joinComm";
	}
}
