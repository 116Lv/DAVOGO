package portal.user.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.user.mapper.MyPageMapper;
import portal.user.service.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper myPageMapper;
	
	@Override
	public void saveUserInfo(Map params) {
		
		Map userInfo = myPageMapper.getUserInfo(params);
		
		if (userInfo == null) {
			throw new RuntimeException("현재비밀번호 불일치");
		}
		
		params.put("userId", userInfo.get("userId"));
		
		myPageMapper.updateUserPassword(params);
		
	}

	@Override
	public List<Map> getUserMediaComment(Map params) {
		return myPageMapper.getUserMediaComment(params);
	}

	@Override
	public Map getMediaCommentInfo(Map params) {
		return myPageMapper.getMediaCommentInfo(params);
	}

	@Override
	public void updateMediaComment(Map params) {
		myPageMapper.updateMediaComment(params);
	}

	@Override
	public void deleteMediaComment(Map params) {
		myPageMapper.deleteMediaComment(params);
	}

	@Override
	public List<Map> getUserCommunity(Map params) {
		return myPageMapper.getUserCommunity(params);
	}

	@Override
	public void deleteComm(Map params) {
		if(params.get("comm_div").equals(1)) {
			
			List<Map> list = myPageMapper.findVoteIdList(params);
			
			for(Map map : list) {
				
				Integer voteId = (Integer) map.get("voteId");
				
				myPageMapper.deleteVoteUser(voteId);
				
			}
			myPageMapper.deleteVote(params);
			
		} else {
			List<Map> list = myPageMapper.findWorldIdList(params);
			
			for(Map map : list) {
				
				Integer worldId = (Integer) map.get("worldId");
				
				myPageMapper.deleteWorldUser(worldId);
				
			}
			myPageMapper.deleteWorld(params);
			
		}
		
		myPageMapper.deleteCommComment(params);
		
		myPageMapper.deleteComm(params);
	}

	@Override
	public List<Map> getUserComment(Map params) {
		return myPageMapper.getUserComment(params);
	}

	@Override
	public void deleteComment(Map params) {
		myPageMapper.deleteComment(params);
	}

}
