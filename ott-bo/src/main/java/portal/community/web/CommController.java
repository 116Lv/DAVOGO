package portal.community.web;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import portal.common.util.PaginationUtil;
import portal.community.service.CommService;

@Controller
public class CommController {

	@Autowired
	private CommService commService;
	
	@RequestMapping("/comm.do")
	public String communityPage(@RequestParam Map params, Model model) throws Exception {
		
		PaginationInfo pagination = PaginationUtil.setPaginationInfo(params);
		
		List<Map> list = commService.getCommunityList(params);
		
		//page번호 계산을 위해 목록 건수를 pagination에 넣어줌
		if (list != null && !list.isEmpty()) {
			pagination.setTotalRecordCount(commService.getCountOfCommList(params));
		} else {
			pagination.setTotalRecordCount(0);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("searchParams", params);
		
		return "/community/commList";
	}
	
}
