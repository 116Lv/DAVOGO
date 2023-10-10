package portal.community.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lombok.extern.slf4j.Slf4j;
import portal.common.Constants;
import portal.common.cmm.EgovUserDetailsHelper;
import portal.common.util.RandomUtil;
import portal.community.service.CommService;
import portal.user.vo.UserVO;

@Controller
@Slf4j
public class CommController {

	@Autowired
	private CommService commService;
	
	/**
	 * 커뮤니티 메인 화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm.do")
	public String mainPage(@RequestParam Map params, Model model) {
		
		if (EgovUserDetailsHelper.isAuthenticated()) {
			UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
			params.put("loginEmailId", loginUser.getEmailId());
		}
		
		List<Map> communityList = commService.getCommunityList(params);
		
		model.addAttribute("list", communityList);
		model.addAttribute("params", params);
		
		return "/community/commMain";
	}
	
	/**
	 * 월드컵 작성 화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/worldInfo.do")
	public String worldPage(@RequestParam Map params, Model model) {
		
		UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
		params.put("writer", loginUser.getEmailId());
		
		commService.insertWorld(params);
		
		model.addAttribute("params", params);
		
		return "/community/world/commWorldInfo";
	}

	/**
	 * 월드컵 작성화면에서 '기본정보 수정' tab 화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/worldBasic.do")
	public String worldBasicPage(@RequestParam Map params, Model model) {
		
		UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
		params.put("writer", loginUser.getEmailId());
		
		Map worldInfo = commService.getWorldInfo(params);
		
		model.addAttribute("item", worldInfo);
		
		return "/simple/community/world/worldBasicWrite";
	}
	
	/**
	 * 월드컵 작성화면에서 '이미지 이름 수정/삭제' tab 화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/worldImage.do")
	public String worldImagePage(@RequestParam Map params, Model model) {
		UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
		params.put("writer", loginUser.getEmailId());
		
		List<Map> imageList = commService.getWorldImages(params);
		
		model.addAttribute("imageList", imageList);
		
		return "/simple/community/world/worldImageWrite";
	}
	
	/**
	 * 월드컵 기본 작성화면에서 기본정보 저장
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/saveInfo.do")
	public String insertInfo(@RequestParam Map params, Model model) {
		
		commService.insertWorldInfo(params);
		
		return "redirect:/comm.do";
	}
	
	/**
	 * 월드컵 기본 작성화면에서 파일 업로드시 파일 저장
	 * @param params
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/saveImage.do")
	public String insertImage(@RequestParam Map<String, String> params, MultipartHttpServletRequest request, Model model) {
		
		MultipartFile file = request.getFile("file");
		
		try {
			commService.insertWorldImage(params, file);
		} catch (IOException e) {
			model.addAttribute("message", "파일 저장 중 오류가 발생하였습니다. 다시 시도해주시기 바랍니다.");
			model.addAttribute("item", params);
			
		} catch (Exception e) {
			model.addAttribute("message", "오류가 발생하였습니다. 다시 시도해주시기 바랍니다.");
			model.addAttribute("item", params);
		}
		
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 투표 작성 모달 화면
	 * @return
	 */
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
	@RequestMapping("/comm/saveVote.do")
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
	@RequestMapping("/comm/clickVote.do")
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
	
	/**
	 * 커뮤니티 댓글 작성 화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/comment.do")
	public String commentPage(@RequestParam Map params, Model model) {
		log.info("모달창 진입");
		List<Map> list = commService.getCommentList(params);
		
		model.addAttribute("list", list);
		model.addAttribute("params", params);
		
		return "/modal/community/commentPage";
	}
	
	/**
	 * 커뮤니티 댓글 저장
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/saveComment.do")
	public String saveComment(@RequestParam Map params, Model model) {
		try {
			String writer = (String) params.get("writer");
			if (StringUtils.isBlank(writer)) {
				UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
				params.put("writer", loginUser.getEmailId());
			}
			
			commService.saveComment(params);
			
			model.addAttribute("resultCode", "success");
			model.addAttribute("commId", params.get("comm_id"));
			
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 커뮤니티 댓글 삭제
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/deleteComment.do")
	public String deleteComment(@RequestParam Map params, Model model) {
		try {
			commService.deleteComment(params);
			
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 좋아요 또는 싫어요 저장
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/saveLike.do")
	public String saveLike(@RequestParam Map params, Model model) {
		try {
			UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
			params.put("loginEmailId", loginUser.getEmailId());
			
			commService.saveLike(params);
			
			model.addAttribute("resultCode", "success");
			
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 월드컵 참여 화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/world/play/playWorld.do")
	public String playWorld(@RequestParam Map params, Model model) {
		
		model.addAttribute("community", commService.getWorldInfo(params));
		
		List<Integer> imageIdList = commService.getWorldImageId(params);
		Integer[] intArray = new Integer[imageIdList.size()];
		model.addAttribute("imageIdList", RandomUtil.mix(imageIdList.toArray(intArray)));
		
		return "/community/world/play/playWorld";
	}
	
	@RequestMapping("/comm/world/play/worldInfo.do")
	public String worldInfo(@RequestParam Map params, Model model) {
		try {
			model.addAttribute("world", commService.getWorldImageInfo(params));
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		return Constants.VIEW_NAME_JSON;
	}
	
	@RequestMapping("/comm/world/play/saveWorld.do")
	public String saveWorldResult(@RequestParam Map params, Model model) {
		
		UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
		params.put("loginEmailId", loginUser.getEmailId());
		
		commService.saveResult(params);
		
		commService.saveResultUserInfo(params);
		
		model.addAllAttributes(params);
		
		return "redirect:/comm/world/play/viewResult.do";
	}
	
	/**
	 * 월드컵 참여 결과 화면
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/comm/world/play/viewResult.do")
	public String resultPage(@RequestParam Map params, Model model) {
		
		UserVO loginUser = (UserVO) EgovUserDetailsHelper.getAuthenticatedUser();
		params.put("loginEmailId", loginUser.getEmailId());
		
		Map imageInfo = commService.getWorldImageInfo(params);
		
		Map worldInfo = commService.getWorldInfo(params);
		
		model.addAttribute("imageInfo", imageInfo);
		model.addAttribute("worldInfo", worldInfo);
		model.addAttribute("params", params);
		
		return "/community/world/resultPage";
	}
}
