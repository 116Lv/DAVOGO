package portal.community.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.community.mapper.CommMapper;
import portal.community.service.CommService;

@Service
public class CommServiceImpl implements CommService{
	
	@Autowired
	private CommMapper commMapper;

	@Override
	public void saveVote(Map params) {
		
		commMapper.saveVote(params);
		
		if(params.containsKey("items") && params.get("items") != null) {
			String[] items = (String[]) params.get("items");
			for(String item : items) {
				params.put("item", item);
				commMapper.saveVoteItem(params);
			}
			
		}
	}

	@Override
	public List<Map> getCommunityList(Map params) {
		
		return commMapper.getCommunityList(params);
	}

	@Override
	public void saveVoteClick(Map params) {
		
		Map beforeVoteInfo = commMapper.getUserVoteInfo(params);
		
		//이전에 클릭한 정보가 없으면 
		if (beforeVoteInfo == null || beforeVoteInfo.isEmpty()) {
			//사용자 투표정보 insert 및 투표 수량 plus
			commMapper.insertVoteUser(params);
			
			params.put("action", "vote");
			commMapper.saveVoteClick(params);
			
		//이전에 클릭한 정보가 있으면
		} else {	
			Integer beforeVoteId = (Integer) beforeVoteInfo.get("voteId");
			Integer voteId = Integer.parseInt((String) params.get("voteId"));
			
			//클릭했던 정보가 현재 클릭한 번호와 동일할 경우
			if (beforeVoteId == voteId) {
				//클랙했던 사용자 투표정보 삭제 및 투표 수량 minus
				commMapper.deleteVoteUser(params);
				
				params.put("action", "cancel");
				commMapper.saveVoteClick(params);
			
			//클릭한 투표 정보를 변경한 경우
			} else {
				//클릭했던 사용자의 투표정보 업데이트
				params.put("beforeVoteId", beforeVoteId);
				commMapper.updateVoteUser(params);
				
				//새로 선택한 투표수량은 plus
				params.put("action", "vote");
				commMapper.saveVoteClick(params);
				
				//이전 투표한 수량은 minus
				beforeVoteInfo.put("action", "cancel");
				commMapper.saveVoteClick(beforeVoteInfo);
			}
			
		}
	}

	@Override
	public List<Map> getVoteItems(Map params) {
		return commMapper.getVoteItems(params);
	}
	
	@Override
	public void saveComment(Map params) {
		commMapper.saveComment(params);
	}

	@Override
	public void deleteComment(Map params) {
		commMapper.deleteComment(params);
	}

	@Override
	public List<Map> getCommentList(Map params) {
		return commMapper.getCommentList(params);
	}

	@Override
	public int getCommentCnt() {
		return commMapper.getCommentCnt();
	}

}
