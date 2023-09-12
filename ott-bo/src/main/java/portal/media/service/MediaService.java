package portal.media.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface MediaService {

	public List<Map<String, Object>> findMediaList(Map<String, Object> params);

	public int getCountOfMediaList(Map<String, Object> params);
	
	public void saveInfo(Map<String, String> params, List<MultipartFile> posterFileList, List<MultipartFile> adsFileList) throws Exception;

	public Map<String, Object> getMediaInfo(String id);

	public void pullTvData() throws Exception;

}
