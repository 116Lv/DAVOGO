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
	public List<Map> getCommunityList(Map params) {
		return commMapper.getCommunityList(params);
	}

	@Override
	public int getCountOfCommList(Map params) {
		return commMapper.getCountOfCommList(params);
	}

	@Override
	public void updateHide(Map params) {
		commMapper.updateHide(params);
	}

	@Override
	public Map getCommInfo(Map params) {
		return commMapper.getCommInfo(params);
	}

	@Override
	public List<Map> getItemInfo(Map params) {
		
		int div = commMapper.getCommDiv(params);
		
		if(div == 1) {
			return commMapper.getVoteItem(params);
		} else {
			return commMapper.getWorldItem(params);
		}
	}
	
	
	
}
