package portal.media.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.media.mapper.TvMapper;
import portal.media.service.TvService;
import portal.user.mapper.MyPageMapper;

@Service
public class TvServiceImpl implements TvService{

	@Autowired
	private TvMapper tvMapper;
	
	@Autowired
	private MyPageMapper myPageMapper;

	@Override
	public List<Map> getCategoryList() {
		return tvMapper.getCategoryList();
	}

	@Override
	public List<Map> getContentsList(Map map) {
		return tvMapper.getContentsList(map);
	}

	@Override
	public Map getContent(Map params) {
		return tvMapper.getContent(params);
	}

	@Override
	public Map getImage(Map params) {
		return tvMapper.getImage(params);
	}

	@Override
	public List<Map> getCategoryInfoList(Map params) {
		return tvMapper.getCategoryInfoList(params);
	}

	@Override
	public List<Map> getCommentList(Map params) {
		return tvMapper.getCommentList(params);
	}

	@Override
	public void saveMediaComment(Map params) {
		
		//이미 자신이 등록된 comment가 있는지 조회
		Map commentInfo = tvMapper.getMyMediaCommentInfo(params);
		
		if (commentInfo == null) {
			tvMapper.insertMediaComment(params);
		} else {
			params.put("comment_id", commentInfo.get("commentId"));
			myPageMapper.updateMediaComment(params);
		}
		
	}

	@Override
	public Map getMyMediaCommentInfo(Map params) {
		return tvMapper.getMyMediaCommentInfo(params);
	}
	
}
