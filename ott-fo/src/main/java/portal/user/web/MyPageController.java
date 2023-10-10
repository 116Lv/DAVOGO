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
	
	/**
	 * 마이페이지 메인 화면
	 * @param params
	 * @param model
	 * @return
	 */
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
	
	/**
	 * 비밀번호 저장
	 * @param params
	 * @param model
	 * @return
	 */
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
	 * 내 미디어 Comment 화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/myComment.do")
	public String myComment(@RequestParam Map params, Model model) {
		
		UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
		params.put("emailId", loginUser.getEmailId());
		
		//내가 쓴 미디어 댓글 목록 조회
		List<Map> list = myPageService.getUserMediaComment(params);
		model.addAttribute("list", list);
		
		return "/mypage/myComment";
	}
	
	/**
	 * 내 미디어 댓글 수정 화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/openModal.do")
	public String openModal(@RequestParam Map params, Model model) {

		Map info = myPageService.getMediaCommentInfo(params);
		model.addAttribute("info", info);
		
		return "/modal/mypage/myCommentEdit";
	}
	
	/**
	 * 내 미디어 댓글 수정 저장
	 * @param params
	 * @param model
	 * @return
	 */
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
	
	/**
	 * 내 미디어 댓글 삭제
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/deleteMediaComment.do")
	public String deleteMediaComment(@RequestParam Map params, Model model) {
		
		try {
			myPageService.deleteMediaComment(params);

			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 내가 만든 투표&월드컵 목록 조회 화면
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
	
	/**
	 * 내가 만든 커뮤니티 게시글 삭제
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/deleteComm.do")
	public String deleteComm(@RequestParam Map params, Model model) {
		
		try {
			myPageService.deleteComm(params);
			
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 내가 작성한 커뮤니티 댓글 목록 조회 화면
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
	
	/**
	 * 내가 작성한 커뮤니티 댓글 삭제
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/deleteComment.do")
	public String deleteComment(@RequestParam Map params, Model model) {
		
		try {
			myPageService.deleteComment(params);
			
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		
		return Constants.VIEW_NAME_JSON;
	}
}
