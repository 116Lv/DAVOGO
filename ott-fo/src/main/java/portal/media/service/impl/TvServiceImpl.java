package portal.media.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.media.mapper.TvMapper;
import portal.media.service.TvService;

@Service
public class TvServiceImpl implements TvService{

	@Autowired
	private TvMapper tvMapper;

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
	public List<Map> getCategoryInfoList(String params) {
		return tvMapper.getCategoryInfoList(params);
	}
	
	
}
