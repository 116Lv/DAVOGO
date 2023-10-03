package portal.community.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface CommMapper {

	public void saveVote(Map params);

	public void saveVoteItem(Map params);

	public List<Map> getCommunityList(Map params);

	public void saveVoteClick(Map params);

	public List<Map> getVoteItems(Map params);

	
}
