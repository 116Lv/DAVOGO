package portal.media.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import portal.common.util.DateUtil;
import portal.common.util.FileUtil;
import portal.media.mapper.FileMapper;
import portal.media.service.FileService;

@Service
public class FileServiceImpl implements FileService {

	@Value("${file.storePath}")
    private String fileStorePath;
	
	@Autowired
	private FileMapper mapper;
	
	public void fileUpload(List<MultipartFile> fileList, String savePath, String mediaId, String mediaType) throws Exception {
		
		if (fileList == null || fileList.isEmpty())
			return;
		
		String orgFileName = null;
		String thumbFullFileName = null;
		Map<String, String> fileInfo = new HashMap<String, String>();
		
		for (MultipartFile file : fileList) {
			
			orgFileName = file.getOriginalFilename();
			if (StringUtils.isBlank(orgFileName)) 
				continue;
			
			String fileExt = orgFileName.substring(orgFileName.lastIndexOf(".") + 1).toLowerCase();
			
			String prefixFileName = DateUtil.getCurrentDate(DateUtil.YMDHMSS);
			
			String fullPath = fileStorePath + savePath + mediaId;
			
			String fileName = prefixFileName + "." + fileExt;
			
			String fullFileName = fullPath + FileUtil.separator + fileName;
			
			FileUtil.uploadFile(file, fullPath, fileName);
			
			String thumbFileName = prefixFileName + "_thumb." + fileExt;
			thumbFullFileName = fullPath + FileUtil.separator + thumbFileName;
			FileUtil.createThumbnail(fullFileName, thumbFullFileName, 400);
			
			fileInfo.put("mediaId", mediaId);
			fileInfo.put("mediaType", mediaType);
			fileInfo.put("fullPath", fullPath);
			fileInfo.put("fname", fileName);
			fileInfo.put("tname", thumbFileName);
			fileInfo.put("orgFile", orgFileName);
			
			mapper.insertFile(fileInfo);
		}
	}

	@Override
	public List<Map<String, Object>> getFileList(Map<String, String> searchParam) {
		return mapper.getFileList(searchParam);
	}

	@Override
	public void deleteFile(String fileId) {
		
		Map<String, String> fileInfo = mapper.getFile(fileId);
		//물리적 파일 삭제 - file 정보를 조회해서 fullpath로 FileUtil.deleteFile 수행
		FileUtil.deleteFile(fileInfo.get("fullFilePath"));
		FileUtil.deleteFile(fileInfo.get("fullThumbPath"));
		
		//db data 삭제 - delete statement 실행
		mapper.deleteFileInfo(fileId);
	}

	
}
