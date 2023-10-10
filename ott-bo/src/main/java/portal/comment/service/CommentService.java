package portal.comment.service;

import java.util.List;
import java.util.Map;

public interface CommentService {

	public List<Map<String, Object>> findCommentList(Map<String, Object> params);

	public int getCountOfCommentList(Map<String, Object> params);

}
