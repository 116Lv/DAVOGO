package portal.review.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portal.review.mapper.ReviewMapper;
import portal.review.service.ReviewService;


@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper reviewmapper;

	@Override
	public List<Map<String, Object>> findReviewList(Map<String, Object> params) {
		return reviewmapper.findReviewList(params);
	}

	@Override
	public int getCountOfReviewList(Map<String, Object> params) {
		return reviewmapper.getCountOfReviewList(params);
	}

}
