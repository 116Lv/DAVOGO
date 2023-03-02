package portal.review.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface ReviewMapper {

	public List<Map<String, Object>> findReviewList(Map<String, Object> params);

	public int getCountOfReviewList(Map<String, Object> params);

}
