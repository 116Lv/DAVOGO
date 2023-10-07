package portal.main.service;

import java.util.List;
import java.util.Map;

public interface MainService {

	public List<Map> getCategoryList();

	public List<Map> getContentsList(Map map);

	public List<Map> getContentSearchList(Map params);
	
}
