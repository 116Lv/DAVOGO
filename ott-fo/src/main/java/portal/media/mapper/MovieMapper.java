package portal.media.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MovieMapper {

	public List<Map> getMovieInfoList(Map params);

	public List<Map> getCommentList(Map params);

	public void saveMediaComment(Map params);
	
}
