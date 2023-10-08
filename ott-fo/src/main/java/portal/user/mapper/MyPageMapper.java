package portal.user.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MyPageMapper {

	public Map getUserInfo(Map params);

	public void updateUserPassword(Map params);
	
	public List<Map> getMyCommunityList(Map params);

	public List<Map> getUserMediaComment(Map params);

	public Map getMediaCommentInfo(Map params);

	public void updateMediaComment(Map params);

	public void deleteMediaComment(Map params);

	public List<Map> getUserCommunity(Map params);

	public List<Map> findVoteIdList(Map params);
	
	public void deleteVoteUser(Integer voteId);
	
	public void deleteVote(Map params);

	public List<Map> findWorldIdList(Map params);
	
	public void deleteWorldUser(Integer worldId);
	
	public void deleteWorld(Map params);

	public void deleteCommComment(Map params);

	public void deleteComm(Map params);

	public List<Map> getUserComment(Map params);

	public void deleteComment(Map params);

}
