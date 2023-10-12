package portal.comment.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.comment.mapper.CommentMapper;
import portal.comment.service.CommentService;


@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentMapper commentMapper;

	@Override
	public List<Map<String, Object>> findCommentList(Map<String, Object> params) {
		return commentMapper.findCommentList(params);
	}

	@Override
	public int getCountOfCommentList(Map<String, Object> params) {
		return commentMapper.getCountOfCommentList(params);
	}

	@Override
	public Map getCommentInfo(Map params) {
		return commentMapper.getCommentInfo(params);
	}

	@Override
	public void updateHide(Map params) {
		commentMapper.updateHide(params);
	}

}
