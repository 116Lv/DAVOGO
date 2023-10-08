package portal.media.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface TvMapper {

	public List<Map> getCategoryList();

	public List<Map> getContentsList(Map map);

	public Map getContent(Map params);

	public Map getImage(Map params);

	public List<Map> getCategoryInfoList(Map params);

	public List<Map> getCommentList(Map params);

	public void saveComment(Map params);


	
}
