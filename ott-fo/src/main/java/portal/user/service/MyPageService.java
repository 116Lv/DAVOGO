package portal.user.service;

import java.util.List;
import java.util.Map;

public interface MyPageService {

	public void saveUserInfo(Map params);

	public List<Map> getUserMediaComment(Map params);

	public Map getMediaCommentInfo(Map params);

	public void updateMediaComment(Map params);

	public void deleteMediaComment(Map params);

	public List<Map> getUserCommunity(Map params);

	public void deleteComm(Map params);

	public List<Map> getUserComment(Map params);

	public void deleteComment(Map params);

}
