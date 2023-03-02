package portal.media.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MediaMapper {

	public List<Map<String, Object>> findMediaList(Map<String, Object> params);

	public int getCountOfMediaList(Map<String, Object> params);

	public void insertSaveInfo(Map<String, String> params);

	public void updateSaveInfo(Map<String, String> params);

	public Map<String, Object> getMediaInfo(String id);

}
