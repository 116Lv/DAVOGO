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
public class MovieController {
	
	@Autowired
	private MediaService mediaService;
	
	@Autowired
	private FileService fileService;
	
	@RequestMapping("/movie.do")
	public String movieList(@RequestParam Map<String, Object> params, Model model) throws Exception {
		
		PaginationInfo pagination = PaginationUtil.setPaginationInfo(params);
		
		params.put("media_div", "1");
		
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
		
		return "/movie/movieList";
	}
	
	@RequestMapping("/movie/view.do")
	public String movieRead(@RequestParam("media_id") String id, Model model) {
		
		model.addAttribute("item", mediaService.getMediaInfo(id));
		
		Map<String, String> searchParam = new HashMap<String, String>();
		searchParam.put("id", id);
		//poster
		searchParam.put("file_div", "poster");
		model.addAttribute("posterList", fileService.getFileList(searchParam));
		//ads
		searchParam.put("file_div", "ads");
		model.addAttribute("adsList", fileService.getFileList(searchParam));
		
		return "/movie/movieRead";
	}
	
	@RequestMapping("/movie/edit.do")
	public String movieEdit(@RequestParam(name="media_id", required=false) String id, Model model) {
		
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
		
		return "/movie/movieWrite";
	}
	
	@RequestMapping("/movie/save.do")
	public String movieSave(@RequestParam Map<String, String> params, MultipartHttpServletRequest request, Model model) {
		
		List<MultipartFile> posterFileList = request.getFiles("poster");
		List<MultipartFile> adsFileList = request.getFiles("ads");
		params.put("media_divnm", "movie");
		
		try {
			mediaService.saveInfo(params, posterFileList, adsFileList);
		} catch (IOException e) {
			model.addAttribute("message", "파일 저장 중 오류가 발생하였습니다. 다시 시도해주시기 바랍니다.");
			model.addAttribute("item", params);
			return "/movie/movieWrite";
			
		} catch (Exception e) {
			model.addAttribute("message", "오류가 발생하였습니다. 다시 시도해주시기 바랍니다.");
			model.addAttribute("item", params);
			return "/movie/movieWrite";
		}
		
		return "redirect:/movie.do";
	}
}
