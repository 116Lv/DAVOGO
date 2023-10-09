package portal.media.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.media.mapper.MovieMapper;
import portal.media.mapper.TvMapper;
import portal.media.service.MovieService;

@Service
public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieMapper movieMapper;

	@Autowired
	private TvMapper tvMapper;
	
	@Override
	public List<Map> getMovieInfoList(Map params) {
		return movieMapper.getMovieInfoList(params);
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
	public List<Map> getCommentList(Map params) {
		return movieMapper.getCommentList(params);
	}

	@Override
	public void saveMediaComment(Map params) {
		movieMapper.saveMediaComment(params);
	}
	
	
}
