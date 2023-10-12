package portal.community.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface CommMapper {

	public List<Map> getCommunityList(Map params);

	public int getCountOfCommList(Map params);

	public void updateHide(Map params);

	public Map getCommInfo(Map params);

	public int getCommDiv(Map params);

	public List<Map> getVoteItem(Map params);

	public List<Map> getWorldItem(Map params);

}
