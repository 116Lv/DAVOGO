package portal.banner.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface BannerMapper {

	public List<Map<String, Object>> findBannerList(Map<String, Object> params);

	public int getCountOfBannerList(Map<String, Object> params);

	public Map<String, Object> getBannerInfo(String id);

	public List<Map<String, Object>> getFileList(Map<String, String> searchParam);

	public void insertSaveInfo(Map<String, String> params);

	public void updateSaveInfo(Map<String, String> params);

}
