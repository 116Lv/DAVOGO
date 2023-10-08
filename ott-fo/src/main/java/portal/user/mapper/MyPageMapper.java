package portal.user.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MyPageMapper {

	public Map getUserInfo(Map params);

	public void updateUserPassword(Map params);
	
	public List<Map> getMyCommunityList(Map params);
	

}
