package portal.media.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface FileMapper {

	public void insertFile(Map<String, String> fileInfo);

	public List<Map<String, Object>> getFileList(Map<String, String> searchParam);

	public Map<String, String> getFile(String fileId);

	public void deleteFileInfo(String fileId);

}
