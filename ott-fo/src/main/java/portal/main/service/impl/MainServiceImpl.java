package portal.main.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.main.mapper.MainMapper;
import portal.main.service.MainService;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mainMapper;
	
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

}
