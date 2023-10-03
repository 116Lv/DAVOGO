package portal.media.service;

import java.util.List;
import java.util.Map;

public interface TvService {

	public List<Map> getCategoryList();

	public List<Map> getContentsList(Map map);

}
