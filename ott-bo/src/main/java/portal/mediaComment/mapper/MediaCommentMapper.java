package portal.mediaComment.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MediaCommentMapper {

	public List<Map> findMediaCommentList(Map params);

	public int getCountOfMediaCommentList(Map params);

}
