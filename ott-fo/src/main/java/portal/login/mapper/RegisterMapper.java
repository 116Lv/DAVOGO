package portal.login.mapper;

import java.util.Map;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface RegisterMapper {
	
	public void insertUserInfo(Map<String, String> params);

	public int checkUserData(Map<String, String> params);
}
