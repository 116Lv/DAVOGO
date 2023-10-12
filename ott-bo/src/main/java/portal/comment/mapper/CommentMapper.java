package portal.comment.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface CommentMapper {
	
	public List<Map<String, Object>> findCommentList(Map<String, Object> params);

	public int getCountOfCommentList(Map<String, Object> params);

	public Map getCommentInfo(Map params);

	public void updateHide(Map params);

}
