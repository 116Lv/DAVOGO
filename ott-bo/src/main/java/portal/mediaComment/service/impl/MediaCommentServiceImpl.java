package portal.mediaComment.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.mediaComment.mapper.MediaCommentMapper;
import portal.mediaComment.service.MediaCommentService;

@Service
public class MediaCommentServiceImpl implements MediaCommentService{

	@Autowired
	private MediaCommentMapper mediaCommentMapper;

	@Override
	public List<Map> findMediaCommentList(Map params) {
		return mediaCommentMapper.findMediaCommentList(params);
	}

	@Override
	public int getCountOfMediaCommentList(Map params) {
		return mediaCommentMapper.getCountOfMediaCommentList(params);
	}

	@Override
	public Map getMediaComment(Map params) {
		return mediaCommentMapper.getMediaComment(params);
	}

	@Override
	public void updateHide(Map params) {
		mediaCommentMapper.updateHide(params);
	}
	
}
