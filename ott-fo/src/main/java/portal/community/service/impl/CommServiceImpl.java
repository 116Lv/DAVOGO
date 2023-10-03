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
		
		commMapper.saveVoteClick(params);
	}

	@Override
	public List<Map> getVoteItems(Map params) {
		return commMapper.getVoteItems(params);
	}
	
	

}
