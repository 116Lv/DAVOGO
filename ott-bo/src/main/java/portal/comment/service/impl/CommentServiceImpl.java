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
	private CommentMapper commentmapper;

	@Override
	public List<Map<String, Object>> findCommentList(Map<String, Object> params) {
		return commentmapper.findCommentList(params);
	}

	@Override
	public int getCountOfCommentList(Map<String, Object> params) {
		return commentmapper.getCountOfCommentList(params);
	}

}
