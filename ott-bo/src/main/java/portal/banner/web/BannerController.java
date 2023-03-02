package portal.banner.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import portal.banner.service.BannerService;
import portal.common.util.PaginationUtil;

@Controller
public class BannerController {

	@Autowired
	private BannerService bannerService;
	
	@RequestMapping("/banner.do")
	public String bannerList(@RequestParam Map<String, Object> params, Model model) throws Exception {
		
		PaginationInfo pagination = PaginationUtil.setPaginationInfo(params);
		
		List<Map<String, Object>> list = bannerService.findBannerList(params);
		
		//page번호 계산을 위해 목록 건수를 pagination에 넣어줌
		if (list != null && !list.isEmpty()) {
			pagination.setTotalRecordCount(bannerService.getCountOfBannerList(params));
		} else {
			pagination.setTotalRecordCount(0);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("searchParams", params);
		
		return "/banner/bannerList";
	}
	
	@RequestMapping("/banner/edit.do")
	public String movieEdit(@RequestParam(name="banner_id", required=false) String id, Model model) {
		
		if (StringUtils.isNotBlank(id)) {
			model.addAttribute("item", bannerService.getBannerInfo(id));
		}
		
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("id", id);
		
		model.addAttribute("bannerList", bannerService.getFileList(searchParam));
		
		return "/banner/bannerWrite";
	}
	
	@RequestMapping("/banner/save.do")
	public String movieSave(@RequestParam Map<String, String> params, MultipartHttpServletRequest request, Model model) {
		
		List<MultipartFile> bannerFileList = request.getFiles("banner");
		
		try {
			bannerService.saveInfo(params, bannerFileList);
		} catch (Exception e) {
			model.addAttribute("message", "오류가 발생하였습니다. 다시 시도해주시기 바랍니다.");
			model.addAttribute("item", params);
			return "/banner/bannerWrite";
		}
		
		return "redirect:/banner.do";
	}
}
