package portal.comment.web;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import portal.comment.service.CommentService;
import portal.common.Constants;
import portal.common.util.PaginationUtil;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/comment.do")
	public String commentList(@RequestParam Map<String, Object> params, Model model) throws Exception {
			
		PaginationInfo pagination = PaginationUtil.setPaginationInfo(params);
		
		List<Map<String, Object>> list = commentService.findCommentList(params);
		
		//page번호 계산을 위해 목록 건수를 pagination에 넣어줌
		if (list != null && !list.isEmpty()) {
			pagination.setTotalRecordCount(commentService.getCountOfCommentList(params));
		} else {
			pagination.setTotalRecordCount(0);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("searchParams", params);
		
		return "/comment/commentList";
	}
	
	@RequestMapping("/comment/view.do")
	public String viewComment(@RequestParam Map params, Model model) {
		
		Map item = commentService.getCommentInfo(params);
		
		model.addAttribute("item", item);
		
		return "/comment/commentRead";
	}
	
	@RequestMapping("/comment/hide.do")
	public String updateHide(@RequestParam Map params, Model model) {
		
		commentService.updateHide(params);
		
		return Constants.VIEW_NAME_JSON;
	}
	
	
}
