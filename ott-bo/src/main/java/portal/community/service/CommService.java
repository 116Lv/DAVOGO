package portal.community.service;

import java.util.List;
import java.util.Map;

public interface CommService {

	public List<Map> getCommunityList(Map params);

	public int getCountOfCommList(Map params);

}
