package portal.main.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.community.mapper.CommMapper;
import portal.main.mapper.MainMapper;
import portal.main.service.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mainMapper;
	
	@Autowired
	private CommMapper commMapper;
	
	@Override
	public List<Map> getCategoryList() {
		return mainMapper.getCategoryList();
	}

	@Override
	public List<Map> getContentsList(Map map) {
		return mainMapper.getContentsList(map);
	}

	@Override
	public List<Map> getContentSearchList(Map params) {
		return mainMapper.getContentSearchList(params);
	}

	@Override
	public List<Map> getMainMovieList() {
		return mainMapper.getMainMovieList();
	}

	@Override
	public List<Map> getCommunityList(Map params) {
		
		List<Map> list = mainMapper.getCommunityList(params);
		
		for (Map map : list) {
			Integer commDiv = (Integer) map.get("commDiv");
			
			map.put("loginEmailId", params.get("loginEmailId"));
			
			//투표
			if (commDiv == 1) {
				map.put("items", commMapper.getVoteItems(map));
				
				//월드컵
			} else if (commDiv == 2) {
				map.put("limit", 2);
				map.put("items", commMapper.getWorldImages(map));
			}
		}
		
		return list;
	}

}
