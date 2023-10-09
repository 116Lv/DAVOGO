package portal.media.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.media.mapper.MovieMapper;
import portal.media.service.MovieService;

@Service
public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieMapper movieMapper;

	@Override
	public List<Map> getMovieInfoList(Map params) {
		return movieMapper.getMovieInfoList(params);
	}

	@Override
	public Map getContent(Map params) {
		return movieMapper.getContent(params);
	}

	@Override
	public Map getImage(Map params) {
		return movieMapper.getImage(params);
	}

	@Override
	public List<Map> getCommentList(Map params) {
		return movieMapper.getCommentList(params);
	}
	
	
}
