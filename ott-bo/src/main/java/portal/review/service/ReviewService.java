package portal.review.service;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	public List<Map<String, Object>> findReviewList(Map<String, Object> params);

	public int getCountOfReviewList(Map<String, Object> params);

}
