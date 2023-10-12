package portal.mediaComment.service;

import java.util.List;
import java.util.Map;

public interface MediaCommentService {

	public List<Map> findMediaCommentList(Map params);

	public int getCountOfMediaCommentList(Map params);

	public Map getMediaComment(Map params);

	public void updateHide(Map params);

}
