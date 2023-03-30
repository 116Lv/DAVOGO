package portal.main.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MainMapper {

	public int getUserCount(Map<String, Object> params);

	public int getMovieCount(Map<String, Object> params);

	public int getTvCount(Map<String, Object> params);

	public List<Map<String, Object>> getBoardInfo(Map<String, Object> params);

	public List<Map<String, Object>> getRecentMediaInfo(Map<String, Object> params);

}
