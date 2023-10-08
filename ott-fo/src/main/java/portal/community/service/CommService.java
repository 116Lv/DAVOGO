package portal.community.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface CommService {

	public List<Map> getCommunityList(Map params);

	public void saveVote(Map params);

	public void saveVoteClick(Map params);

	public List<Map> getVoteItems(Map params);

	public void saveComment(Map params);

	public void deleteComment(Map params);

	public List<Map> getCommentList(Map params);

	public int getCommentCnt();

	public void saveLike(Map params);

	public void insertWorldInfo(Map params);

	public void insertWorldImage(Map params, MultipartFile file) throws Exception;

	public void insertWorld(Map params);

	public List<Map> getWorldImageList(Map params);

	public int getWorldImageCount(Map params);

	public List<Integer> getWorldImageId(Map params);

	public Map getWorldImageInfo(Map params);

	public Map getWorldInfo(Map params);

	public void saveResult(Map params);

	public void saveResultUserInfo(Map params);

}
