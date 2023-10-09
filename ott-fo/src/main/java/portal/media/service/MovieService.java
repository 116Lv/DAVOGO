package portal.media.service;

import java.util.List;
import java.util.Map;

public interface MovieService {

	public List<Map> getMovieInfoList(Map params);

	public Map getContent(Map params);

	public Map getImage(Map params);

	public List<Map> getCommentList(Map params);

	public void saveMediaComment(Map params);

}
