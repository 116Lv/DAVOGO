package portal.community.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface CommMapper {

	public List<Map> getCommunityList(Map params);
	
	public void saveVote(Map params);

	public void saveVoteItem(Map params);

	public void saveVoteClick(Map params);

	public List<Map> getVoteItems(Map params);

	public Map getUserVoteInfo(Map params);

	public void insertVoteUser(Map params);
	
	public void deleteVoteUser(Map params);
	
	public void updateVoteUser(Map params);
	
	public void saveComment(Map params);

	public void deleteComment(Map params);

	public List<Map> getCommentList(Map params);

	public int getCommentCnt();
	
	public String getCommLike(Map params);
	
	public void insertCommLike(Map params);
	
	public void updateCommLike(Map params);
	
	public void deleteCommLike(Map params);
	
	public void updateCommunityForLike(Map params);

	public Map getWorldInfo(Map params);
	
	public void insertWorldInfo(Map params);

	public void insertWorld(Map params);

	public void insertWorldImage(Map params);

	public List<Map> getWorldImages(Map map);

	public List<Map> getWorldImageList(Map params);
	
	public List<Integer> getWorldImageId(Map params);

	public int getWorldImageCount(Map params);

	public Map getWorldImageInfo(Map params);

	public void saveResult(Map params);

	public void saveResultUserInfo(Map params);

}
