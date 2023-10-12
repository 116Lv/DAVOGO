package portal.user.web;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import portal.common.Constants;
import portal.common.util.PaginationUtil;
import portal.user.service.UserService;


@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/user.do")
	public String userList(@RequestParam Map<String, Object> params, Model model) throws Exception {
		
		//최초 진입시 정렬조건 초기셋팅
		if (!params.containsKey("orderColumn")) {
			params.put("orderColumn", "signup_date");
			params.put("orderType", "DESC");
		}
				
		PaginationInfo pagination = PaginationUtil.setPaginationInfo(params);
		
		List<Map<String, Object>> list = userService.findUserList(params);
		
		if (list != null && !list.isEmpty()) {
			pagination.setTotalRecordCount(userService.getCountOfUserList(params));
		} else {
			pagination.setTotalRecordCount(0);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("searchParams", params);
		
		return "/user/userList";
	}
	
	@RequestMapping("/user/hide.do")
	public String updateHide(@RequestParam Map params, Model model) {
		
		userService.updateHide(params);
		
		return Constants.VIEW_NAME_JSON;
	}
	
	
}