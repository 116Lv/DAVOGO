package portal.user.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import portal.common.Constants;
import portal.common.cmm.EgovUserDetailsHelper;
import portal.user.service.MyPageService;
import portal.user.vo.UserVO;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
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
	
	@RequestMapping("/mypage/saveUserInfo.do")
	public String saveUserInfo(@RequestParam Map params, Model model) {
		
		try {
			UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
			params.put("email", loginUser.getEmail());
			
			myPageService.saveUserInfo(params);
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 내 미디어 Comment
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/myComment.do")
	public String myComment(@RequestParam Map params, Model model) {
		
		UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
		params.put("emailId", loginUser.getEmailId());
		
		List<Map> list = myPageService.getUserMediaComment(params);
		
		model.addAttribute("list", list);
		
		return "/mypage/myComment";
	}
	
	@RequestMapping("/mypage/openModal.do")
	public String openModal(@RequestParam Map params, Model model) {

		Map info = myPageService.getMediaCommentInfo(params);
		
		UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
		info.put("emailId", loginUser.getEmailId());
		
		model.addAttribute("info", info);
		
		return "/modal/mypage/myCommentEdit";
	}
	
	@RequestMapping("/mypage/updateMediaComment.do")
	public String updateMediaComment(@RequestParam Map params, Model model) {
		
		try {
			myPageService.updateMediaComment(params);
			
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		
		return Constants.VIEW_NAME_JSON;
	}
	
	@RequestMapping("/mypage/deleteMediaComment.do")
	public String deleteMediaComment(@RequestParam Map params, Model model) {
		
		myPageService.deleteMediaComment(params);
		
		return "redirect:/mypage/myComment.do";
	}
	
	/**
	 * 내가 만든 투표&월드컵
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/madeComm.do")
	public String madeComm(@RequestParam Map params, Model model) {
		
		UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
		params.put("emailId", loginUser.getEmailId());
		
		List<Map> list = myPageService.getUserCommunity(params);
		
		model.addAttribute("list", list);
		
		return "/mypage/madeComm";
	}
	
	@RequestMapping("/mypage/deleteComm.do")
	public String deleteComm(@RequestParam Map params, Model model) {
		
		myPageService.deleteComm(params);
		
		return "redirect:/mypage/madeComm.do";
	}
	
	/**
	 * 참여한 투표&월드컵
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/joinComm.do")
	public String joinComm(@RequestParam Map params, Model model) {
		
		UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
		params.put("emailId", loginUser.getEmailId());
		
		List<Map> list = myPageService.getUserComment(params);
		
		model.addAttribute("list", list);
		
		return "/mypage/joinComm";
	}
	
	@RequestMapping("/mypage/deleteComment.do")
	public String deleteComment(@RequestParam Map params, Model model) {
		
		myPageService.deleteComment(params);
		
		return "redirect:/mypage/joinComm.do";
	}
}
