package portal.community.service;

import java.util.List;
import java.util.Map;

public interface CommService {

	public void saveVote(Map params);

	public List<Map> getCommunityList(Map params);

	public void saveVoteClick(Map params);

	public List<Map> getVoteItems(Map params);

	
}
