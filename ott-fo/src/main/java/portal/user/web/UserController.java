/**
 * 
 */
package portal.user.web;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import portal.common.Constants;
import portal.common.util.PaginationUtil;
import portal.user.service.UserService;

/**
 * 직원 관리
 * @author 116Lv
 *
 */
@Controller
public class UserController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserService userService;
	
	/**
	 * 직원 목록 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/list.do")
	public String list(ModelMap model) {
		return "/user/userList";
	}
	
	/**
	 * 직원 목록 json data
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/userListData.do")
	public String userListData(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		
		PaginationInfo pagination = PaginationUtil.setPaginationInfo(params);
		
		List<Map<String, Object>> list = userService.findUserList(params);
		
		if (list != null && !list.isEmpty()) {
			pagination.setTotalRecordCount(userService.getCountOfFindUserList(params));
		} else {
			pagination.setTotalRecordCount(0);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 직원 등록/수정 화면
	 * @param userNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/edit.do")
	public String edit(@RequestParam(value="userNo", required=false) String userNo, ModelMap model) throws Exception {
		
		//수정이면
		if (StringUtils.isNotBlank(userNo)) {
		
			logger.debug("user edit id=", userNo);
			
			//기본정보
			Map<String, String> userInfo = userService.getUser(userNo);
			if (userInfo == null || userInfo.isEmpty())  {
				throw new EgovBizException("잘못된 접근입니다.");
			}
			model.addAttribute("user", userInfo);
			
		}
		
		return "/user/userEdit";
	}
	
	/**
	 * 직원 조회 화면
	 * @param userNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/view.do")
	public String view(@RequestParam("userNo") String userNo, ModelMap model) throws Exception {

		logger.debug("user view id=", userNo);
		
		Map<String, String> userInfo = userService.getUser(userNo);
		
		if (userInfo == null || userInfo.isEmpty())  {
			throw new EgovBizException("잘못된 접근입니다.");
		}
			
		model.addAttribute("user", userInfo);
		
		return "/user/userView";
	}
	
	/**
	 * 연차 내역 조회
	 * @param params
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/findUsedAnnualList.do")
	public String findUsedAnnualList(@RequestParam Map<String, String> params, ModelMap model) {
		
		//연차 내역
		model.addAttribute("list", userService.findUsedAnnualList(params));
		
		//연차 요약정보
		model.addAttribute("summary", userService.getUserAnnualSummary(params));
		
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 직원ID 중복체크를 위한 사용 갯수 조회
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/checkDupUserId.do")
	public String checkDupUserId(@RequestParam("userId") String userId, ModelMap model) {
		
		model.addAttribute(userService.findUserId(userId) == 0);
			
		return Constants.VIEW_NAME_JSON_WITHOUT_KEYNAME;
	}
	
	/**
	 * 직원정보 저장
	 * @param userInfo
	 * @return
	 */
	@RequestMapping("/user/saveUser.do")
	public String saveUser(@RequestParam Map<String, String> userInfo, ModelMap model) {

		try {
			//TODO 사용자 번호 넣기
			userInfo.put("regUserNo", "1");
			
			userService.saveUser(userInfo);
			
			model.addAttribute("userNo", userInfo.get("userNo"));
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 연차정보 등록
	 * @return
	 */
	@RequestMapping("/user/saveAnnualInfo.do")
	public String saveAnnualInfo(@RequestParam Map<String, String> annualInfo, ModelMap model) {
		
		try {
			//TODO 사용자 번호 넣기
			annualInfo.put("regUserNo", "1");
			
			userService.saveAnnualInfo(annualInfo);
			
			model.addAttribute("annualNo", annualInfo.get("annualNo"));
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 연차정보 삭제
	 * @return
	 */
	@RequestMapping("/user/deleteAnnualInfo.do")
	public String deleteAnnualInfo(@RequestParam("annualNo") String annualNo, ModelMap model) {
		
		try {
			userService.deleteAnnualInfo(annualNo);
			
			model.addAttribute("resultCode", "success");
		} catch (Exception e) {
			model.addAttribute("resultCode", "fail");
			model.addAttribute("resultMessage", e.getMessage());
		}
		
		return Constants.VIEW_NAME_JSON;
	}
	
	/**
	 * 직원 검색 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/search.do")
	public String userSearch(ModelMap model) {
		return "/modal/user/userSearch";
	}
	
}
