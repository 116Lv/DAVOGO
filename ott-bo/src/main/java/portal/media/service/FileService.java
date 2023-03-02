package portal.media.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	public void fileUpload(List<MultipartFile> fileList, String savePath, String mediaId, String mediaType) throws Exception;

	public List<Map<String, Object>> getFileList(Map<String, String> searchParam);
	
	public void deleteFile(String fileId);
	
}
