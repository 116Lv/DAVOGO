package portal.code.web;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import portal.code.service.CodeService;
import portal.common.util.PaginationUtil;

@Controller
public class CodeController {

	@Autowired
	private CodeService codeService;
	
	@RequestMapping("/code.do")
	public String codelist(@RequestParam Map<String,Object> params, Model model) throws Exception {
		
		//최초 진입시 정렬조건 초기셋팅
		if (!params.containsKey("orderColumn")) {
			params.put("orderColumn", "code");
			params.put("orderType", "DESC");
		}
		
		PaginationInfo pagination = PaginationUtil.setPaginationInfo(params);
	
		List<Map<String, Object>> list = codeService.findCodeList(params);
		
		//page번호 계산을 위해 목록 건수를 pagination에 넣어줌
		if (list != null && !list.isEmpty()) {
			pagination.setTotalRecordCount(codeService.getCountOfCodeList(params));
		} else {
			pagination.setTotalRecordCount(0);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("searchParams", params);
		
		return "/code/codeList";
	}
	
	@RequestMapping("/code/view.do")
	public String codeRead(@RequestParam("code") String id, Model model) {
		
		model.addAttribute("item", codeService.getCodeInfo(id));
		
		return "/code/codeRead";
	}
	
	@RequestMapping("/code/edit.do")
	public String codeEdit(@RequestParam(name="code", required=false) String id, Model model) {
		
		if (StringUtils.isNotBlank(id)) {
			model.addAttribute("item", codeService.getCodeInfo(id));
		}
		
		return "/code/codeWrite";
	}

	@RequestMapping("/code/save.do")
	public String CodeSave(@RequestParam Map<String, String> params) {
		
		codeService.saveInfo(params);
		
		return "redirect:/code.do";
	}
	
}