package portal.media.service;

import java.util.List;
import java.util.Map;

public interface TvService {

	public List<Map> getCategoryList();

	public List<Map> getContentsList(Map map);

	public Map getContent(Map params);

	public Map getImage(Map params);

	public List<Map> getCategoryInfoList(String params);

}
