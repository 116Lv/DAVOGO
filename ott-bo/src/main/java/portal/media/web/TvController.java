package portal.media.web;

import java.io.IOException;
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

import portal.common.util.PaginationUtil;
import portal.media.service.FileService;
import portal.media.service.MediaService;

@Controller
public class TvController {
	
	@Autowired
	private MediaService mediaService;
	
	@Autowired
	private FileService fileService;
	
	@RequestMapping("/tv.do")
	public String tvlist(@RequestParam Map<String, Object> params, Model model) throws Exception {
		
		PaginationInfo pagination = PaginationUtil.setPaginationInfo(params);
		
		params.put("media_div", "2");
		
		List<Map<String, Object>> list = mediaService.findMediaList(params);
		
		//page번호 계산을 위해 목록 건수를 pagination에 넣어줌
		if (list != null && !list.isEmpty()) {
			pagination.setTotalRecordCount(mediaService.getCountOfMediaList(params));
		} else {
			pagination.setTotalRecordCount(0);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("searchParams", params);
		
		return "/tv/tvList";
	}
	
	@RequestMapping("/tv/view.do")
	public String tvRead(@RequestParam("media_id") String id, Model model) {
		
		model.addAttribute("item", mediaService.getMediaInfo(id));
		
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("id", id);
		//poster
		searchParam.put("file_div", "poster");
		model.addAttribute("posterList", fileService.getFileList(searchParam));
		//ads
		searchParam.put("file_div", "ads");
		model.addAttribute("adsList", fileService.getFileList(searchParam));
		
		return "/tv/tvRead";
	}
	
	@RequestMapping("/tv/edit.do")
	public String tvEdit(@RequestParam(name="media_id", required=false) String id, Model model) {
		
		if (StringUtils.isNotBlank(id)) {
			model.addAttribute("item", mediaService.getMediaInfo(id));
		}
		
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("id", id);
		//poster
		searchParam.put("file_div", "poster");
		model.addAttribute("posterList", fileService.getFileList(searchParam));
		//ads
		searchParam.put("file_div", "ads");
		model.addAttribute("adsList", fileService.getFileList(searchParam));
		
		return "/tv/tvWrite";
	}
	
	@RequestMapping("/tv/save.do")
	public String tvSave(@RequestParam Map<String, String> params, MultipartHttpServletRequest request, Model model) {
		
		List<MultipartFile> posterFileList = request.getFiles("poster");
		List<MultipartFile> adsFileList = request.getFiles("ads");
		params.put("media_divnm", "tv");
		
		try {
			mediaService.saveInfo(params, posterFileList, adsFileList);
		} catch (IOException e) {
			model.addAttribute("message", "파일 저장 중 오류가 발생하였습니다. 다시 시도해주시기 바랍니다.");
			model.addAttribute("item", params);
			return "/tv/tvWrite";
			
		} catch (Exception e) {
			model.addAttribute("message", "오류가 발생하였습니다. 다시 시도해주시기 바랍니다.");
			model.addAttribute("item", params);
			return "/tv/tvWrite";
		}
		
		
		return "redirect:/tv.do";
	}
	
	
	
	
}