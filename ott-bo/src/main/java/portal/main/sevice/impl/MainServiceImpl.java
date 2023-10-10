package portal.main.sevice.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.main.mapper.MainMapper;
import portal.main.sevice.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainMapper mainMapper;

	@Override
	public int getUserCount(Map<String, Object> params) {
		return mainMapper.getUserCount(params);
	}

	@Override
	public int getMovieCount(Map<String, Object> params) {
		return mainMapper.getMovieCount(params);
	}

	@Override
	public int getTvCount(Map<String, Object> params) {
		return mainMapper.getTvCount(params);
	}

	@Override
	public List<Map<String, Object>> getBoardInfo(Map<String, Object> params) {
		return mainMapper.getBoardInfo(params);
	}

	@Override
	public List<Map<String, Object>> getRecentMediaInfo(Map<String, Object> params) {
		return mainMapper.getRecentMediaInfo(params);
	}

	@Override
	public List<Map<String, Object>> getCommentList(Map<String, Object> params) {
		return mainMapper.getCommentList(params);
	}

}
