package portal.staff.web;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import portal.common.util.PaginationUtil;
import portal.staff.service.StaffService;

@Controller
public class StaffController {

	@Autowired
	private StaffService staffService;
	
	@RequestMapping("/staff.do")
	public String staffList(@RequestParam Map<String, Object> params, Model model) throws Exception {
		
		//최초 진입시 정렬조건 초기셋팅
		if (!params.containsKey("orderColumn")) {
			params.put("orderColumn", "staff_id");
			params.put("orderType", "DESC");
		}
		
		PaginationInfo pagination = PaginationUtil.setPaginationInfo(params);
		
		List<Map<String, Object>> list = staffService.findStaffList(params);
		
		if(list != null && !list.isEmpty()) {
			pagination.setTotalRecordCount(staffService.getCountOfStaffList(params));
		}else {
			pagination.setTotalRecordCount(0);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("searchParams", params);
		
		return "/staff/staffList";
	}
	
	@RequestMapping("/staff/view.do")
	public String staffRead(@RequestParam("staff_id") String id, Model model) {
		
		model.addAttribute("item", staffService.getStaffInfo(id));
		
		return "/staff/staffRead";
	}
	
	@RequestMapping("/staff/edit.do")
	public String staffEdit(@RequestParam(name="staff_id", required=false) String id, Model model) {
		
		if (StringUtils.isNotBlank(id)) {
			model.addAttribute("item", staffService.getStaffInfo(id));
		}
		
		return "/staff/staffWrite";
	}
	
	@RequestMapping("/staff/save.do")
	public String staffSave(@RequestParam Map<String, String> params) {
		
		
		staffService.saveInfo(params);
		
		
		return "redirect:/staff.do";
	}
}
