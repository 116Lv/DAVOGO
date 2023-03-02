package portal.board.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import portal.board.service.BoardService;
import portal.common.util.PaginationUtil;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board.do")
	public String boardList(@RequestParam Map<String, Object> params, Model model) throws Exception{
		
		PaginationInfo pagination = PaginationUtil.setPaginationInfo(params);
		
		List<Map<String, Object>> list = boardService.findBoardList(params);
		
		//page번호 계산을 위해 목록 건수를 pagination에 넣어줌
		if (list != null && !list.isEmpty()) {
			pagination.setTotalRecordCount(boardService.getCountOfBoardList(params));
		} else {
			pagination.setTotalRecordCount(0);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("searchParams", params);
		
		return "/board/boardList";
	}
	
	@RequestMapping("/board/view.do")
	public String movieRead(@RequestParam("board_id") String id, Model model) {
		
		model.addAttribute("item", boardService.getBoardInfo(id));
		
		return "/board/boardRead";
	}
	
	@RequestMapping("/board/edit.do")
	public String movieEdit(@RequestParam(name="board_id", required=false) String id, HttpSession session, Model model) {
		
		String writerId = boardService.getWriterInfo(id);
		
		Map<String, String> staffVO = (Map<String, String>) session.getAttribute("StaffVO");
		
		
		if (StringUtils.isNotBlank(id)) {
			
			if(StringUtils.isNotBlank(writerId) && writerId.equals(staffVO.get("staffId"))) {
				
				model.addAttribute("item", boardService.getBoardInfo(id));
			
			}else {
				
				model.addAttribute("message","작성자가 아니면 접근할수 없습니다.");
				
				return "/board/boardList";
			}
		}
		
		return "/board/boardWrite";
	}
	
	@RequestMapping("/board/save.do")
	public String movieSave(@RequestParam Map<String, String> params, Model model) {
		
		boardService.saveInfo(params);
		
		return "redirect:/board.do";
	}
}
