package portal.media.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.media.mapper.MovieMapper;
import portal.media.service.MovieService;

@Service
public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieMapper movieMapper;
	
	
}
