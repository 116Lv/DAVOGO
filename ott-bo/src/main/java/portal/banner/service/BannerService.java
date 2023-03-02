package portal.banner.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface BannerService {

	public List<Map<String, Object>> findBannerList(Map<String, Object> params);

	public int getCountOfBannerList(Map<String, Object> params);

	public Map<String, Object> getBannerInfo(String id);

	public List<Map<String, Object>> getFileList(Map<String, String> searchParam);

	public void saveInfo(Map<String, String> params, List<MultipartFile> bannerFileList);

}
