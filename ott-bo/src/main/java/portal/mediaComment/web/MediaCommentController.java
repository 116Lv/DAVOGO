package portal.mediaComment.web;

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
import portal.mediaComment.service.MediaCommentService;

@Controller
public class MediaCommentController {

	@Autowired
	private MediaCommentService mediaCommentService;
	
	@RequestMapping("/mediaComment.do")
	public String commentList(@RequestParam Map params, Model model) throws Exception {
		PaginationInfo pagination = PaginationUtil.setPaginationInfo(params);
		
		List<Map> list = mediaCommentService.findMediaCommentList(params);
		
		//page번호 계산을 위해 목록 건수를 pagination에 넣어줌
		if (list != null && !list.isEmpty()) {
			pagination.setTotalRecordCount(mediaCommentService.getCountOfMediaCommentList(params));
		} else {
			pagination.setTotalRecordCount(0);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("searchParams", params);
		
		return "/mediaComment/mediaCommentList";
	}
	
	@RequestMapping("/mediaComment/view.do")
	public String viewMediaComment(@RequestParam Map params, Model model) {
			
		Map item = mediaCommentService.getMediaComment(params);
		
		model.addAttribute("item", item);
		
		return "/mediaComment/mediaCommentRead";
	}
	
	@RequestMapping("/mediaComment/hide.do")
	public String hideMediaComment(@RequestParam Map params, Model model) {
		
		mediaCommentService.updateHide(params);
		
		return Constants.VIEW_NAME_JSON;
	}
	
}
